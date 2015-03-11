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
            <td>$0.05</td>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" id="${technique.id}" action="removeTechniqueInvoice" class="btn btn-xs btn-danger" > Delete </g:remoteLink>
            </td>
        </tr>
    </g:each>
    <g:each in="${techniqueList}" var="technique">
        <tr>
            <td>${technique.technique.name} (${technique.technique.groep})</td>
            <td>$0.05</td>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" id="${technique.id}" action="removeTechniqueInvoice" class="btn btn-xs btn-danger"> Delete </g:remoteLink>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>