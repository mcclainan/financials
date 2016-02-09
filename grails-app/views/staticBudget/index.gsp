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
                    <li><i class="fa fa-bars"></i>Static Budget and Comparison</li>
                </ol>
            </div>
        </div>

        <g:each in="${cumlist}">
            ${it}<br/>
        </g:each>
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading">
                        <h2>Income</h2>
                    </header>
                    <div class="panel-body">
                        <table class="table table-condensed">
                            <g:each in="${list}" var="b">
                                <tr>
                                    <td>
                                        ${b.category}
                                    </td>
                                    <td>${b.amount}</td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                    <header class="panel-heading">
                        <h2>Expenses</h2>
                    </header>
                    <div class="panel-body">
                        <table class="table table-condensed">
                            <g:each in="${otherList}" var="b">
                                <tr>
                                    <td>
                                        ${b.category}
                                    </td>
                                    <td>${b.amount}</td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </section>
            </div>

            </div>

        </div>
    </section>
</section>
<!--main content end-->

</body>
</html>