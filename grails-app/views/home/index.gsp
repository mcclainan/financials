<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:05 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.tracking.Transaction" %>
<html>
<head>
    <title></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <!--overview start-->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-laptop"></i>Dashboard</li>
                </ol>
            </div>
        </div>
        <g:render template="templates/calendar"/>
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading dashboard-heading">
                        Most Recent Trasactions
                    </header>
                    <div class="panel-body">
                        <div class="table-responsive">

                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td><g:message code="transaction.date.label"/></td>
                                    <td><g:message code="transaction.location.label"/></td>
                                    <td><g:message code="transaction.amount.label"/></td>
                                    <th><g:message code="category"/></th>
                                    <th><g:message code="account"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${mostRecentTransactions}" var="transaction">
                                    <tr>
                                        <td><g:formatDate date="${transaction.date}" format="MMM dd"/></td>
                                        <td>${transaction.location}</td>
                                        <td><g:formatNumber number="${transaction.amount}" type="currency" currencyCode="USD"/></td>
                                        <td>${transaction.category}</td>
                                        <td>${transaction.account}</td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </div>

            <div class="col-lg-6">
                <div class="panel">
                    <div class="panel-heading dashboard-heading">
                        Cumulative Expense Tracking
                    </div>
                    <div class="panel-body">
                        <table class="table bootstrap-datatable countries">
                            <thead>
                                <tr>
                                    <th>Category</th>
                                    <th>Spent</th>
                                    <th>Budgeted</th>
                                    <th>Performance</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${budgetCompareList}" var="compare">
                                    <tr>
                                        <td>${compare.category}</td>
                                        <td><g:formatNumber number="${compare.spent}" type="currency" currencyCode="USD"/></td>
                                        <td><g:formatNumber number="${compare.budgeted}" type="currency" currencyCode="USD"/></td>
                                        <td>
                                            <div class="progress thin">
                                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="${compare.used}" aria-valuemin="0" aria-valuemax="100" style="width: ${compare.used}%">
                                                </div>
                                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="${compare.left}" aria-valuemin="0" aria-valuemax="100" style="width: ${compare.left}%">
                                                </div>
                                            </div>
                                            <span class="sr-only">${compare.used}%</span>
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>


        <!-- project team & activity end -->

    </section>
</section>
<!--main content end-->

</body>
</html>