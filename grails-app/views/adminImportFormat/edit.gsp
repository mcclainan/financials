<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="adminImportFormat.index.title"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-code-fork"></i><g:message code="importFormat"/> </h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:link controller="adminHome"><g:message code="adminHome.index.heading"/></g:link></li>
                    <li><i class="fa fa-code-fork"></i><g:link action="index"><g:message code="adminImportFormat.index.heading" default="MainCategory"/></g:link></li>
                    <li><i class="fa fa-code-fork"></i><g:message code="adminImportFormat.show.subheading" default="Show"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">
                        Edit <g:message code="importFormat"/>
                    </header>
                    <div class="panel-body">
                        <div class="panel-body">
                            <g:form action="update">
                                <g:render template="/templates/messageBlock"/>
                                <div class="form-group">
                                    <label for="name"><g:message code="importFormat.name.label"/> </label>
                                    <g:textField name="name" class="form-control" placeholder="Enter Name" value="${command?.name}"/>
                                </div>
                                <div class="form-group">
                                    <label for="dateColumn"><g:message code="importFormat.dateColumn.label"/> </label>
                                    <g:field type="number" step="1" name="dateColumn" class="form-control"  value="${command?.dateColumn}"/>
                                    <p><g:message code="importFormat.dateColumn.tip"/></p>
                                </div>
                                <div class="form-group">
                                    <label for="descriptionColumn"><g:message code="importFormat.descriptionColumn.label"/> </label>
                                    <g:field type="number" step="1" name="descriptionColumn" class="form-control" placeholder="0" value="${command?.descriptionColumn}"/>
                                    <p><g:message code="importFormat.descriptionColumn.tip"/></p>
                                </div>
                                <div class="form-group">
                                    <label for="amountColumn"><g:message code="importFormat.amountColumn.label"/> </label>
                                    <g:field type="number" step="1" name="amountColumn" class="form-control" placeholder="0" value="${command?.amountColumn}"/>
                                    <p><g:message code="importFormat.amountColumn.tip"/></p>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkbox">
                                        <label for="hasMultipleAmountColumns"><g:message code="importFormat.hasMultipleAmountColumns.label"/> </label>
                                        <g:checkBox name="hasMultipleAmountColumns" checked="${command?.hasMultipleAmountColumns}"/>: <g:message code="importFormat.hasMultipleAmountColumns.tip"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="debitColumn"><g:message code="importFormat.debitColumn.label"/> </label>
                                    <g:field type="number" step="1" name="debitColumn" class="form-control" placeholder="0" value="${command?.debitColumn}"/>
                                    <p><g:message code="importFormat.debitColumn.tip"/></p>
                                </div>
                                <div class="form-group">
                                    <label for="creditColumn"><g:message code="importFormat.creditColumn.label"/> </label>
                                    <g:field type="number" step="1" name="creditColumn" class="form-control" placeholder="0" value="${command?.creditColumn}"/>
                                    <p><g:message code="importFormat.creditColumn.tip"/></p>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkbox">
                                        <label for="hasHeading"><g:message code="importFormat.hasHeading.label"/> </label>
                                        <g:checkBox name="hasHeading" checked="${command?.hasHeading}"/>: <g:message code="importFormat.hasHeading.tip"/>
                                    </div>
                                </div>
                                <g:submitButton name="Update" class="btn btn-primary"/>
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