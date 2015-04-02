<table class="table table-striped">
    <thead>
    <tr>
        <th>Name (Group)</th>
        <th>Price</th>
        <th>#</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${techniqueInvoiceList}" status="i" var="techniqueInstance">
        <tr>
            <td>${techniqueInstance.name} (${techniqueInstance.groep})</td>
            <td>$${techniqueInstance.ratePerTechnique}</td>
            <g:if test="${projectInstance.status == 'New'}">
                <td>
                    <g:remoteLink name="removeTechniqueInvoice" update="techniqueList"
                                  onSuccess="enable(${fieldValue(bean: techniqueInstance, field: 'id')});"
                                  params="[taskparams: taskInstance?.id, techniqueparams: techniqueInstance.id]"
                                  action="removeTechniqueInvoice" class="btn btn-xs btn-danger">Delete</g:remoteLink>
                </td>
            </g:if>
        </tr>
    </g:each>
    <g:each in="${techniqueList}" status="i" var="techniqueInstance">
        <tr>
            <td>${techniqueInstance.name} (${techniqueInstance.groep})</td>
            <td>$${techniqueInstance.ratePerTechnique}</td>
            <td>
                <g:remoteLink name="removeTechniqueInvoice"
                              update="techniqueList"
                              action="removeTechniqueInvoice"
                              class="btn btn-xs btn-danger"
                              onSuccess="enable(${fieldValue(bean: techniqueInstance, field: 'id')});"
                              params="[taskparams: taskInstance?.id, techniqueparams: techniqueInstance?.id]">Delete</g:remoteLink>
            </td>
        </tr>
    </g:each>
    <g:if test="${sumTechnique}">
        <tr><td>Total</td></td><td>$${sumTechnique}</td><td></td></tr>
        <tr><td>Cash Discount</td></td><td>$${cashDiscount}</td><td></td></tr>
        <tr><td>Coupon Discount</td></td><td>$${couponDiscount}</td><td></td></tr>
        <tr><td>You Pay:</td><td>$${sumTechnique - cashDiscount - couponDiscount}</td><td></td></tr>
    </g:if>
    </tbody>
</table>

<g:if test="${sumTechnique}">
    <div class="col-md-12">
        <g:form controller="paypal" action="buyImage" >
            <input name="taskInstance" value="${taskInstance.id}" type="hidden"/>
            <input type="submit" value="Checkout" class="btn btn-primary btn-lg pull-right push-top">
        </g:form>
    </div>
</g:if>