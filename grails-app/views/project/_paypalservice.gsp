%{--<g:if test="${sumTechnique}">--}%
    %{--<g:form id="paypalform" controller="paypal" action="buy">--}%
        %{--<input name="itemName" type="hidden" value="${taskInstance.project.projectId}">--}%
        %{--<input name="itemNumber" type="hidden" value="${taskInstance.project.projectId}">--}%
        %{--<input name="transactionId" type="hidden" value="${payment?.transId}">--}%
        %{--<input name="discountAmount" type="hidden" value="${0}">--}%
        %{--<input name="amount" type="hidden" value="${sumTechnique}">--}%
        %{--<input name="buyerId" type="hidden" value="${taskInstance.project.client.id}">--}%
        %{--<input type="submit" value="Checkout" class="btn btn-primary btn-lg pull-right">--}%
    %{--</g:form>--}%
%{--</g:if>--}%