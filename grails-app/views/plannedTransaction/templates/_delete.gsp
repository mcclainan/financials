<%@ page import="org.macsuite.financial.category.Category" %>
<div class="col-lg-4">
    <section class="panel">
        <header class="panel-heading">
            <h2><g:message code="plannedTransactionView.delete.panel.heading" args="${command?.category}"/> </h2>
        </header>
        <div class="panel-body">
            <g:render template="/templates/messageBlock"/>
            <g:form  name="delete" action="executeMultiDelete" class="form-horizontal">
                <div class="form-group ${fieldError([bean: command, field:'startDate'],'has-error')}">
                    <label class="col-sm-2 control-label" for="startDate"><g:message code="createPlannedTransactionCommand.startDate.label"/><span class="required">*</span> </label>
                    <div class="col-sm-10">
                        <g:datePicker name="startDate" value="${command?.startDate}" class="form-control" precision="day" relativeYears="[-2..2]"/>
                    </div>
                </div>
                <div class="form-group ${fieldError([bean: command, field:'endDate'],'has-error')}">
                    <label class="col-sm-2 control-label" for="endDate"><g:message code="createPlannedTransactionCommand.endDate.label"/><span class="required">*</span> </label>
                    <div class="col-sm-10">
                        <g:datePicker name="endDate" value="${command?.endDate}" class="form-control" precision="day" relativeYears="[-2..2]"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <g:link action="index" class="btn btn-primary">Reset</g:link>
                        <a class="btn btn-danger" data-toggle="modal" href="#deleteModal">
                            <g:message code="default.button.delete.label"/>
                        </a>
                    </div>
                </div>
                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><g:message code="transactionSingle.edit.delete.confirm.title"/></h4>
                            </div>
                            <div class="modal-body">
                                <g:message code="plannedTransactionView.edit.delete.message"/>
                            </div>
                            <div class="modal-footer">
                                <g:hiddenField name="category" value="${command.category.id}"/>
                                <button data-dismiss="modal" class="btn btn-default" type="button"><g:message code="default.cancel.label"/></button>
                                <g:submitButton name="${message(code: 'default.confirm.label')}" class="btn btn-danger"/>
                            </div>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </section>
</div>