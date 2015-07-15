<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Location</th>
                <th>Amount</th>
                <th>Choose</th>
                %{--<th>Remove</th>--}%
            </tr>
        </thead>
        <tbody>
            <g:each in="${reconBeans}" var="bean" status="i">
                <tr>
                    <td id="itemDate${i}"><g:formatDate date="${bean.date}" format="MM/dd"/></td>
                    <td id="itemDesc${i}">${bean.location}</td>
                    <td id="itemAmount${i}"><g:formatNumber number="${bean.amount}" type="currency" currencyCode="USD"/></td>
                    <td >
                        <button class="btn btn-sm btn-primary reconChoose" id="${i}">Choose</button>
                        <p style="display: none;" id="itemId${i}">${bean.id}</p>
                        <p style="display: none;" id="itemType${i}">${bean.type}</p>
                    </td>
                    %{--<td>--}%
                        %{--<g:link action="remove" id="${bean.id}"--}%
                                %{--params="['year':bean.date.getAt(Calendar.YEAR),'month':bean.date.getAt(Calendar.YEAR),'type':bean.type,'accountId':bean.account.id]"--}%
                                %{--name="button" title="Remove From Session" data-placement="top" data-toggle="tooltip" class="btn btn-danger tooltips" >Remove</g:link>--}%
                    %{--</td>--}%
                </tr>
            </g:each>
            <g:if test="${!reconBeans}">
                <tr>
                    <td colspan="5">Nothing To Display</td>
                </tr>
            </g:if>
        </tbody>
        %{--<g:if test="${bankRecord}">--}%
            %{--<tfoot>--}%
                %{--<tr>--}%
                    %{--<td><g:remoteLink update="panel-2" action="create" class="btn btn-primary btn-lg btn-block" id="${bankRecord.id}" value="Create Transaction for ${bankRecord.description}"/></td>--}%
                %{--</tr>--}%
            %{--</tfoot>--}%
        %{--</g:if>--}%
    </table>
</div>
