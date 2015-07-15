/**
 * Created by tony on 7/2/15.
 */
$(document).ready(function(){
    $(".reconChoose").click(function(){
        var id = $(this).attr("id")
        var dateId = "#itemDate"+id
        var descId = "#itemDesc"+id
        var amountId = "#itemAmount"+id
        var itemId = "#itemId"+id
        var itemType = "#itemType"+id

        $('#valTransDate').html($(dateId).text())
        $('#valTransDesc').html($(descId).text())
        $('#valTransAmount').html($(amountId).text())
        $('#reconId').val($(itemId).text())
        $('#reconType').val($(itemType).text())
        if($('#recordId').val()!=null){
            $('#validateButton').removeAttr('disabled')
        }
    });

    $(".recordChoose").click(function(){
        var id = $(this).attr("id")
        var dateId = "#recordDate"+id
        var descId = "#recordDesc"+id
        var amountId = "#recordAmount"+id
        var recordId = "#recordId"+id
        $('#valRecordDate').html($(dateId).text())
        $('#valRecordDesc').html($(descId).text())
        $('#valRecordAmount').html($(amountId).text())
        $('#recordId').val($(recordId).text())
        $('#valTransDate').html("")
        $('#valTransDesc').html("")
        $('#valTransAmount').html("")
        $('#reconId').val("")
        $('#validateButton').attr('disabled','disabled')
    });

});
function clearForm(){
    document.getElementById('valTransDate').innerHTML = "";
    document.getElementById('valTransDesc').innerHTML = "";
    document.getElementById('valTransAmount').innerHTML = "";
    document.getElementById('valRecordDate').innerHTML = "";
    document.getElementById('valRecordDesc').innerHTML = "";
    document.getElementById('valRecordAmount').innerHTML = "";
}
