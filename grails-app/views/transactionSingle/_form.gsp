<%@ page import="org.macsuite.financial.category.Category" %>
<%@ page import="org.macsuite.financial.banking.Account" %>
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
<div class="form-group ${fieldError([bean: command, field:'location'],'has-error')}">
    <label class="col-sm-2 control-label"><g:message code="transaction.location.label"/><span class="required">*</span> </label>
    <div class="col-sm-10">
        <g:textField name="location" class="form-control" value="${command?.location}"/>
        <span class="help-block">Where was this purchse made?</span>
    </div>
</div>
<div class="form-group ${fieldError([bean: command, field:'description'],'has-error')}">
    <label class="col-sm-2 control-label"><g:message code="transaction.description.label"/></label>
    <div class="col-sm-10">
        <g:textArea name="description" class="form-control" value="${command?.description}" cols="2"/>
        <span class="help-block">What was purchased?</span>
    </div>
</div>
<div class="form-group ${fieldError([bean: command, field:'amount'],'has-error')}">
    <label class="col-sm-2 control-label"><g:message code="transaction.amount.label"/><span class="required">*</span> </label>
    <div class="col-sm-10">
        <g:field type="number" step="any" name="amount" class="form-control" value="${command?.amount}"/>
    </div>
</div>
<div class="form-group ${fieldError([bean: command, field:'account'],'has-error')}">
    <label class="col-sm-2 control-label"><g:message code="account"/><span class="required">*</span> </label>
    <div class="col-sm-10">
        <g:select name="account" class="form-control" from="${Account.findAllByActive(true)}" optionKey="id" optionValue="title" noSelection="['null':'Choose Account']" value="${command?.account?.id}"/>
    </div>
</div>