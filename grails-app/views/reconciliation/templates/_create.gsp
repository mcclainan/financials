<g:form action="save" class="form-horizontal">
    <g:render template="/templates/messageBlock"/>
    <g:render template="/transactionSingle/form"/>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <g:submitButton name="Save" class="btn btn-primary"/>
            <g:link action="refresh" class="btn btn-close"
                    params="['year':command.date.getAt(Calendar.YEAR),'month':command.date.getAt(Calendar.MONTH),'accountId':command.account.id]">
                Reset
            </g:link>
            <g:hiddenField name="bankRecord" value="${command.bankRecord.id}"/>
        </div>
    </div>
</g:form>