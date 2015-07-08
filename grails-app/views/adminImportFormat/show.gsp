<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.banking.AccountType" %>
<html>
<head>
    <title><g:message code="adminImportFormat.index.title" default="Admin -Import Format List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-code-fork"></i><g:message code="adminImportFormat.show.heading" default="Showing ImportFormat" args="[importFormatInstance]"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-code-fork"></i><g:link action="index"><g:message code="adminImportFormat.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-code-fork"></i><g:message code="adminImportFormat.show.subheading" default="Show"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <g:render template="/templates/notificationBlock"/>
        <div class="row">

            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <div class="row-fluid">
                            <p><span><strong>ID</strong></span>: ${importFormatInstance.id} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="importFormat.active.label"/></strong></span>: ${importFormatInstance.active?'Yes':'No'} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="importFormat.dateColumn.label"/></strong></span>: ${importFormatInstance.dateColumn} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="importFormat.descriptionColumn.label"/></strong></span>: ${importFormatInstance.descriptionColumn} </p>
                        </div>
                        <g:if test="${importFormatInstance.amountColumn}">
                            <div class="row-fluid">
                                <p><span><strong><g:message code="importFormat.amountColumn.label"/></strong></span>: ${importFormatInstance.amountColumn} </p>
                            </div>
                        </g:if>
                        <g:if test="${importFormatInstance.hasMultipleAmountColumns}">
                            <div class="row-fluid">
                                <p><span><strong><g:message code="importFormat.hasMultipleAmountColumns.label"/></strong></span>: ${importFormatInstance.hasMultipleAmountColumns} </p>
                            </div>
                        </g:if>
                        <g:if test="${importFormatInstance.creditColumn}">
                            <div class="row-fluid">
                                <p><span><strong><g:message code="importFormat.creditColumn.label"/></strong></span>: ${importFormatInstance.creditColumn} </p>
                            </div>
                        </g:if>
                        <g:if test="${importFormatInstance.debitColumn}">
                            <div class="row-fluid">
                                <p><span><strong><g:message code="importFormat.debitColumn.label"/></strong></span>: ${importFormatInstance.debitColumn} </p>
                            </div>
                        </g:if>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="importFormat.hasHeading.label"/></strong></span>: ${importFormatInstance.hasHeading?'Yes':'No'} </p>
                        </div>


                        <div class="col-lg-offset-2 col-lg-10">
                            <g:link action="edit" class="btn btn-default btn-lg" id="${importFormatInstance.id}">Edit</g:link>
                            <g:link action="index" class="btn btn-primary btn-lg">Back</g:link>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <header class="panel-heading">
                            ${importFormatInstance.name} <g:message code="importFormat.accounts.label"/>
                        </header>
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th><g:message code="account.title.label"/></th>
                                <th><g:message code="account.balance.label"/></th>
                                <th><g:message code="account.type.label"/></th>
                                <th><g:message code="account.liquid.label"/></th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each in="${importFormatInstance.accounts}" var="account">
                                    <tr>
                                        <td>${account.id}</td>
                                        <td>
                                            <g:link controller="adminImportFormat" action="show" id="${account.id}">
                                                ${account.title}
                                            </g:link>
                                        </td>
                                        <td><g:formatNumber number="${account.balance}" type="currency" currencyCode="USD"/></td>
                                        <td>${account.type}</td>
                                        <td>${account.liquid}</td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <header class="panel-heading">
                            New <g:message code="account"/>
                        </header>
                        <div class="panel-body">
                            <g:form action="saveAccount">
                                <g:render template="/templates/messageBlock"/>
                                <div class="form-group">
                                    <label for="title"><g:message code="account.title.label"/><span class="required">*</span></label>
                                    <g:textField name="title" class="form-control" placeholder="Enter Name" value="${command?.title}" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="type"><g:message code="account.type.label"/><span class="required">*</span></label>
                                    <g:select from="${AccountType.findAllByActive(true)}" name="type"
                                              class="form-control m-bot15" optionValue="type" optionKey="id"
                                              value="${command?.type?.id}" noSelection="['':'Choose']" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="balance"><g:message code="account.balance.label"/></label>
                                    <g:field name="balance" type="number" step="any" class="form-control" cols="4" value="${command?.balance}"/>
                                </div>
                                <div class="col-lg-10">
                                    <div class="checkbox">
                                        <label>
                                            <g:checkBox name="liquid" checked="${command?.liquid}"/>
                                            <g:message code="accountCommand.liquid.tip"/>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-10">
                                        <g:hiddenField id="importFormat" name="importFormat.id" value="${importFormatInstance.id}"/>
                                        <g:submitButton name="Save" class="btn-lg btn-primary"/>
                                    </div>
                                </div>
                            </g:form>

                        </div>
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