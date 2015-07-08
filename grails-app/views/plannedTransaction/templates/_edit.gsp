<%@ page import="org.macsuite.financial.category.Category" %>
<div class="col-lg-4">
    <section class="panel">
        <header class="panel-heading">
            <h2><g:message code="plannedTransactionView.edit.panel.heading" args="${command}"/> </h2>
        </header>
        <div class="panel-body">
            <g:render template="/templates/messageBlock"/>
            <g:formRemote name="edit" url="[action:'update']" on404="alert('not found!')" class="form-horizontal" update="remote-panel-2">
                <div class="form-group ${fieldError([bean: command, field:'date'],'has-error')}">
                    <label class="col-sm-2 control-label" for="date"><g:message code="transaction.date.label"/><span class="required">*</span> </label>
                    <div class="col-sm-10">
                        <g:datePicker name="date" value="${command?.date}" class="form-control" precision="day" relativeYears="[-2..2]"/>
                    </div>
                </div>
                <div class="form-group ${fieldError([bean: command, field:'category'],'has-error')}">
                    <label class="col-sm-2 control-label"><g:message code="category"/><span class="required">*</span> </label>
                    <div class="col-sm-10">
                        <g:select name="category" class="form-control" from="${Category.findAllByActive(true)}" optionKey="id" optionValue="name" noSelection="['null':'Choose Category']" value="${command?.category?.id}"/>
                    </div>
                </div>
                <div class="form-group ${fieldError([bean: command, field:'amount'],'has-error')}">
                    <label class="col-sm-2 control-label"><g:message code="transaction.amount.label"/><span class="required">*</span> </label>
                    <div class="col-sm-10">
                        <g:field type="number" step="any" name="amount" class="form-control" value="${command?.amount}"/>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="checkbox">
                        <label>
                            <g:checkBox name="rolling" checked="${command?.rolling}"/>
                            Planned Transaction is a required Cost.
                            <br/><br/>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <g:hiddenField name="id" value="${command?.id}"/>
                        <g:submitButton name="Update" class="btn btn-primary"/>
                        <a class="btn btn-danger" data-toggle="modal" href="#deleteModal">
                            <g:message code="default.button.delete.label"/>
                        </a>


                    </div>
                </div>
            </g:formRemote>
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
                            <button data-dismiss="modal" class="btn btn-default" type="button"><g:message code="default.cancel.label"/></button>
                            <g:remoteLink data-dismiss="modal" action="multiDelete" update="remote-panel-2" class="btn btn-info" id="${command?.category?.id}" params="['month':command?.date?.getAt(Calendar.MONTH),'year':command?.date?.getAt(Calendar.YEAR)]">Multi Delete</g:remoteLink>
                            <g:link action="delete" id="${command?.id}" class="btn btn-danger"><g:message code="default.confirm.label"/></g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>