<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.banking.AccountType" %>
<%@ page import="org.macsuite.financial.banking.ImportFormat" %>
<html>
<head>
    <title><g:message code="adminAccount.index.title" default="Admin -Account List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bank"></i><g:message code="adminAccount.index.heading" default="Account List"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-bank"></i><g:message code="adminAccount.index.heading" default="Account"/></li>

                </ol>
            </div>
        </div>
        <g:render template="/templates/notificationBlock"/>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <g:message code="adminAccount.index.subheading" default="List"/>
                                        <g:render template="/templates/notificationBlock"/>
                                    </header>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th><g:message code="account.title.label"/></th>
                                                <th><g:message code="account.balance.label"/></th>
                                                <th><g:message code="account.type.label"/></th>
                                                <th><g:message code="account.active.label"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${accountList}" var="account">
                                                <tr>
                                                    <td>${account.id}</td>
                                                    <td><g:link action="show" id="${account.id}">${account.title}</g:link></td>
                                                    <td><g:formatNumber number="${account.balance}" type="currency" currencyCode="USD"/> </td>
                                                    <td>${account.type}</td>
                                                    <td>${account.active ? 'Yes' : 'No'}</td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="text-center">
                                                            <ul class="pagination pagination-lg">
                                                                <g:paginate total="${accountCount}" prev="${raw("<")}" next="${raw(">")}" maxsteps="5"/>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                </section>
                            </div>
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        New Account
                                    </header>
                                    <div class="panel-body">
                                        <g:form action="save">
                                            <g:render template="/templates/messageBlock"/>
                                            <div class="form-group">
                                                <label for="title"><g:message code="account.title.label"/> </label>
                                                <g:textField name="title" class="form-control" placeholder="Enter title" value="${command?.title}"/>
                                            </div>
                                            <div class="form-group">
                                            	<label for="type"><g:message code="account.type.label"/></label>
                                            	<g:select name="type" from="${AccountType.findAllByActive(true)}" 
                                            	          value="${command?.type}" class="form-control" 
                                            	          optionKey="id" optionValue="type" noSelection="['null':'Choose']"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="importFormat"><g:message code="account.importFormat.label"/> </label>
                                                <g:select name="importFormat" from="${ImportFormat.findAllByActive(true)}" 
                                                		  value="${command?.importFormat}" class="form-control" 
                                                		  optionKey="id" optionValue="name" noSelection="['null':'Choose']"/>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="checkbox">
                                                    <label>
                                                        <g:checkBox name="liquid" checked="${command?.liquid}"/>
                                                        This account contains liquid assets.
                                                    </label>
                                                </div>
                                            </div>
                                            <g:submitButton name="Save" class="btn btn-primary"/>
                                        </g:form>
                                    </div>
                                </section>
                            </div>
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