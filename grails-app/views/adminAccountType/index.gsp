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
    <title><g:message code="adminAccountType.index.title" default="Admin -Bank List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bars"></i><g:message code="adminAccountType.index.heading" default="Bank List"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-bars"></i><g:message code="adminAccountType.index.heading" default="Bank"/></li>

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
                                        <g:message code="adminAccountType.index.subheading" default="List"/>
                                        <g:render template="/templates/notificationBlock"/>
                                    </header>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th><g:message code="accountType.type.label"/></th>
                                                <th><g:message code="accountType.active.label"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${accountTypeList}" var="accountType">
                                                <tr>
                                                    <td>${accountType.id}</td>
                                                    <td><g:link action="show" id="${accountType.id}">${accountType.type}</g:link></td>
                                                    <td>${accountType.active ? 'Yes' : 'No'}</td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="text-center">
                                                            <ul class="pagination pagination-lg">
                                                                <g:paginate total="${accountTypeCount}" prev="${raw("<")}" next="${raw(">")}" maxsteps="5"/>
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
                                        New Account Type
                                    </header>
                                    <div class="panel-body">
                                        <g:form action="save">
                                            <g:render template="/templates/messageBlock"/>
                                            <div class="form-group">
                                                <label for="type"><g:message code="accountType.type.label"/><span class="required">*</span> </label>
                                                <g:textField name="type" class="form-control" placeholder="Enter Name" value="${command?.type}" required="required"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="resourceType"><g:message code="accountType.resourceType.label"/> </label>
                                                <g:select name="resourceType" from="${AccountType.constraints.resourceType.inList}" value="${command?.resourceType}" class="form-control" />
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