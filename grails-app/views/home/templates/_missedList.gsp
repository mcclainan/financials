<section class="panel">
    <header class="panel-heading dashboard-heading">
        Missed Planned Transactions
    </header>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td><g:message code="plannedTransaction.date.label"/></td>
                    <th><g:message code="category"/></th>
                    <th><g:message code="plannedTransaction.amount.label"/></th>

                </tr>
                </thead>
                <tbody>

                <g:each in="${missedList}" var="pt">
                    <tr>
                        <td><g:formatDate date="${pt.date}" format="MM/dd" after="setView('#remote-panel-2')"/>
                        <td>${pt.category}</td>
                        <td><g:formatNumber number="${pt.amount}" type="currency" currencyCode="USD"/></td>
                    </tr>
                </g:each>
                <g:if test="${!missedList}">
                    <tr>
                        <td colspan="3">There are no missed items at this time.</td>
                    </tr>
                </g:if>
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