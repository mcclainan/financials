<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.category.Category" %>
<html>
<head>
    <title><g:message code="transactionCombo.index.title" default="Change Me"/></title>
    <g:set var="transactionList" value="${session.pendingTransactions}"/>
    <g:set var="groupCommand" value="${session.groupCommand}"/>
    
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"></i><g:message code="transactionCombo.create.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:link controller="transactionHome"><g:message code="transaction.index.heading"/></g:link></li>
                    <li><g:link controller="transactionCombo"><g:message code="transactionCombo.index.heading"/></g:link></li>
                    <li><g:message code="transactionCombo.create.heading"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-3">
                <section class="panel">
                    <div class="panel-body">
                        <g:render template="/templates/messageBlock"/>
                        <g:form action="addTransaction" role="form">
                            <div class="form-group">
                                <label for="description"><g:message code="transactionCombo.create.remainder" default="Remaining Amount"/></label>
                                <input type="text" class="form-control" value="${formatNumber(number:total,type: 'currency', currencyCode: 'USD')}" disabled="disabled">
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'description'],'has-error')}">
                                <label for="description"><g:message code="transaction.description.label"/></label>
                                <g:textField name="description" class="form-control" value="${command?.description}"/>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'amount'],'has-error')}">
                                <label for="amount"><g:message code="transaction.amount.label" default="Amount"/></label>
                                <g:field type="number" step="any" name="amount" class="form-control" value="${command?.amount}"/>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'category'],'has-error')}">
                                <label for="category"><g:message code="category"/></label>
                                <g:select name="category" from="${Category.findAllByActive(true)}"
                                          optionKey="id" optionValue="name" noSelection="['':'-Choose Category-']"
                                          value="${command?.category?.id}" class="form-control"/>
                            </div>
                            <g:if test="${!session.cashBack}">
                                <div class="form-group ${fieldError([bean: command, field:'amount'],'has-error')}">
                                    <label for="cashBack">Cash Back</label>
                                    <g:field type="number" step="any" name="cashBack" class="form-control" value="${command?.cashBack}"/>
                                </div>
                            </g:if>
                            <g:if test="${done}">
                                <g:actionSubmit value="Save" action="save" class="btn btn-primary"/>
                            </g:if>
                            <g:else>
                                <g:submitButton name="Add" class="btn btn-primary"/>
                                <a class="btn btn-danger" data-toggle="modal" href="#cancelModal">
                                    <g:message code="default.cancel.label" default="Cancel"/>
                                </a>
                                <!-- Modal -->
                                <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title"><g:message code="transactionCombo.create.cancel.heading"/></h4>
                                            </div>
                                            <div class="modal-body">
                                                <g:message code="transactionCombo.create.cancel.confirm.message" args="${transactionList.size()}"/>
                                            </div>
                                            <div class="modal-footer">
                                                <button data-dismiss="modal" class="btn btn-default" type="button"><g:message code="default.cancel.label"/></button>
                                                <g:link action="index" class="btn btn-danger"><g:message code="default.confirm.label"/></g:link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:else>
                        </g:form>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="transactionCombo.index.table.list.heading"/>
                    </header>
                    <div class="panel-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th><g:message code="transaction.description.label"/></th>
                                <th><g:message code="transaction.amount.label"/></th>
                                <th><g:message code="category"/></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${transactionList}" var="transaction" status="index">
                                <tr>
                                    <td>${transaction.description}</td>
                                    <td><g:formatNumber number="${transaction.amount}" type="currency" currencyCode="USD"/></td>
                                    <td>${transaction.category}</td>
                                    <td style="text-align: center;"><span class="label-danger"><g:link action="removeTransaction" class="btn btn-danger btn-sm" id="${index}">X</g:link></span></td>
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