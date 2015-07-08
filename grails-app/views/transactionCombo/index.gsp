<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.banking.Account" %>
<html>
<head>
    <title><g:message code="transactionCombo.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-shopping-cart"></i><g:message code="transactionCombo.index.title" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:link controller="transactionHome"><g:message code="transaction.index.heading"/></g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:message code="transactionCombo.index.heading"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="transactionCombo.index.form.heading"/>
                    </header>
                    <div class="panel-body">
                        <g:render template="/templates/messageBlock"/>
                        <g:form action="create" role="form">
                            <div class="form-group ${hasErrors(bean:command,field:'date', 'errors')}">
                                <label for="date"><g:message code="transaction.date.label"/></label><br/>
                                <g:datePicker name="date" value="${command?.date}" precision="day" relativeYears="[-2..5]"/>
                            </div>
                            <div class="form-group ${hasErrors(bean: command, field:'location','has-error')}">
                                <label for="location"><g:message code="transaction.location.label"/></label>
                                <g:textField name="location" class="form-control" value="${command?.location}"/>
                            </div>
                            <div class="form-group ${hasErrors(bean: command, field:'account','has-error')}">
                                <label for="account"><g:message code="account"/></label>
                                <g:select name="account" from="${Account.findAllByActive(true)}"
                                          optionKey="id" optionValue="title" noSelection="['':'-Choose Account-']"
                                          value="${command?.account?.id}" class="form-control"/>
                            </div>
                            <div class="form-group ${hasErrors(bean: command, field:'total','has-error')}">
                                <label for="total"><g:message code="transactionComboGroupCommand.total.label" default="Total"/></label>
                                <g:field type="number" step="any" name="total" class="form-control" value="${command?.total}"/>
                            </div>
                            <g:submitButton name="Start" class="btn btn-primary"/>
                        </g:form>
                    </div>
                </section>
            </div>
            <div class="col-lg-8">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="transactionCombo.index.table.list.heading"/>
                    </header>
                    <div class="panel-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th><g:message code="transaction.groupId.label" default="Group Id"/></th>
                                <th><g:message code="category"/></th>
                                <th><g:message code="transaction.date.label"/></th>
                                <th><g:message code="transaction.amount.label"/></th>
                                <th><g:message code="transaction.location.label"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${transactionList}" var="transaction">
                                <tr>
                                    <td>${transaction.comboGroup?.id}</td>
                                    <td><g:link action="edit" id="${transaction.id}">${transaction.category}</g:link> </td>
                                    <td><g:formatDate date="${transaction.date}" format="MM/dd"/></td>
                                    <td><g:formatNumber number="${transaction.amount}" type="currency" currencyCode="USD"/></td>
                                    <td>${transaction.location}</td>
                                </tr>
                            </g:each>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="5">
                                    <div class="text-center">
                                        <ul class="pagination pagination-lg">
                                            <g:paginate total="${transactionCount}" prev="${raw("<")}" next="${raw(">")}" maxsteps="10"/>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
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