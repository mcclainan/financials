<%@ page import="org.macsuite.financial.planning.PlannedTransaction" %>
<section class="panel">
    <header class="panel-heading dashboard-heading">
        Rolled Planned Transactions
    </header>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td><g:message code="plannedTransaction.date.label"/></td>
                    <th><g:message code="category"/></th>
                    <th><g:message code="plannedTransaction.amount.label"/></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <g:each in="${PlannedTransaction.findAllByRolled(true)}" var="pt">
                    <tr>
                        <td><g:formatDate date="${pt.date}" format="MM/dd" after="setView('#remote-panel-2')"/>
                        <td>${pt.category}</td>
                        <td><g:formatNumber number="${pt.amount}" type="currency" currencyCode="USD"/></td>
                        <td><g:remoteLink update="remote-panel" id="${pt.id}" action="removeRolling" class="btn btn-sm btn-primary">Paid</g:remoteLink> </td>
                    </tr>
                </g:each>
                <g:if test="${!PlannedTransaction.findAllByRolled(true)}">
                    <tr>
                        <td colspan="3">There are no missed items at this time.</td>
                    </tr>
                </g:if>
                </tbody>
            </table>
        </div>
    </div>
</section>