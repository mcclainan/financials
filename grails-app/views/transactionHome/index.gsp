<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/16/15
  Time: 6:22 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="transaction.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-shopping-cart"></i><g:message code="transaction.index.title" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:message code="transaction.index.heading"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
                        <div class="panel-heading">
                            <h2><g:message code="transaction.index.single.heading"/></h2>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><g:message code="transaction.date.label"/></th>
                                    <th><g:message code="transaction.location.label"/></th>
                                    <th><g:message code="category"/></th>
                                    <th><g:message code="transaction.amount.label"/></th>
                                    <th><g:message code="account"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${singleList}" var="transaction">
                                    <tr>
                                        <td><g:formatDate date="${transaction.date}" format="MM/dd"/></td>
                                        <td>${transaction.location}</td>
                                        <td>${transaction.account}</td>
                                        <td>${transaction.amount}</td>
                                        <td>${transaction.account}</td>
                                    </tr>
                                </g:each>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <g:link controller="transactionSingle" class="btn btn-primary"><g:message code="transactionSingle.index.heading"/></g:link>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
                        <div class="panel-heading">
                            <h2><g:message code="transaction.index.combo.heading"/></h2>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><g:message code="transactionComboGroup.id.label" default="Group ID"/></th>
                                    <th><g:message code="transaction.date.label"/></th>
                                    <th><g:message code="transaction.location.label"/></th>
                                    <th><g:message code="category"/></th>
                                    <th><g:message code="transaction.amount.label"/></th>
                                    <th><g:message code="account"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${comboList}" var="transaction">
                                    <tr>
                                        <td>${transaction?.comboGroup?.id}</td>
                                        <td><g:formatDate date="${transaction.date}" format="MM/dd"/></td>
                                        <td>${transaction.location}</td>
                                        <td>${transaction.category}</td>
                                        <td>${transaction.amount}</td>
                                        <td>${transaction.account}</td>
                                    </tr>
                                </g:each>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="4">
                                        <g:link controller="transactionCombo" class="btn btn-primary"><g:message code="transactionCombo.index.heading" default="Combo Transactions"/></g:link>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <div class="panel-body">
                        <div class="panel-heading">
                            <h2><g:message code="transaction.index.transfer.heading"/></h2>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th><g:message code="transactionComboGroup.id.label" default="Group ID"/></th>
                                    <th><g:message code="transaction.date.label"/></th>
                                    <th><g:message code="transaction.location.label"/></th>
                                    <th><g:message code="category"/></th>
                                    <th><g:message code="transaction.amount.label"/></th>
                                    <th><g:message code="account"/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${transferList}" var="transaction">
                                    <tr>
                                        <td>${transaction?.comboGroup?.id}</td>
                                        <td><g:formatDate date="${transaction.date}" format="MM/dd"/></td>
                                        <td>${transaction.location}</td>
                                        <td>${transaction.category}</td>
                                        <td>${transaction.amount}</td>
                                        <td>${transaction.account}</td>
                                    </tr>
                                </g:each>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="4">
                                        <g:link controller="transactionAccountTransfer" class="btn btn-primary"><g:message code="transactionAccountTransfer.index.heading" default="Combo Transactions"/></g:link>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
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