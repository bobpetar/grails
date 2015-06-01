

<%@ page import="com.retouch.Earning" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'redeemtion.label', default: 'Redeem History')}" />
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
                        <li><a class="home" href="${createLink(action:'index')}">My Earnings</a></li>
                        <li>Redeem History</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1>
                        Redeem History
                    </h1>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <div class="row show-grid">
            <g:render template="accountInfo"/>



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
                                <th><g:message code="redeemtion.project.label" default="#" /></th>
                                <g:sortableColumn property="createdDate" title="${message(code: 'redeemtion.createdDate.label', default: 'Date')}" />
                                <g:sortableColumn property="amount" title="${message(code: 'redeemtion.amount.label', default: 'Amount')}" />
                                %{--						<th><g:message code="earning.retoucher.label" default="Retoucher" /></th>--}%
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${redeemtions}" status="i"  var="redeem">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: redeem, field: "redeemId")}</td>
                                    <td><prettytime:display date="${redeem.createdDate}"/></td>
                                    <td>$${fieldValue(bean: redeem, field: "amount")} </td>
                                    %{-- <td>${fieldValue(bean: earningInstance, field: "retoucher")}</td>--}%
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <ul class="pagination">
                            <retouch:paginate total="${redeemtionInstanceCount ?: 0}" />
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
