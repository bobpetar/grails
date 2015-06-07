<div class="col-md-4">
    <section>
        <h1>Account Information</h1>

        <div class="row fontawesome-icon-list">

            <div class="col-md-12 col-sm-12">
                <i class="fa fa-check-square-o"></i>
                Projects Completed : ${totalProjects}
            </div>

            <div class="col-md-12 col-sm-12">
                <i class="fa fa-dollar"></i>
                Available Balance : <g:formatNumber number="${availableBalance}" type="currency"/>
            </div>

            <div class="col-md-12 col-sm-12">
                <i class="fa fa-money"></i>
                Total Earned : <g:formatNumber number="${totalEarned}" type="currency"/>
            </div>
            <g:if test="${retoucher?.paypalAccount && retoucher?.paypalAccount!=''}">
                <div class="col-md-12 col-sm-12">
                    <i class="fa fa-paypal"></i>
                    Paypal : ${retoucher?.paypalAccount}
                </div>
            </g:if>


        </div>
        <g:if test="${availableBalance>redeemLimit}">
            <h1>Redeem</h1>
            <div class="form-group">

            <g:if test="${retoucher?.paypalAccount && retoucher?.paypalAccount!=''}">
                <g:form action="redeem" enctype="multipart/form-data">
                    <div class="col-md-12">
                        <div data-plugin-spinner data-plugin-options='{ "value":${availableBalance}, "min":${redeemLimit}, "max": ${availableBalance} }'>
                            <div class="input-group input-small">
                                <input type="text" name="redeemAmount" class="spinner-input form-control">
                                <div class="spinner-buttons input-group-btn btn-group-vertical">
                                    <button type="button" class="btn spinner-up btn-xs btn-default">
                                        <i class="fa fa-angle-up"></i>
                                    </button>
                                    <button type="button" class="btn spinner-down btn-xs btn-default">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <br>
                        <g:submitButton name="upload" class="btn btn-primary btn-lg" value="Redeem!"/>
                    </div>
                </g:form>
            </g:if><g:else>
                <div class="col-md-12" >
                    Please setup your payment method at <g:link controller="user" action="edit">My Accounts page</g:link>  in order to redeem your earnings.

                    <br>
                </div>

            </g:else>
            </div>

        </g:if><g:else>
        <span class="label btn-warning">
            A minimum balance of $${redeemLimit} is required in order to redeem your earnings.
        </span>
        </g:else>

    </section>
</div>