<g:if test="${flash.notif}">
    <div class="alert alert-${flash.notif.status} fade in" >
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        ${flash.notif.content}
    </div>
</g:if>
    <g:if test="${notif}">
    <div class="alert alert-${notif.status} fade in" >
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        ${notif.content}
    </div>
</g:if>