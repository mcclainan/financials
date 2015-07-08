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
    <title><g:message code="adminAccount.index.title" default="Admin -Account List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bank"></i><g:message code="adminAccount.show.heading" default="Showing Account" args="[accountInstance]"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-bank"></i><g:link action="index"><g:message code="adminAccount.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-bank"></i><g:message code="adminAccount.show.subheading" default="Show"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <g:render template="/templates/notificationBlock"/>
        <div class="row">

            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
                        <div class="row-fluid">
                            <p><span><strong>ID</strong></span>: ${accountInstance.id} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="account.balance.label"/></strong></span>: <g:formatNumber number="${accountInstance.balance}" type="currency" currencyCode="USD"/> </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="account.importFormat.label"/></strong></span>: ${accountInstance.importFormat} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="account.type.label"/></strong></span>: ${accountInstance.type} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="account.active.label"/></strong></span>: ${accountInstance.active?'Yes':'No'} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="account.liquid.label"/></strong></span>: ${accountInstance.liquid?'Yes':'No'} </p>
                        </div>
                        <div class="col-lg-offset-2 col-lg-10">
                            <g:link action="edit" class="btn btn-default btn-lg" id="${accountInstance.id}">Edit</g:link>
                            <g:link action="index" class="btn btn-primary btn-lg">Back</g:link>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
                        <header class="panel-heading">
                            ${accountInstance.title} <g:message code="account.bankRecords.label"/>
                        </header>
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th><g:message code="bankRecord.date.label"/></th>
                                <th><g:message code="bankRecord.description.label"/></th>
                                <th><g:message code="bankRecord.amount.label"/></th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each in="${accountInstance.bankRecords}" var="bankRecord">
                                    <tr>
                                        <td>${bankRecord.id}</td>
                                        <td><g:formatDate date="${bankRecord.date}" format="MM/dd/yyyy"/></td>
                                        <td>${bankRecord.description}</td>
                                        <td><g:formatNumber number="${bankRecord.amount}" type="currency" currencyCode="USD"/></td>
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