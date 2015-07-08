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
    <title><g:message code="transactionAccountTransfer.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><g:message code="transactionAccountTransfer.index.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:link controller="transactionHome"><g:message code="transaction.index.heading"/></g:link></li>
                    <li><i class="fa"></i><g:message code="transactionAccountTransfer.index.heading"/> </li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="transactionAccountTransfer.index.form.heading" default="Create Transfer"/>
                    </header>
                    <div class="panel-body">
                        <g:render template="/templates/messageBlock"/>
                        <g:form class="form-horizontal" action="save">
                            <div class="form-group ${fieldError([bean: command, field:'date'],'has-error')}">
                                <label class="col-sm-2 control-label" for="date"><g:message code="transactionAccountTransferCommand.date.label" default="Transfer Date"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:datePicker name="date" value="${command?.date}" class="form-control" precision="day" relativeYears="[-2..2]"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'location'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="transaction.location.label"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:textField name="location" class="form-control" value="${command?.location?:'Transfer'}"/>
                                    <span class="help-block">Where was this trasfer made?</span>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'fromAccount'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="transactionAccountTransferCommand.fromAccount.label" default="From Account"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:select name="fromAccount" class="form-control" from="${Account.findAllByActive(true)}" optionKey="id" optionValue="title" noSelection="['null':'Choose Account']" value="${command?.fromAccount?.id}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'toAccount'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="transactionAccountTransferCommand.toAccount.label" default="To Account"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:select name="toAccount" class="form-control" from="${Account.findAllByActive(true)}" optionKey="id" optionValue="title" noSelection="['null':'Choose Account']" value="${command?.toAccount?.id}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'amount'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="transactionAccountTransferCommand.amount.label" default="Amount To Transfer"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:field type="number" step="any" name="amount" class="form-control" value="${command?.amount}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'fee'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="transactionAccountTransferCommand.fee.label" default="Transfer Fee"/>
                                <div class="col-sm-10">
                                    <g:field type="number" step="any" name="fee" class="form-control" value="${command?.fee}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <g:submitButton name="Save" class="btn btn-primary"/>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="transactionAccountTransfer.index.table.list.heading"/>
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
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${transactionList}" var="transaction">
                                <tr>
                                    <td>${transaction.comboGroup.id}</td>
                                    <td>${transaction.category}</td>
                                    <td><g:formatDate date="${transaction.date}" format="MM/dd"/></td>
                                    <td><g:formatNumber number="${transaction.amount}" type="currency" currencyCode="USD"/></td>
                                    <td>${transaction.location}</td>
                                    <td style="text-align: center;">
                                        <span class="label-danger">
                                            <g:link action="delete" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');" id="${transaction.id}">X</g:link>
                                        </span>
                                    </td>
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