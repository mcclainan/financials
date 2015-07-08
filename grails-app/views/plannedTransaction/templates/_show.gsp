<div id="remote-panel-1">
    <div class="col-lg-4">
        <section class="panel">
            <header class="panel-heading">
                <h2><g:message code="plannedTransactionView.show.panel.heading" args="${plannedTransactionList?.get(0)?.category}"/> </h2>
            </header>
            <div class="panel-body">
                <div class="alert alert-info fade in">Click on a date to edit.</div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td><g:message code="plannedTransaction.date.label"/></td>
                        <th><g:message code="plannedTransaction.amount.label"/></th>
                        <th><g:message code="plannedTransaction.rolling.label"/>?</th>

                    </tr>
                    </thead>
                    <tbody>
                        <g:each in="${plannedTransactionList}" var="pt">
                            <tr>
                                <td><g:remoteLink action="edit" update="remote-panel-2" id="${pt.id}"><g:formatDate date="${pt.date}" format="MM/dd" after="setView('#remote-panel-2')"/></g:remoteLink></td>
                                <td><g:formatNumber number="${pt.amount}" type="currency" currencyCode="USD"/></td>
                                <td><g:formatBoolean boolean="${pt.rolling}" true="Rolling" false="Not Rolling"/></td>
                            </tr>
                        </g:each>
                    </tbody>
                    <tfoot>
                        <g:if test="${plannedTransactionCount > 10}">
                            <tr>
                                <td colspan="3">
                                    <div class="text-center">
                                        <util:remotePaginate total="${plannedTransactionCount}" action="show" update="remote-panel-1" id="${category}" params="['month':month,'year':year]"/>
                                    </div>
                                </td>
                            </tr>
                        </g:if>
                        <tr>
                            <td colspan="3">
                                <div class="text-center">
                                    <g:link action="index" class="btn btn-info">Reset</g:link>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </section>
    </div>
</div>
<div id="remote-panel-2">

</div>