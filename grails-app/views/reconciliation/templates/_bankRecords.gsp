<div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>Date</th>
            <th>Description</th>
            <th>Amount</th>
            <th>Choose</th>
            <th>New Trans.</th>
        </tr>
        </thead>
        <tbody>
            <g:each in="${bankRecords}" var="record" status="i">
                <tr>
                    <td id="recordDate${i}"><g:formatDate date="${record.date}" format="MM/dd"/></td>
                    <td id="recordDesc${i}">${record.description}</td>
                    <td id="recordAmount${i}"><g:formatNumber number="${record.amount}" type="currency" currencyCode="USD"/></td>
                    <td >
                        %{--<g:remoteLink class="btn btn-sm btn-primary recordChoose" action="fetchReconForRecord" update="panel-2" id="${i}" params="[bankRecordId:record.id]">Choose</g:remoteLink>--}%
                        <button class="btn btn-sm btn-primary recordChoose" id="${i}">Choose</button>
                        <p style="display: none;" id="recordId${i}">${record.id}</p>
                    </td>
                    <td>
                        <g:remoteLink update="panel-2" action="create" class="btn btn-sm btn-default" id="${record.id}">Create</g:remoteLink>
                    </td>
                </tr>
            </g:each>
            <g:if test="${!bankRecords}">
                <tr>
                    <td colspan="5">Nothing To Display</td>
                </tr>
            </g:if>
        </tbody>
    </table>
</div>
