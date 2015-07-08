<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.category.MainCategory" %>
<%@ page import="org.macsuite.financial.category.Category" %>
<html>
<head>
    <title><g:message code="adminCategory.index.title" default="Admin -Category List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-cogs"></i><g:message code="adminCategory.index.heading" default="Category List"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-cogs"></i><g:message code="adminCategory.index.heading" default="Category"/></li>

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
                            <div class="col-lg-8">
                                <section class="panel">
                                    <header class="panel-heading">
                                        <g:message code="adminCategory.index.subheading" default="List"/>
                                        <g:render template="/templates/notificationBlock"/>
                                    </header>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th><g:message code="category.name.label"/></th>
                                                <th><g:message code="category.type.label"/></th>
                                                <th><g:message code="category.cash.label"/></th>
                                                <th><g:message code="category.active.label"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${categoryList}" var="category">
                                                <tr>
                                                    <td>${category.id}</td>
                                                    <td><g:link action="show" id="${category.id}">${category.name}</g:link></td>
                                                    <td>${category.type ? 'Yes' : 'No'}</td>
                                                    <td>${category.cash ? 'Yes' : 'No'}</td>
                                                    <td>${category.active ? 'Yes' : 'No'}</td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="5">
                                                        <div class="text-center">
                                                            <ul class="pagination pagination-lg">
                                                                <g:paginate total="${categoryCount}" prev="${raw("<")}" next="${raw(">")}" maxsteps="5"/>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </section>
                            </div>
                            <div class="col-lg-4">
                                <section class="panel">
                                    <header class="panel-heading">
                                        New <g:message code="category"/>
                                    </header>
                                    <div class="panel-body">
                                        <g:form action="save">
                                            <div class="form-group">
                                                <label for="name"><g:message code="category.name.label"/><span class="required">*</span></label>
                                                <g:textField name="name" class="form-control" id="name" placeholder="Enter Name" required="required" value="${command?.name}"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="mainCategory"><g:message code="mainCategory"/><span class="required">*</span></label>
                                                <g:select name="mainCategory" class="form-control" from="${MainCategory.findAllByActive(true)}" optionKey="id" optionValue="name" noSelection="['null':'Choose Main Category']"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="name"><g:message code="category.description.label"/></label>
                                                <g:textArea name="description" class="form-control" id="description" placeholder="Enter Description" cols="4" value="${command?.description}"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="name"><g:message code="category.type.label"/><span class="required">*</span></label>
                                                <g:select from="${Category.constraints.type.inList}" name="type"
                                                          class="form-control m-bot15" id="type" placeholder="Enter Name"
                                                          value="${command?.type}"/>
                                                <p>Type is either Income(I) or expense(E).</p>
                                            </div>
                                            <div class="col-lg-10">
                                                <div class="checkbox">
                                                    <label>
                                                        <g:checkBox name="cash" checked="${command?.cash}"/>
                                                        This category will move cash around. Such as purchases as opposed to interest costs.
                                                    </label>
                                                </div>

                                                <div class="checkbox">
                                                    <label>
                                                        <g:checkBox name="cumulative" checked="${command?.cumulative}"/>
                                                        This category that is constantly used throughout the month and needs monitoring. Such as groceries and fuel.
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <g:checkBox name="displayOnMobile" checked="${command?.displayOnMobile}"/>
                                                        This category should display when viewing options on a mobile device.
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-10">
                                                    <g:submitButton name="Save" class="btn-lg btn-primary"/>
                                                </div>
                                            </div>
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