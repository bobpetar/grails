<div id="showInvoice" class="popup-inline-content mfp-hide" style="max-width: 600px;">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name (Group)</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${techniqueList}" status="i" var="techniqueInstance">
            <tr>
                <td>${techniqueInstance.name} (${techniqueInstance.groep})</td>
                <td>$${techniqueInstance.ratePerTechnique}</td>
            </tr>
        </g:each>

        <g:if test="${sumTechnique}">
            <tr><td>Total</td></td><td>$${sumTechnique}</td></tr>
        <tr><td>Cash Discount</td></td><td>$${cashDiscount}</td></tr>
        <tr><td>Coupon Discount</td></td><td>$${couponDiscount}</td></tr>
            <tr><td>You Pay:</td><td>$${sumTechnique - cashDiscount - couponDiscount}</td></tr>
        </g:if>

        </tbody>
    </table>
</div>
<g:if test="${sumTechnique}">
    <table class="table table-striped">
        <tbody>
        <tr><td>Total</td></td><td>$${sumTechnique}</td></tr>
        <tr><td>Cash Discount</td></td><td>$${cashDiscount}</td></tr>
        <tr><td>Coupon Discount</td></td><td>$${couponDiscount}</td></tr>
        <tr><td>You Pay:</td><td>$${sumTechnique - cashDiscount - couponDiscount}</td></tr>
        </tbody>
    </table>
    <div class="col-md-12">
        <g:form controller="paypal" action="buyImage" >
            <input name="taskInstance" value="${taskInstance.id}" type="hidden"/>
            <input type="submit" value="Checkout" class="btn btn-primary btn-lg pull-right push-top">
        </g:form>
    </div>
</g:if>





