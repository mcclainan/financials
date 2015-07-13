<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 7/10/15
  Time: 8:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="bankRecordsView.show.title"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-changeMe"></i><g:message code="bankRecordsView.show.heading" args="${[params.id]}"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-bank"></i><g:link action="index">Bank Record Home</g:link></li>
                    <li><g:message code="bankRecordsView.show.title"/></li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="bankRecordsView.show.list"/>
                    </header>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td><g:message code="bankRecord.date.label"/></td>
                                    <td><g:message code="bankRecord.description.label"/></td>
                                    <td><g:message code="bankRecord.amount.label"/></td>
                                    <td><g:message code="bankRecord.batch.label"/></td>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${bankRecordsList}" var="bankRecord">
                                    <tr>
                                        <td><g:formatDate date="${bankRecord.date}" format="MM-dd-yyyy"/></td>
                                        <td>${bankRecord.description.size()>20?bankRecord.description.substring(0,20):bankRecord.description}</td>
                                        <td><g:formatNumber number="${bankRecord.amount}" type="currency" currencyCode="USD"/></td>
                                        <td>${bankRecord.batch}</td>
                                    </tr>
                                </g:each>
                                </tbody>
                                <tfoot>
                                <g:if test="${bankRecordCount > 10}">
                                    <tr>
                                        <td colspan="3">
                                            <div class="text-center">
                                                <ul class="pagination pagination-lg">
                                                    <g:paginate total="${bankRecordCount}" id="${params.id}" prev="${raw("<")}" next="${raw(">")}" maxsteps="10"/>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </g:if>
                                    <tr>
                                        <td colspan="4">
                                            <a class="btn btn-primary" data-toggle="modal" href="#deleteModal">
                                                Delete Batch
                                            </a>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Confirm Delete</h4>
                                    </div>
                                    <div class="modal-body">
                                        <g:message code="bankRecordsView.index.delete.confirm"/>
                                    </div>
                                    <div class="modal-footer">
                                        <button data-dismiss="modal" class="btn btn-primary" type="button">Cancel</button>
                                        <g:link action="deleteBatch" id="${params.id}" class="btn btn-danger">Confirm</g:link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <g:if test="${session.duplicateRecords}">
                <div class="col-lg-6">
                    <section class="panel">
                        <div class="panel-body">
                            <header class="panel-heading">
                                <g:message code="bankRecordsView.show.duplicates"/>
                            </header>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th><g:message code="bankRecord.date.label"/></th>
                                        <th><g:message code="bankRecord.description.label"/></th>
                                        <th><g:message code="bankRecord.amount.label"/></th>
                                        <th><g:message code="bankRecord.batch.label"/></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${session.duplicateRecords}" var="bankRecord">
                                        <tr>
                                            <td><g:formatDate date="${bankRecord.date}" format="MM-dd-yyyy"/></td>
                                            <td>${bankRecord.description.size()>20?bankRecord.description.substring(0,20):bankRecord.description}</td>
                                            <td><g:formatNumber number="${bankRecord.amount}" type="currency" currencyCode="USD"/></td>
                                            <td>${bankRecord.batch}</td>
                                            <td>
                                                <g:form action="serializeDuplicate">
                                                    <g:hiddenField name="year" value="${bankRecord.date.getAt(Calendar.YEAR)}"/>
                                                    <g:hiddenField name="month" value="${bankRecord.date.getAt(Calendar.MONTH)}"/>
                                                    <g:hiddenField name="day" value="${bankRecord.date.getAt(Calendar.DAY_OF_MONTH)}"/>
                                                    <g:hiddenField name="description" value="${bankRecord.description}"/>
                                                    <g:hiddenField name="batch" value="${bankRecord.batch}"/>
                                                    <g:hiddenField name="amount" value="${bankRecord.amount.setScale(2,BigDecimal.ROUND_HALF_DOWN)}"/>
                                                    <g:submitButton name="serialize" class="btn btn-sm btn-primary"/>
                                                </g:form>
                                            </td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>
            </g:if>
        </div>
    </section>
</section>
<!--main content end-->

</body>
</html>