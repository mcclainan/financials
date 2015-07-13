<div class="col-lg-4" id="remote-panel">
    <section class="panel">
        <header class="panel-heading">
            Missed Planned Transactions
        </header>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td><g:message code="plannedTransaction.date.label"/></td>
                        <th><g:message code="plannedTransaction.amount.label"/></th>
                        <th><g:message code="plannedTransaction.rolling.label"/>?</th>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${missedList}" var="pt">
                        <tr>
                            <td><g:formatDate date="${pt.date}" format="MM/dd" after="setView('#remote-panel-2')"/>
                            <td><g:formatNumber number="${pt.amount}" type="currency" currencyCode="USD"/></td>
                            <td><g:formatBoolean boolean="${pt.rolling}" true="Rolling" false="Not Rolling"/></td>
                        </tr>
                    </g:each>
                    </tbody>
                    <tfoot>
                    <g:if test="${missedCount > 10}">
                        <tr>
                            <td colspan="3">
                                <div class="text-center">
                                    <util:remotePaginate total="${missedCount}" action="show" update="remote-panel"/>
                                </div>
                            </td>
                        </tr>
                    </g:if>
                    </tfoot>
                </table>
            </div>
        </div>
    </section>
</div>