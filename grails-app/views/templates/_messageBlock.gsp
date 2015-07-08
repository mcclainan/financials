<g:hasErrors bean="${command}">
    <div class="alert alert-danger fade in" >
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        <g:renderErrors bean="${command}"/>
    </div>
</g:hasErrors>

<g:if test="${msg}">
    <div class="alert alert-${msg.status} fade in" >
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        ${msg.message}
    </div>
</g:if>
<g:if test="${flash.msg}">
    <div class="alert alert-${flash.msg.status} fade in" >
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        ${flash.msg.contnent}
    </div>
</g:if>