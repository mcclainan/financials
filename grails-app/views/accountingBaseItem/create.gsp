<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 9/3/15
  Time: 12:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.netWorth.AccountingBaseItem" %>
<%@ page import="org.macsuite.financial.banking.Account" %>
<html>
<head>
    <title><g:message code="netWorth.create.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><g:message code="netWorth.create.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li>
                        <g:link controller="accountingBaseItem">
                            <g:message code="netWorth.index.heading" default="Change Me"/>
                        </g:link>
                    </li>
                    <li>
                        <g:message code="netWorth.create.heading" default="Change Me"/>
                    </li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <g:form action="save">
                        <div class="panel-body">
                            <g:render template="/templates/messageBlock"/>
                            <div class="form-group ${fieldError([bean: command, field:'name'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="accountingBaseItem.name.label"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:textField name="name" class="form-control" value="${command?.name}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'description'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="accountingBaseItem.description.label"/></label>
                                <div class="col-sm-10">
                                    <g:textArea name="description" class="form-control" value="${command?.description}" cols="2"/>
                                    <span class="help-block">What was purchased or recieved?</span>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'type'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="accountingBaseItem.type.label"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:select name="type" class="form-control" from="${AccountingBaseItem.TYPE_LIST}" value="${command?.type}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'classification'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="accountingBaseItem.classification.label"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:select name="classification" class="form-control" from="${AccountingBaseItem.CLASSIFICATION_LIST}" value="${command?.classification}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'balance'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="accountingBaseItem.balance.label"/><span class="required">*</span> </label>
                                <div class="col-sm-10">
                                    <g:field type="number" step="any" name="balance" class="form-control" value="${command?.balance}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'limit'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="accountingBaseItem.limit.label"/></label>
                                <div class="col-sm-10">
                                    <g:field type="number" step="any" name="limit" class="form-control" value="${command?.limit}"/>
                                </div>
                            </div>
                            <div class="form-group ${fieldError([bean: command, field:'account'],'has-error')}">
                                <label class="col-sm-2 control-label"><g:message code="account"/></label>
                                <div class="col-sm-10">
                                    <g:select name="account" class="form-control" from="${Account.findAllByActive(true)}" optionKey="id" optionValue="title" noSelection="['null':'Choose Account']" value="${command?.account?.id}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <g:submitButton name="Save" class="btn btn-primary"/>
                                    <g:link controller="accountingBaseItem" class="btn btn-danger">Cancel</g:link>
                                </div>
                            </div>
                        </div>
                    </g:form>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>