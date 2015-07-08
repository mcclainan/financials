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
    <title><g:message code="adminAccount.edit.title" default="Admin -Account Edit"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bank"></i><g:message code="account" default="Change Me"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-bank"></i><g:link action="index"><g:message code="adminAccount.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-bank"></i><g:message code="adminAccount.edit.heading" default="Edit"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-3">
                <section class="panel">
                    <header class="panel-heading">
                        Edit Main Category
                    </header>
                    <div class="panel-body">
                        <g:form action="update">
                            <g:render template="/templates/messageBlock"/>
                            <div class="form-group">
                                <label for="title"><g:message code="account.title.label"/> </label>
                                <g:textField name="title" class="form-control" placeholder="Enter title" value="${command?.title}"/>
                            </div>
                            <div class="form-group">
                                <label for="type"><g:message code="account.type.label"/></label>
                                <g:select name="type" from="${AccountType.findAllByActive(true)}"
                                          value="${command?.type.id}" class="form-control"
                                          optionKey="id" optionValue="type" noSelection="['null':'Choose']"/>
                            </div>
                            <div class="form-group">
                                <label for="importFormat"><g:message code="account.importFormat.label"/> </label>
                                <g:select name="importFormat" from="${ImportFormat.findAllByActive(true)}"
                                          value="${command?.importFormat.id}" class="form-control"
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
                            <div class="form-group">
                                <g:hiddenField name="id" value="${command?.id}"/>
                                <g:submitButton name="Update" class="btn btn-primary"/>
                            </div>
                        </g:form>
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