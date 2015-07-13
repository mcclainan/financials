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
<g:if test="${flash.errors}">
    <div class="alert alert-danger fade in" >
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        <ul>
            <g:each in="${flash.errors}" var="content">
                <li>
                    ${content}
                </li>
            </g:each>
        </ul>
    </div>
</g:if>