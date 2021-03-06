

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
                        <li><a class="home" href="${createLink(action:'redeemHistory')}">Redeem History</a></li>
                    </ul>
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
                        <table
                                class="table table-bordered table-striped table-condensed mb-none">
                            <thead>
                            <tr>
                                <th><g:message code="earning.project.label" default="Project" /></th>
                                <g:sortableColumn property="createdDate" title="${message(code: 'earning.createdDate.label', default: 'Date')}" />
                                <g:sortableColumn property="amount" title="${message(code: 'earning.amount.label', default: 'Amount')}" />
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${earningInstanceList}" status="i"
                                    var="earningInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${fieldValue(bean: earningInstance, field: "project")}</td>
                                    <td><prettytime:display date="${earningInstance.createdDate}"/></td>
                                    <td>$${fieldValue(bean: earningInstance, field: "amount")} </td>
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
