
<section class="panel">
    <header class="panel-heading">
        ${plannedTransactionList.size()>0? plannedTransactionList.get(0).date.format('MMM dd'):'No'} Plan. (Click date to edit)
    </header>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td><g:message code="plannedTransaction.date.label"/></td>
                    <th><g:message code="category"/>?</th>
                    <th><g:message code="plannedTransaction.amount.label"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${plannedTransactionList}" var="pt">
                    <tr>
                        <td>
                            <g:remoteLink update="remote-panel" action="edit" id="${pt.id}" params="[calendar:true]">
                                <g:formatDate date="${pt.date}" format="MM/dd" after="setView('#remote-panel')"/>
                            </g:remoteLink>
                        </td>
                        <td>${pt.category}</td>
                        <td><g:formatNumber number="${pt.amount}" type="currency" currencyCode="USD"/></td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</section>