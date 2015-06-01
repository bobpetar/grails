<div class="col-md-3">
    <section>
        <h4 class="page-header">Account Information</h4>

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
        </div>
        <g:if test="${availableBalance>redeemLimit}">
            <h4 class="page-header">Redeem</h4>
            <div class="form-group">
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
            </div>

        </g:if>


        <hr class="tall"/>

    </section>
</div>