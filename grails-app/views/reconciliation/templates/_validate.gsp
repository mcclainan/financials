<g:form name="validate" action="validate" class="form-horizontal">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th></th>
                <th>Date</th>
                <th>Location/Description</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Recon Item</td>
                <td id="valTransDate"></td>
                <td id="valTransDesc"></td>
                <td id="valTransAmount"></td>
            </tr>
            <tr>
                <td>Bank Record</td>
                <td id="valRecordDate"></td>
                <td id="valRecordDesc"></td>
                <td id="valRecordAmount"></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4">
                    <g:hiddenField name="reconId" id="reconId"/>
                    <g:hiddenField name="reconType" id="reconType"/>
                    <g:hiddenField name="recordId" id="recordId"/>
                    <g:submitButton name="Validate" class="btn btn-primary" disabled="disabled" id="validateButton"/>
                </td>
            </tr>
        </tfoot>
    </table>
</g:form>