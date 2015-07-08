<%@ page import="org.macsuite.financial.category.Category" %>
<%@ page import="org.macsuite.financial.planning.CreatePlannedTransactionCommand" %>
<div class="col-lg-6">
    <section class="panel">
        <header class="panel-heading">
            <h2><g:message code="plannedTransactionView.create.panel.heading"/> </h2>
        </header>
        <div class=""></div>
        <div class="panel-body">
            <g:render template="/templates/messageBlock"/>
            <g:formRemote name="create" url="[action:'save']" on404="alert('not found!')" class="form-horizontal" update="remote-panel-1">
                <div class="form-group ${fieldError([bean: command, field:'category'],'has-error')}">
                    <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.category.label"/><span class="required">*</span> </label>
                    <div class="col-sm-7">
                        <g:select name="category" class="form-control" from="${Category.findAllByActive(true)}" optionKey="id" optionValue="name" noSelection="['null':'Choose Category']" value="${command?.category?.id}"/>
                    </div>
                </div>
                <div class="form-group" ${fieldError([bean: command, field:'mode'],'has-error')}>
                    <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.mode.label"/><span class="required">*</span> </label>
                    <div class="col-sm-7">
                        <g:select class="form-control sm-input" id="mode" name="mode" value="${command?.mode}"
                                  from="${CreatePlannedTransactionCommand.constraints.mode.inList}"
                                  noSelection="['':'Select Mode']" onChange="modeToggle()"/>
                        <p><g:message code="createPlannedTransactionCommand.mode.tip"/></p>
                    </div>
                </div>
                <div class="form-group ${fieldError([bean: command, field:'startDate'],'has-error')}">
                    <label id="start-date-label" class="col-sm-3 control-label" for="startDate">${command?.mode==CreatePlannedTransactionCommand.SINGLE ?'Date':"${message(code:'createPlannedTransactionCommand.startDate.label')}"}<span class="required">*</span> </label>
                    <div class="col-sm-7">
                        <g:datePicker name="startDate" value="${command?.startDate?:startDate}" class="form-control" precision="day" relativeYears="[-2..7]"/>
                    </div>
                </div>
                <div id="end-date-div" class="form-group ${fieldError([bean: command, field:'endDate'],'has-error')}" style="display: ${command?.mode==CreatePlannedTransactionCommand.SINGLE?'none':''}">
                    <label class="col-sm-3 control-label" for="endDate"><g:message code="createPlannedTransactionCommand.endDate.label"/><span class="required">*</span> </label>
                    <div class="col-sm-7">
                        <g:datePicker name="endDate" value="${command?.endDate?:endDate}" class="form-control" precision="day" relativeYears="[-2..7]"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-3 col-sm-7">
                        <div class="checkbox">
                            <label>
                                <g:checkBox name="replaceCurrent" checked="${command?.replaceCurrent}"/>
                                <g:message code="createPlannedTransactionCommand.replaceCurrent.label"/>
                                <br/><br/>
                            </label>
                        </div>
                    </div>
                </div>
                <br/>
                <div class="form-group ${fieldError([bean: command, field:'amount'],'has-error')} ${fieldError([bean: command, field:'amountMode'],'has-error')}">
                    <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.amount.label"/><span class="required">*</span></label>
                    <div class="col-sm-7">
                        <g:field type="number" step="any" name="amount" class="form-control" value="${command?.amount}"/>
                    </div>
                    <div id="amount-mode-wrapper" style="display: ${command?.mode==CreatePlannedTransactionCommand.SINGLE?'none':''}">
                        <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.amountMode.label"/><span class="required">*</span> </label>
                        <div class="col-lg-7">
                            <div class="radio">
                                <label>
                                    <g:radio name="amountMode" value="${CreatePlannedTransactionCommand.SPREAD}" checked="${command?.amountMode==CreatePlannedTransactionCommand.SPREAD}"/>
                                    <g:message code="createPlannedTransactionCommand.spread.amount.label"/>
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <g:radio name="amountMode" value="${CreatePlannedTransactionCommand.AGGREGATE}" checked="${command?.amountMode==CreatePlannedTransactionCommand.AGGREGATE}"/>
                                    <g:message code="createPlannedTransactionCommand.aggregate.amount.label"/>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="frequency-wrapper" style="display: ${command?.mode==CreatePlannedTransactionCommand.SINGLE?'none':''}">
                    <div class="form-group" ${fieldError([bean: command, field:'frequency'],'has-error')} ${fieldError([bean: command, field:'customFrequency'],'has-error')} ${fieldError([bean: command, field:'customFrequencyType'],'has-error')}>
                        <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.frequency.label"/><span class="required">*</span> </label>
                        <div class="col-lg-7">
                            <g:select class="form-control sm-input" id="frequency" name="frequency" value="${command?.frequency}"
                                      from="${CreatePlannedTransactionCommand.constraints.frequency.inList}"
                                      noSelection="['':'Select Frequency']" onChange="toggleCustomFrequencyDisplay()"/>
                            <p><g:message code="createPlannedTransactionCommand.frequency.tip"/></p>
                        </div>
                        <br/><br/>
                        <div id="custom-frequency-div" style="display: ${command?.frequency==CreatePlannedTransactionCommand.CUSTOM?'':'none'}">
                            <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.custom.frequency.type.label"/></label>
                            <div class="col-sm-7">
                                <g:select from="${CreatePlannedTransactionCommand.CUSTOM_FREQUENCY_TYPE_LIST}" type="number" step="1" name="customFrequencyType" class="form-control sm-input" value="${command?.customFrequencyType}" noSelection="['':'Custom Type']"/>
                                <p><g:message code="createPlannedTransactionCommand.custom.frequency.type.tip"/></p>
                            </div>
                            <label class="col-sm-3 control-label"><g:message code="createPlannedTransactionCommand.custom.frequency.amount.label"/></label>
                            <div class="col-sm-7">
                                <g:field type="number" step="1" name="customFrequency" class="form-control sm-input" value="${command?.customFrequency}"/>
                                <p><g:message code="createPlannedTransactionCommand.custom.frequency.amount.tip"/></p>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-7">
                        <g:submitButton name="Create" class="btn btn-primary"/>
                        <a class="btn btn-danger" data-toggle="modal" href="#deleteModal">
                            <g:message code="plannedTransactionView.create.cancel.button"/>
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
                            <g:message code="plannedTransactionView.create.cancel.confirm.message"/>
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button"><g:message code="default.cancel.label"/></button>
                            <g:link action="index" class="btn btn-info"><g:message code="default.confirm.label"/></g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
