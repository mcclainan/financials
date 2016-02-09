<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 9/3/15
  Time: 10:14 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.netWorth.AccountingBaseItem" %>
<html>
<head>
    <title><g:message code="netWorth.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><g:message code="netWorth.index.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-bars"></i><g:message code="netWorth.index.heading" default="Change Me"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <g:render template="/templates/notificationBlock"/>
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-heading">
                        ${AccountingBaseItem.ASSET} List
                    </div>
                    <div class="panel-body table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th><g:message code="accountingBaseItem.name.label"/></th>
                                    <th><g:message code="accountingBaseItem.description.label"/></th>
                                    <th><g:message code="accountingBaseItem.balance.label"/></th>
                                    <th><g:message code="accountingBaseItem.account.label"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${AccountingBaseItem.findAllByActiveAndType(true,AccountingBaseItem.ASSET)}" var="ab">
                                    <tr>
                                        <td>${ab.name}</td>
                                        <td>${ab.description}</td>
                                        <td><g:formatNumber number="${ab.balance}" type="currency" currencyCode="USD"/></td>
                                        <td>${ab.account?:'N/A'}</td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        <div class="col-lg-6">
            <section class="panel">
                <div class="panel-heading">
                    ${AccountingBaseItem.LIABILITY} List
                </div>
                <div class="panel-body table-responsive">
                    <table>
                        <thead>
                        <tr>
                            <th><g:message code="accountingBaseItem.name.label"/></th>
                            <th><g:message code="accountingBaseItem.description.label"/></th>
                            <th><g:message code="accountingBaseItem.balance.label"/></th>
                            <th><g:message code="accountingBaseItem.account.label"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${AccountingBaseItem.findAllByActiveAndType(true,AccountingBaseItem.LIABILITY)}" var="ab">
                            <tr>
                                <td>${ab.name}</td>
                                <td>${ab.description}</td>
                                <td><g:formatNumber number="${ab.balance}" type="currency" currencyCode="USD"/></td>
                                <td>${ab.account?:'N/A'}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>