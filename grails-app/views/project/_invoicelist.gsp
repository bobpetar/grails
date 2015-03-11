<table class="table table-striped">
    <thead>
    <tr>
        <th>Delete</th>
        <th>Name (Group)</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${techniqueInvoiceList}" var="technique">
        <tr>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" id="${technique.id}" action="removeTechniqueInvoice" > Delete </g:remoteLink>
            </td>
            <td>${technique.technique.name} (${technique.technique.groep})</td>
            <td>$0.05</td>
        </tr>
    </g:each>
    <g:each in="${techniqueList}" var="technique">
        <tr>
            <td>
                <g:remoteLink name="removeTechniqueInvoice" update="techniqueList" id="${technique.id}" action="removeTechniqueInvoice" > Delete </g:remoteLink>
            </td>
            <td>${technique.technique.name} (${technique.technique.groep})</td>
            <td>$0.05</td>
        </tr>
    </g:each>
    </tbody>
</table>