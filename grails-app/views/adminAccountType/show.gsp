<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.banking.ImportFormat" %>
<html>
<head>
    <title><g:message code="adminImportFormat.index.title" default="Admin -ImportFormat List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bars"></i><g:message code="adminAccountType.show.heading" default="Showing ImportFormat" args="[accountTypeInstance]"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-bars"></i><g:link action="index"><g:message code="adminImportFormat.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-bars"></i><g:message code="adminImportFormat.show.subheading" default="Show"/></li>
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
                            <p><span><strong>ID</strong></span>: ${accountTypeInstance.id} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="accountType.type.label"/></strong></span>: ${accountTypeInstance.type} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="accountType.resourceType.label"/></strong></span>: ${accountTypeInstance.resourceType} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="accountType.active.label"/></strong></span>: ${accountTypeInstance.active?'Yes':'No'} </p>
                        </div>
                        <div class="col-lg-offset-2 col-lg-10">
                            <g:link action="edit" class="btn btn-primary btn-lg" id="${accountTypeInstance.id}">Edit</g:link>
                            <g:link action="index" class="btn btn-primary btn-lg">Back</g:link>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <header class="panel-heading">
                            ${accountTypeInstance.type} <g:message code="importFormat.accounts.label"/>
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
                                <g:each in="${accountTypeInstance.accounts}" var="account">
                                    <tr>
                                        <td>${account.id}</td>
                                        <td>
                                            <g:link controller="adminCategory" action="show" id="${account.id}">
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
                                <div class="form-group">
                                    <label for="title"><g:message code="account.title.label"/><span class="required">*</span></label>
                                    <g:textField name="title" class="form-control" placeholder="Enter Name" required="required" value="${command?.title}"/>
                                </div>
                                <div class="form-group">
                                    <label for="importFormat"><g:message code="account.importFormat.label"/><span class="required">*</span></label>
                                    <g:select from="${ImportFormat.findAllByActive(true)}" name="importFormat"
                                              class="form-control m-bot15" optionValue="name" optionKey="id"
                                              value="${command?.importFormat?.id}" noSelection="['':'Choose']"/>
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
                                        <g:hiddenField name="accountType" value="${accountTypeInstance}"/>
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