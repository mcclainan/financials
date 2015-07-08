/**
 * Created by tony on 7/1/15.
 */

function setDisplay(elementId,display){
    document.getElementById(elementId).diplay=display
}

function modeToggle(){
    var value = document.getElementById('mode').value
    var dateDiv = document.getElementById('end-date-div')
    var dateLabel = document.getElementById('start-date-label')
    var frequency = document.getElementById('amount-mode-wrapper')
    var amountMode = document.getElementById('frequency-wrapper')

    if(value=='Single'){
        dateDiv.style.display='none'
        dateLabel.innerHTML='Date <span class="required">*</span>'
        frequency.style.display='none'
        amountMode.style.display='none'

    }else{
        dateDiv.style.display=''
        dateLabel.innerHTML='Start Date<span class="required">*</span>'
        frequency.style.display=''
        amountMode.style.display=''
    }
}

function toggleCustomFrequencyDisplay(){
    var value = document.getElementById('frequency').value
    var custom = document.getElementById('custom-frequency-div')

    if(value=='Custom'){
        custom.style.display=''

    }else{
        custom.style.display='none'
    }
}

function setView(viewId){
    window.location.replace(viewId)
}