<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.category.Category" %>
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
                <h3 class="page-header"><i class="fa fa fa-cog"></i><g:message code="adminMainCategory.show.heading" default="Showing Main Category" args="[mainCategoryInstance]"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-cog"></i><g:link action="index"><g:message code="adminMainCategory.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-cog"></i><g:message code="adminMainCategory.show.subheading" default="Show"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <g:render template="/templates/notificationBlock"/>
        <div class="row">

            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <div class="row-fluid">
                            <p><span><strong>ID</strong></span>: ${mainCategoryInstance.id} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="mainCategory.active.label"/></strong></span>: ${mainCategoryInstance.active} </p>
                        </div>
                        <div class="row-fluid">
                            <p>
                                <span><strong><g:message code="mainCategory.description.label"/></strong></span>:<br/>
                                <g:textArea name="description"  value="${mainCategoryInstance.description}" rows="4" cols="40" disabled="disabled"/>

                            </p>
                        </div>
                        <div class="col-lg-offset-2 col-lg-10">
                            <g:link action="edit" class="btn btn-default btn-lg" id="${mainCategoryInstance.id}">Edit</g:link>
                            <g:link action="index" class="btn btn-primary btn-lg">Back</g:link>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <header class="panel-heading">
                            ${mainCategoryInstance.name} <g:message code="mainCategory.categories.label"/>
                        </header>
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th><g:message code="category.name.label"/></th>
                                <th><g:message code="category.cash.label"/></th>
                                <th><g:message code="category.type.label"/></th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each in="${mainCategoryInstance.categories}" var="category">
                                    <tr>
                                        <td>${category.id}</td>
                                        <td>
                                            <g:link controller="adminCategory" action="show" id="${category.id}">
                                                ${category.name}
                                            </g:link>
                                        </td>
                                        <td>${category.cash?'Yes':'No'}</td>
                                        <td>${category.type=='I'?'Income':'Expense'}</td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <div class="panel-body">
                        <header class="panel-heading">
                            New ${mainCategoryInstance} <g:message code="category"/>
                        </header>
                        <div class="panel-body">
                            <g:form action="saveCategory">
                                <div class="form-group">
                                    <label for="name"><g:message code="category.name.label"/><span class="required">*</span></label>
                                    <g:textField name="name" class="form-control" id="name" placeholder="Enter Name" required="required" value="${command?.name}"/>
                                </div>
                                <div class="form-group">
                                    <label for="name"><g:message code="category.description.label"/></label>
                                    <g:textArea name="description" class="form-control" id="description" placeholder="Enter Description" cols="4" value="${command?.description}"/>
                                </div>
                                <div class="form-group">
                                    <label for="name"><g:message code="category.type.label"/><span class="required">*</span></label>
                                    <g:select from="${Category.constraints.type.inList}" name="type"
                                              class="form-control" id="type" placeholder="Enter Name"
                                              value="${command?.type}" required="required"/>
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
                                            This category that is constantly used throughout the month. Such as groceries and fuel.
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
                                        <g:hiddenField id="mainCategory"  name="mainCategory.id" value="${mainCategoryInstance.id}"/>
                                        <g:submitButton name="Save" class="btn-lg btn-primary"/>
                                    </div>
                                </div>
                            </g:form>

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