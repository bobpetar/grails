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
            <g:if test="${projectInstance.status=='New'}">
                <td>
                    <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" params="[taskparams:taskInstance?.id, techniqueparams: techniqueInstance.id]" action="removeTechniqueInvoice" class="btn btn-xs btn-danger" > Delete </g:remoteLink>
                </td>
            </g:if>
        </tr>
    </g:each>
    <g:each in="${techniqueList}" status="i" var="techniqueInstance">
        <tr>
            <td>${techniqueInstance.name} (${techniqueInstance.groep})</td>
            <td>$${techniqueInstance.ratePerTechnique}</td>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" action="removeTechniqueInvoice" class="btn btn-xs btn-danger" params="[taskparams:taskInstance?.id, techniqueparams:techniqueInstance?.id]" > Delete </g:remoteLink>
            </td>
        </tr>
    </g:each>
    <g:if test="${sumTechnique}">
    <tr><td>Total</td></td><td>$${sumTechnique}</td><td></td></tr>
    <tr><td>Discount</td></td><td>$${discountWhenMax}</td><td></td></tr>
    <tr><td>You Pay</td></td><td>$${sumTechnique-discountWhenMax}</td><td></td></tr>
    </g:if>
    </tbody>
</table>