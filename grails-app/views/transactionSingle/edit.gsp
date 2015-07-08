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
    <title><g:message code="transactionSingle.edit.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><g:message code="transactionSingle.edit.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-shopping-cart"></i><g:link controller="transactionHome"><g:message code="transaction.index.heading" default="Change Me"/></g:link> </li>
                    <li><g:link action="index"><g:message code="transactionSingle.index.heading" default="Change Me"/></g:link></li>
                    <li><g:message code="transactionSingle.edit.heading" default="Change Me"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="col-lg-4">
            <g:render template="/templates/notificationBlock"/>
            <section class="panel">
                <div class="panel-body">
                    <g:render template="/templates/messageBlock"/>
                    <g:form action="update" class="form-horizontal " >
                        <g:render template="form"/>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <g:hiddenField name="id" value="${command?.id}"/>
                                <g:submitButton name="Update" class="btn btn-primary"/>
                                <a class="btn btn-danger" data-toggle="modal" href="#deleteModal">
                                    <g:message code="default.button.delete.label"/>
                                </a>
                                <g:link class="btn btn-default" action="index"><g:message code="transactionSingle.edit.return.to.index.button"/></g:link>
                                <!-- Modal -->
                                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title"><g:message code="transactionSingle.edit.delete.confirm.title"/></h4>
                                            </div>
                                            <div class="modal-body">
                                                <g:message code="transactionSingle.edit.delete.confirm.message"/>
                                                <g:if test="${command.comboGroup}">
                                                    <br/>
                                                    <g:message code="transactionSingle.edit.multiDelete.confirm.message" args="${command.comboGroup.transactions.size()-1}"/>
                                                </g:if>
                                            </div>
                                            <div class="modal-footer">
                                                <g:hiddenField name="comboGroup" value="${command?.comboGroup?.id}"/>
                                                <button data-dismiss="modal" class="btn btn-default" type="button"><g:message code="default.cancel.label"/></button>
                                                <g:link action="delete" id="${command?.id}" class="btn btn-danger"><g:message code="default.confirm.label"/></g:link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:form>
                </div>
            </section>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>