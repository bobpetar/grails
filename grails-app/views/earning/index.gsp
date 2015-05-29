

<%@ page import="com.retouch.Earning" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'earning.label', default: 'Earning')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div role="main" class="main">

    <section class="page-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message
                                code="default.home.label" /></a></li>
                        <li>My Earnings</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        My Earnings
                    </h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="row show-grid">
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



            <div class="col-md-8">
        <div class="panel-body">
            <div class="table-responsive">
                %{--	<g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>--}%
                <table
                        class="table table-bordered table-striped table-condensed mb-none">
                    <thead>
                    <tr>


                        <th><g:message code="earning.project.label" default="Project" /></th>
                        <g:sortableColumn property="createdDate" title="${message(code: 'earning.createdDate.label', default: 'Date')}" />
                        <g:sortableColumn property="amount" title="${message(code: 'earning.amount.label', default: 'Amount')}" />


                        %{--						<th><g:message code="earning.retoucher.label" default="Retoucher" /></th>--}%

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${earningInstanceList}" status="i"
                            var="earningInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td>${fieldValue(bean: earningInstance, field: "project")}</td>
                            <td><prettytime:display date="${earningInstance.createdDate}"/></td>
                            <td>$${fieldValue(bean: earningInstance, field: "amount")} </td>




%{--
                            <td>${fieldValue(bean: earningInstance, field: "retoucher")}</td>--}%


                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <ul class="pagination">
                    <retouch:paginate total="${earningInstanceCount ?: 0}" />
                </ul>

            </div>
        </div>
                </div>
        </div>
    </div>
</div>
</body>
</html>
