<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 7/9/15
  Time: 10:30 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-changeMe"></i><g:message code="" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-bars"></i>Change Me</li>
                </ol>
            </div>
        </div>
        <g:each in="${list}">
            ${it}<br/>
        </g:each>
        <br/><br/><br/>
        <g:each in="${otherList}">
            ${it}<br/>
        </g:each>
        <br/><br/><br/>
        <g:each in="${cumlist}">
            ${it}<br/>
        </g:each>

    </section>
</section>
<!--main content end-->

</body>
</html>