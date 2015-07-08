<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page import="java.text.DateFormatSymbols" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="plannedTransactionView.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-clipboard"></i><g:message code="plannedTransactionView.index.heading" default="Change Me" args="${[new java.text.DateFormatSymbols().getMonths()[month],year]}"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-clipboard"></i><g:message code="plannedTransactionView.index.title" default="Change Me"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading">
                        <h2>Income</h2>
                    </header>
                    <div class="panel-body">
                        <table class="table table-condensed">
                            <g:each in="${incomeList}" var="b">
                                <tr>
                                    <td>
                                        <g:remoteLink action="show" update="remote-panels" id="${b[1]}"
                                                      params="['month':month,'year':year]" after="setView('#remote-panel-1')">
                                            ${b[1]}
                                        </g:remoteLink>
                                    </td>
                                    <td><g:formatNumber number="${b[2]}" type="currency" currencyCode="USD"/></td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                    <header class="panel-heading">
                        <h2>Expenses</h2>
                    </header>
                    <div class="panel-body">
                        <table class="table table-condensed">
                            <g:each in="${expenseList}" var="b">
                                <tr>
                                    <td><g:remoteLink action="show" update="remote-panels" id="${b[1]}" params="['month':month,'year':year]" after="setView('#remote-panel-1')">${b[1]}</g:remoteLink></td>
                                    <td><g:formatNumber number="${b[2]}" type="currency" currencyCode="USD"/></td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </section>
            </div>
            <div id="remote-panels">
                <div id="remote-panel-1">
                    <div class="col-lg-4">
                        <section class="panel">
                            <header class="panel-heading">
                                <h2><g:message code="plannedTransactionView.index.switch.panel.heading"/> </h2>
                            </header>
                            <div class="panel-body text-center">
                                <g:link action="index" params="[month: previousMonth.month,year: previousMonth.year]" class="btn btn-sm btn-primary">Previous Month</g:link>
                                <g:link action="index" class="btn btn-sm btn-default">This Month</g:link>
                                <g:link action="index" params="[month: nextMonth.month,year: nextMonth.year]" class="btn btn-sm btn-primary">Next Month</g:link>
                            </div>
                            <header class="panel-heading">
                                <h2><g:message code="plannedTransactionView.index.options.panel.heading"/> </h2>
                            </header>
                            <div class="panel-body">
                                <ul>
                                    <li><g:message code="plannedTransactionView.index.options.panel.show"/> </li>
                                    <br/>
                                    <li>
                                        <g:remoteLink action="create" update="remote-panel-1" params="['year':year,'month':month]" after="setView('#remote-panel-1')">
                                            <g:message code="plannedTransactionView.index.options.panel.create"/>
                                        </g:remoteLink>
                                    </li>
                                </ul>
                            </div>

                        </section>
                    </div>
                </div>
                <div id="remote-panel-2">

                </div>

            </div>

        </div>

        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>
