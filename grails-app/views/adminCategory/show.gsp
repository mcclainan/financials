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
    <title><g:message code="adminCategory.index.title" default="Admin -Main Category List"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-cogs"></i><g:message code="adminCategory.show.heading" default="Showing Main Category" args="[categoryInstance]"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-cogs"></i><g:link action="index"><g:message code="adminCategory.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-cogs"></i><g:message code="adminCategory.show.subheading" default="Show"/></li>
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
                            <p><span><strong>ID</strong></span>: ${categoryInstance.id} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="mainCategory"/></strong></span>: ${categoryInstance.mainCategory} </p>
                        </div>
                        <div class="row-fluid">
                            <p>
                                <span><strong><g:message code="category.description.label"/></strong></span>:<br/>
                                <g:textArea name="description"  value="${categoryInstance.description}" rows="4" cols="40" disabled="disabled"/>
                            </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="category.type.label"/></strong></span>: ${categoryInstance.type=='I'? 'Income':'Expense'} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="category.cash.label"/></strong></span>: ${categoryInstance.cash? 'Yes':'No'} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="category.cumulative.label"/></strong></span>: ${categoryInstance.cumulative? 'Yes':'No'} </p>
                        </div>

                        <div class="row-fluid">
                            <p><span><strong><g:message code="category.displayOnMobile.label"/></strong></span>: ${categoryInstance.displayOnMobile? 'Yes':'No'} </p>
                        </div>
                        <div class="row-fluid">
                            <p><span><strong><g:message code="category.active.label"/></strong></span>: ${categoryInstance.active? 'Yes':'No'} </p>
                        </div>
                        <div class="col-lg-offset-2 col-lg-10">
                            <g:link action="edit" class="btn btn-default btn-lg" id="${categoryInstance.id}">Edit</g:link>
                            <g:link action="index" class="btn btn-primary btn-lg" id="${categoryInstance.id}">Back</g:link>

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