<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="adminMainCategory.index.title" default="Admin -Main Category List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-cog"></i><g:message code="adminMainCategory.index.heading" default="Main Category List"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-cog"></i><g:message code="adminMainCategory.index.heading" default="MainCategory"/></li>

                </ol>
            </div>
        </div>
        <g:render template="/templates/notificationBlock"/>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                <section class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <g:message code="adminMainCategory.index.subheading" default="List"/>
                                        <g:render template="/templates/notificationBlock"/>
                                    </header>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th><g:message code="mainCategory.name.label"/></th>
                                                <th><g:message code="mainCategory.active.label"/></th>
                                                <th># <g:message code="mainCategory.categories.label"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${mainCategoryList}" var="mainCategory">
                                                <tr>
                                                    <td>${mainCategory.id}</td>
                                                    <td><g:link action="show" id="${mainCategory.id}">${mainCategory.name}</g:link></td>
                                                    <td>${mainCategory.active ? 'Yes' : 'No'}</td>
                                                    <td>${mainCategory.categories?.size()}</td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">
                                                        <div class="text-center">
                                                            <ul class="pagination pagination-lg">
                                                                <g:paginate total="${mainCategoryCount}" prev="${raw("<")}" next="${raw(">")}" maxsteps="5"/>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                </section>
                            </div>
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        New Main Category
                                    </header>
                                    <div class="panel-body">
                                        <g:form action="save">
                                            <g:render template="/templates/messageBlock"/>
                                            <div class="form-group">
                                                <label for="name"><g:message code="mainCategory.name.label"/><span class="required">*</span> </label>
                                                <g:textField name="name" class="form-control" placeholder="Enter Name" value="${command?.name}" required="required"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="description"><g:message code="mainCategory.description.label"/></label>
                                                <g:textArea name="description" class="form-control" placeholder="Enter Description" cols="4" value="${command?.description}"/>
                                            </div>
                                            <g:submitButton name="Save" class="btn btn-primary"/>
                                        </g:form>
                                    </div>
                                </section>
                            </div>
                        </div>
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