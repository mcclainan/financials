<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.category.Category" %>
<%@ page import="org.macsuite.financial.banking.Account" %>
<html>
<head>
    <title><g:message code="transactionSingle.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><g:message code="transactionSingle.index.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:link controller="transactionHome"><g:message code="transaction.index.heading" default="Change Me"/></g:link></li>
                    <li><g:message code="transactionSingle.index.heading" default="Change Me"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="col-lg-4">
            <g:render template="/templates/notificationBlock"/>
            <section class="panel">
                <header class="panel-heading">
                    <g:message code="transactionSingle.index.form.heading"/>
                </header>
                <div class="panel-body">
                    <g:render template="/templates/messageBlock"/>
                    <g:form action="save" class="form-horizontal " >
                        <g:render template="form"/>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <g:submitButton name="Save" class="btn btn-primary"/>
                            </div>
                        </div>
                    </g:form>
                </div>
            </section>
        </div>
        <div class="col-lg-8">
            <section class="panel">
                <div class="panel-body">
                    <header class="panel-heading">
                        <g:message code="transactionSingle.index.table.list.heading"/>
                    </header>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th><g:message code="transaction.date.label"/></th>
                                <th><g:message code="transaction.location.label"/></th>
                                <th><g:message code="transaction.amount.label"/></th>
                                <th><g:message code="account"/></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each in="${transactionList}" var="transaction">
                                    <tr>
                                        <td><g:formatDate date="${transaction.date}" format="MM/dd"/></td>
                                        <td>${transaction.location}</td>
                                        <td>${transaction.amount}</td>
                                        <td>${transaction.account}</td>
                                        <td><g:link action="edit" id="${transaction.id}">Edit</g:link></td>
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
                </div>
            </section>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>