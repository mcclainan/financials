<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="" default="Admin -Main Category Edit"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bars"></i><g:message code="category" default="Change Me"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-bars"></i><g:link action="index"><g:message code="adminMainCategory.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-bars"></i><g:message code="adminAccountType.show.subheading" default="Show"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">
                        Edit Main Category
                    </header>
                    <div class="panel-body">
                        <g:form action="update">
                            <g:render template="/templates/messageBlock"/>
                            <div class="form-group">
                                <label for="name"><g:message code="mainCategory.name.label"/> </label>
                                <g:textField name="name" class="form-control" placeholder="Enter Name" value="${command?.name}"/>
                            </div>
                            <div class="form-group">
                                <label for="description"><g:message code="mainCategory.description.label"/></label>
                                <g:textArea name="description" class="form-control" placeholder="Enter Description" cols="4" value="${command?.description}"/>
                            </div>
                            <div class="col-lg-10">
                                    <div class="checkbox">
                                        <label>
                                            <g:checkBox name="active" checked="${command?.active}"/>
                                            Active
                                        </label>
                                    </div>
                            </div>
                            <div class="form-group">
                                <g:hiddenField name="id" value="${command?.id}"/>
                                <g:submitButton name="Update" class="btn btn-primary"/>
                                <g:link action="show" id="${command.id}" class="btn btn-primary">Back</g:link>
                            </div>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>