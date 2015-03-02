package retouch


import org.codehaus.groovy.grails.web.mapping.UrlMapping
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.pages.TagLibraryLookup
import org.codehaus.groovy.grails.web.util.TypeConvertingMap
import org.springframework.web.servlet.support.RequestContextUtils
import org.springframework.beans.SimpleTypeConverter
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import org.codehaus.groovy.grails.commons.DomainClassArtefactHandler

class RetouchTagLib{
    static namespace = "retouch"
    //static defaultEncodeAs = [taglib:'html']
    TagLibraryLookup gspTagLibraryLookup
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    /**
     * Creates next/previous links to support pagination for the current controller.<br/>
     *
     * &lt;g:paginate total="${Account.count()}" /&gt;<br/>
     *
     * @emptyTag
     *
     * @attr total REQUIRED The total number of results to paginate
     * @attr action the name of the action to use in the link, if not specified the default action will be linked
     * @attr controller the name of the controller to use in the link, if not specified the current controller will be linked
     * @attr id The id to use in the link
     * @attr params A map containing request parameters
     * @attr prev The text to display for the previous link (defaults to "Previous" as defined by default.paginate.prev property in I18n messages.properties)
     * @attr next The text to display for the next link (defaults to "Next" as defined by default.paginate.next property in I18n messages.properties)
     * @attr omitPrev Whether to not show the previous link (if set to true, the previous link will not be shown)
     * @attr omitNext Whether to not show the next link (if set to true, the next link will not be shown)
     * @attr omitFirst Whether to not show the first link (if set to true, the first link will not be shown)
     * @attr omitLast Whether to not show the last link (if set to true, the last link will not be shown)
     * @attr max The number of records displayed per page (defaults to 10). Used ONLY if params.max is empty
     * @attr maxsteps The number of steps displayed for pagination (defaults to 10). Used ONLY if params.maxsteps is empty
     * @attr offset Used only if params.offset is empty
     * @attr mapping The named URL mapping to use to rewrite the link
     * @attr fragment The link fragment (often called anchor tag) to use
     */
    Closure paginate = { Map attrsMap ->
        TypeConvertingMap attrs = (TypeConvertingMap)attrsMap
        def writer = out
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }

        def messageSource = grailsAttributes.messageSource
        def locale = RequestContextUtils.getLocale(request)

        def total = attrs.int('total') ?: 0
        def offset = params.int('offset') ?: 0
        def max = params.int('max')
        def maxsteps = (attrs.int('maxsteps') ?: 10)

        if (!offset) offset = (attrs.int('offset') ?: 0)
        if (!max) max = (attrs.int('max') ?: 10)

