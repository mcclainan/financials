<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 7/10/15
  Time: 4:24 PM
--%>
<%@ page import="org.macsuite.financial.banking.Account" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="bankRecordsView.index.title" default="Change Me"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-bank"></i><g:message code="bankRecordsView.index.heading" default="Change Me"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/">Home</g:link></li>
                    <li><i class="fa fa-bank"></i><g:message code="bankRecordsView.index.heading" default="Change Me"/></li>
                </ol>
            </div>
        </div>
        <div class="row">
            <g:render template="/templates/notificationBlock"/>
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="bankRecordsView.index.list.heading"/>
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
                                            <td><g:link action="show" id="${bankRecord.batch}">${bankRecord.batch}</g:link></td>
                                        </tr>
                                    </g:each>
                                </tbody>
                                <tfoot>
                                    <g:if test="${bankRecordCount > 10}">
                                        <tr>
                                            <td colspan="3">
                                                <div class="text-center">
                                                    <ul class="pagination pagination-lg">
                                                        <g:paginate total="${bankRecordCount}" params="[month:month,year:year]" prev="${raw("<")}" next="${raw(">")}" maxsteps="10"/>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </g:if>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="panel">
                    <header class="panel-heading">
                        <g:message code="bankRecordsView.index.upload"/> (Last upload: <g:formatDate date="${lastUpdated}" format="MMMM dd, yyyy"/>)
                    </header>
                    <div class="panel-body">
                        <g:form action="upload" class="form-horizontal" enctype="multipart/form-data" method="post">
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><g:message code="bankRecordsView.index.choose"/></label>
                                <div class="col-sm-9">
                                    <g:field name="file" type="file" class="form-control"/>
                                    <p><g:message code="bankRecordsView.index.choose.tip"/></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"><g:message code="bankRecordsView.index.account"/></label>
                                <div class="col-sm-9">
                                    <g:select id="account" name="id" class="form-control" from="${Account.findAllByActive(true)}" optionKey="id" optionValue="title" noSelection="['null':'Choose Account']"/>
                                    <g:message code="bankRecordsView.index.account.tip"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <a class="btn btn-primary" data-toggle="modal" href="#uploadModal">
                                        Upload
                                    </a>
                                </div>
                            </div>
                            <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Confirm Upload</h4>
                                        </div>
                                        <div class="modal-body">
                                            <g:message code="bankRecordsView.index.upload.confirm"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button data-dismiss="modal" class="btn btn-default" type="button">Review</button>
                                            <g:submitButton name="upload" class="btn btn-primary"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>
<!--main content end-->

</body>
</html>