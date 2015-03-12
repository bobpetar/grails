<table class="table table-striped">
    <thead>
    <tr>
        <th>Name (Group)</th>
        <th>Price</th>
        <th>#</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${techniqueInvoiceList}" var="technique">
        <tr>
            <td>${technique.technique.name} (${technique.technique.groep})</td>
            <td>$${technique.ratePerTechnique}</td>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" id="${technique.id}" action="removeTechniqueInvoice" class="btn btn-xs btn-danger" > Delete </g:remoteLink>
            </td>
        </tr>
    </g:each>
    <g:each in="${techniqueList}" var="technique">
        <tr>
            <td>${technique.technique.name} (${technique.technique.groep})</td>
            <td>$${technique.ratePerTechnique}</td>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" id="${technique.id}" action="removeTechniqueInvoice" class="btn btn-xs btn-danger" onComplete="enable(${technique.technique.id})"> Delete </g:remoteLink>
            </td>
        </tr>
    </g:each>
    <tr><td>Total</td></td><td>$${sumInvoiceTechnique}${sumTechnique}</td><td></td></tr>
    </tbody>
</table>