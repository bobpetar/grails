<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page expressionCodec="none" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label"
                      args="[entityName]"/></title>

    <script type="application/javascript" >
        function disable(i){
            $("#chooseTechnique1"+i).prop("disabled",true);
            $("#chooseTechnique2"+i).prop("disabled",true);
            $("#removeTechnique2"+i).attr("disabled",false);
        }

        function enable(i){
            $("#chooseTechnique1"+i).prop("disabled",false);
            $("#chooseTechnique2"+i).prop("disabled",false);
            $("#removeTechnique2"+i).attr("disabled",true);
        }

        function disableRemoveButton(i){
            $("#removeTechnique2"+i).attr("disabled",true);
        }

        function update(data){
            $('#couponstatus').html(data.message);
            console.log(data)
            $('#couponcode').val('');
            updateInvoice();
        }

        function updateInvoice(){
            $.get("${createLink(action: 'getInvoice',controller: 'project',id:projectInstance.task.id)}", function(data, status){
                $('#techniqueList').html(data);
            });
        }

        function disableonload(i){
            if(${techniques.id.containsAll(techniqueList.id)}){
                var invoiceList = ${techniqueList.id}
                        invoiceList.forEach(function(data){
                            disable(data);
                        });

            }
        }
        window.onload = function(){
            var techniqueList = ${techniques.id}
                    techniqueList.forEach(function(technique){
                disableRemoveButton(technique);
            });
            disableonload()
        }

    </script>
</head>

<body>
<div role="main" class="main">
    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Techniques</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="panel-body">
            <div class="col-md-8">
                <!-- Technique list template -->
                <g:render template="technique"/>
            </div>

            <div class="col-md-4">
                <div class="col-md-12">
                    <h3>Order Details</h3>
                    <hr>

                    <div class="col-md-12 push-bottom">
                        <h4>#${projectInstance.projectId}</h4>
                        <img alt="${projectInstance.task.originalImage.getLargeImageName()}"
                             class="img-responsive img-thumbnail"
                             src="${grailsApplication.config.retouch.imageServer}${projectInstance.task.originalImage.getLargeImageName()}"/>
                    </div>

                    <g:formRemote name="couponform" onSuccess="update(data)"
                                  url="[controller: 'project', action: 'applyCoupon']">
                        <div class="col-md-12">
                            <h4>Promo Code</h4>
                            <input name="projectInstance" value="${projectInstance.id}" type="hidden"/>
                            <input type="text" name="couponcode" id="couponcode" class="form-control"
                                   placeholder="Enter code">

                            <div id="couponstatus" class="text-warning"></div>
                            <input type="submit" value="Apply" class="btn btn-primary push-top push-bottom">
                        </div>
                    </g:formRemote>

                    <div class="col-md-12">
                    <div class="portfolio-item">
                        <a class="thumb-info lightbox" href="#showInvoice" data-plugin-options="{&quot;type&quot;:&quot;inline&quot;, preloader: false}">
                            Show Invoice Details
                        </a>
                    </div>
                    <!-- Invoice block start -->
                    <div id="techniqueList">
                            <g:render template="invoicelist"/>
                        </div>
                    </div>
                    <!-- Invoice block end -->
                </div>

            </div>
        </div>
    </div>
</div>
</body>

</html>