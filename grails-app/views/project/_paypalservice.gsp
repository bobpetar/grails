<g:if test="${sumTechnique}">
    <paypal:button
            itemName="${taskInstance.project.projectId}"
            itemNumber="${taskInstance.project.projectId}"
            transactionId="${payment?.transId}"
            discountAmount="${10}"
            amount="${sumTechnique}"
            buyerId="1"/>
</g:if>