        Map linkParams = [:]
        if (attrs.params instanceof Map) linkParams.putAll((Map)attrs.params)
        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) linkParams.sort = params.sort
        if (params.order) linkParams.order = params.order

        Map linkTagAttrs = [:]
        def action
        if (attrs.containsKey('mapping')) {
            linkTagAttrs.mapping = attrs.mapping
            action = attrs.action
        } else {
            action = attrs.action ?: params.action
        }
        if (action) {
            linkTagAttrs.action = action
        }
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.containsKey(UrlMapping.PLUGIN)) {
            linkTagAttrs.put(UrlMapping.PLUGIN, attrs.get(UrlMapping.PLUGIN))
        }
        if (attrs.containsKey(UrlMapping.NAMESPACE)) {
            linkTagAttrs.put(UrlMapping.NAMESPACE, attrs.get(UrlMapping.NAMESPACE))
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        linkTagAttrs.params = linkParams

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = ((offset / max) as int) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max)) as int

        // display previous link when not on firststep unless omitPrev is true
        if (currentstep > firststep && !attrs.boolean('omitPrev')) {
            linkTagAttrs.put('class', 'prevLink')
            linkParams.offset = offset - max
            writer << '<li>'
            writer << callLink((Map)linkTagAttrs.clone()) {
                (attrs.prev ?:  '<i class="fa fa-chevron-left"></i>')
            }
            writer << '</li>'
        }

        // display steps when steps are enabled and laststep is not firststep
        if (steps && laststep > firststep) {
            linkTagAttrs.put('class', 'step')

            // determine begin and endstep paging variables
            int beginstep = currentstep - (Math.round(maxsteps / 2.0d) as int) + (maxsteps % 2)
            int endstep = currentstep + (Math.round(maxsteps / 2.0d) as int) - 1

            if (beginstep < firststep) {
                beginstep = firststep
                endstep = maxsteps
            }
            if (endstep > laststep) {
                beginstep = laststep - maxsteps + 1
                if (beginstep < firststep) {
                    beginstep = firststep
                }
                endstep = laststep
            }

            // display firststep link when beginstep is not firststep
            if (beginstep > firststep && !attrs.boolean('omitFirst')) {
                linkParams.offset = 0
                writer << '<li>'
                writer << callLink((Map)linkTagAttrs.clone()) {firststep.toString()}
                writer << '</li>'
            }
            //show a gap if beginstep isn't immediately after firststep, and if were not omitting first or rev
            if (beginstep > firststep+1 && (!attrs.boolean('omitFirst') || !attrs.boolean('omitPrev')) ) {
                writer << '<li class="step gap">..</li>'
            }

            // display paginate steps
            (beginstep..endstep).each { int i ->
                if (currentstep == i) {
                    writer << "<li class=\"active\"><a href='javascript:void(0);'>${i}</a></li>"
                }
                else {
                    linkParams.offset = (i - 1) * max
                    writer << '<li>'
                    writer << callLink((Map)linkTagAttrs.clone()) {i.toString()}
                    writer << '</li>'
                }
            }

            //show a gap if beginstep isn't immediately before firststep, and if were not omitting first or rev
            if (endstep+1 < laststep && (!attrs.boolean('omitLast') || !attrs.boolean('omitNext'))) {
                writer << '<li class="step gap">..</li>'
            }
            // display laststep link when endstep is not laststep
            if (endstep < laststep && !attrs.boolean('omitLast')) {
                linkParams.offset = (laststep - 1) * max
                writer << '<li>'
                writer << callLink((Map)linkTagAttrs.clone()) { laststep.toString() }
                writer << '</li>'
            }
        }

        // display next link when not on laststep unless omitNext is true
        if (currentstep < laststep && !attrs.boolean('omitNext')) {
            linkTagAttrs.put('class', 'nextLink')
            linkParams.offset = offset + max
            writer << '<li>'
            writer << callLink((Map)linkTagAttrs.clone()) {
                (attrs.next ?: '<i class="fa fa-chevron-right"></i>')
            }
            writer << '</li>'
        }
    }

    def selectWithOptGroup = {attrs ->
        def messageSource = grailsAttributes.getApplicationContext().getBean("messageSource")
        def locale = RCU.getLocale(request)
        def writer = out
        def from = attrs.remove('from')
        def keys = attrs.remove('keys')
        def optionKey = attrs.remove('optionKey')
        def optionValue = attrs.remove('optionValue')
        def groupBy = attrs.remove('groupBy')
        def value = attrs.remove('value')
        def valueMessagePrefix = attrs.remove('valueMessagePrefix')
        def noSelection = attrs.remove('noSelection')
        def disabled = attrs.remove('disabled')
        Set optGroupSet = new TreeSet();
        attrs.id = attrs.id ? attrs.id : attrs.name

        if (value instanceof Collection && attrs.multiple == null) {
            attrs.multiple = 'multiple'
        }

        if (noSelection != null) {
            noSelection = noSelection.entrySet().iterator().next()
        }

        if (disabled && Boolean.valueOf(disabled)) {
            attrs.disabled = 'disabled'
        }

        // figure out the groups
        from.each {
            optGroupSet.add(it.properties[groupBy])
        }

        writer << "<select name=\"${attrs.remove('name')}\" "
        // process remaining attributes
        outputAttributes(attrs)
        writer << '>'
        writer.println()

        if (noSelection) {
            renderNoSelectionOption(noSelection.key, noSelection.value, value)
            writer.println()
        }

        // create options from list
        if (from) {
            //iterate through group set
            for(optGroup in optGroupSet) {
                writer << " <optgroup label=\"${optGroup.encodeAsHTML()}\">"
                writer.println()

                from.eachWithIndex {el, i ->
                    if(el.properties[groupBy].equals(optGroup)) {

                        def keyValue = null
                        writer << '<option '

                        if (keys) {
                            keyValue = keys[i]
                            writeValueAndCheckIfSelected(keyValue, value, writer)
                        }

                        else if (optionKey) {
                            if (optionKey instanceof Closure) {
                                keyValue = optionKey(el)
                            }

                            else if (el != null && optionKey == 'id' && grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, el.getClass().name)) {
                                keyValue = el.ident()
                            }

                            else {
                                keyValue = el[optionKey]
                            }

                            writeValueAndCheckIfSelected(keyValue, value, writer)
                        }

                        else {
                            keyValue = el
                            writeValueAndCheckIfSelected(keyValue, value, writer)
                        }

                        writer << '>'

                        if (optionValue) {
                            if (optionValue instanceof Closure) {
                                writer << optionValue(el).toString().encodeAsHTML()
                            }

                            else {
                                writer << el[optionValue].toString().encodeAsHTML()
                            }

                        }

                        else if (valueMessagePrefix) {
                            def message = messageSource.getMessage("${valueMessagePrefix}.${keyValue}", null, null, locale)

                            if (message != null) {
                                writer << message.encodeAsHTML()
                            }

                            else if (keyValue) {
                                writer << keyValue.encodeAsHTML()
                            }

                            else {
                                def s = el.toString()
                                if (s) writer << s.encodeAsHTML()
                            }
                        }

                        else {
                            def s = el.toString()
                            if (s) writer << s.encodeAsHTML()
                        }

                        writer << '</option>'
                        writer.println()
                    }
                }

                writer << '</optgroup>'
                writer.println()
            }
        }
        // close tag
        writer << '</select>'
    }

    void outputAttributes(attrs) {
        attrs.remove('tagName') // Just in case one is left
        attrs.each {k, v ->
            out << k << "=\"" << v.encodeAsHTML() << "\" "
        }
    }

    def typeConverter = new SimpleTypeConverter()
    private writeValueAndCheckIfSelected(keyValue, value, writer) {
        boolean selected = false
        def keyClass = keyValue?.getClass()
        if (keyClass.isInstance(value)) {
            selected = (keyValue == value)
        }
        else if (value instanceof Collection) {
            selected = value.contains(keyValue)
        }
        else if (keyClass && value) {
            try {
                value = typeConverter.convertIfNecessary(value, keyClass)
                selected = (keyValue == value)
            } catch (Exception) {
                // ignore
            }
        }
        writer << "value=\"${keyValue}\" "
        if (selected) {
            writer << 'selected="selected" '
        }
    }

    def renderNoSelectionOption = {noSelectionKey, noSelectionValue, value ->
        // If a label for the '--Please choose--' first item is supplied, write it out
        out << '<option value="' << (noSelectionKey == null ? "" : noSelectionKey) << '"'
        if (noSelectionKey.equals(value)) {
            out << ' selected="selected" '
        }
        out << '>' << noSelectionValue.encodeAsHTML() << '</option>'
    }

    private String optionValueToString(def el, def optionValue) {
        if (optionValue instanceof Closure) {
            return optionValue(el).toString().encodeAsHTML()
        }

        el[optionValue].toString().encodeAsHTML()
    }

    private callLink(Map attrs, Object body) {
        GroovyPage.captureTagOutput(gspTagLibraryLookup, 'g', 'link', attrs, body, webRequest)
    }

}
