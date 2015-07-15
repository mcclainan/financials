<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 7/13/15
  Time: 10:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.banking.Account" %>
<html>
<head>
    <title><g:message code="" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-changeMe"></i>Reconciliation</h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa"></i>Reconciliation</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">Select Month and Account</header>
                    <div class="panel-body">
                        <g:render template="/templates/messageBlock"/>
                        <g:form name="recon" action='recon' class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="date">Month</label>
                                <div class="col-lg-10">
                                    <g:datePicker name="date" precision="month" value="${command?.date}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="account">Account</label>
                                <div class="col-lg-4">
                                    <g:select name="account" class="form-control" from="${Account.findAllByActive(true)}"
                                              noSelection="['':'Choose Account']" optionKey="id" optionValue="title" value="${command?.account?.id}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <g:submitButton name="Start" class="btn btn-primary"/>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">Validation</header>
                    <div class="panel-body" id="panel-1">
                        <g:render template="templates/validate"/>
                    </div>
                </section>
            </div>
        </div>
        <div class="row" id="row">
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">Bank Records</header>
                    <div class="panel-body" id="panel-3">
                        <g:render template="templates/bankRecords"/>
                    </div>
                </section>
            </div>
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">Recon Items</header>
                    <div class="panel-body" id="panel-2">
                        <g:render template="templates/reconItems"/>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>
<!--main content end-->

</body>
</html>