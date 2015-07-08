<%@ page import="org.macsuite.financial.category.Category" %>
<div class="col-lg-4">
    <section class="panel">
        <header class="panel-heading">
            <h2>Success</h2>
        </header>
        <div class="panel-body">
            <div class="alert alert-${status} fade in">${raw(statusMessage)}</div>
            <div class="fa-align-center">
                %{--<g:if test="${params.action=='save'}">--}%
                    %{--<g:link action="create" class="btn btn-primary">Create Another</g:link>--}%
                %{--</g:if>--}%
                <g:link action="index" class="btn btn-default">OK</g:link>
            </div>
        </div>
    </section>
</div>