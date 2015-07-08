<%--
  Created by IntelliJ IDEA.
  User: tony
  Date: 6/9/15
  Time: 12:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.macsuite.financial.banking.AccountType; org.macsuite.financial.category.MainCategory" %>
<%@ page import="org.macsuite.financial.category.Category" %>
<%@ page import="org.macsuite.financial.banking.AccountType" %>
<%@ page import="org.macsuite.financial.banking.Account" %>
<%@ page import="org.macsuite.financial.banking.ImportFormat" %>

<html>
<head>
    <title><g:message code="adminHome.index.title" default="Admin Home"/></title>
</head>

<body>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header"><i class="fa fa fa-briefcase"></i><g:message code="adminHome.index.heading"/></h3>
                <ol class="breadcrumb">
                    <li><i class="fa fa-home"></i><g:link uri="/"><g:message code="index.title" default="Home"/></g:link></li>
                    <li><i class="fa fa-home"></i><g:message code="adminHome.index.heading"/></li>
                </ol>
            </div>
        </div>
        <!-- page start-->
        <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box blue-bg">
                <i class="fa fa-cog"></i>
                <div class="count">${MainCategory.count()}</div>
                <div class="title"><g:link controller="adminMainCategory"><g:message code="mainCategory"/></g:link></div>
            </div><!--/.info-box-->
            </div><!--/.col-->
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="info-box blue-bg">
                    <i class="fa fa-cogs"></i>
                    <div class="count">${Category.count()}</div>
                    <div class="title"><g:link controller="adminCategory"><g:message code="category"/></g:link></div>
                </div><!--/.info-box-->
            </div><!--/.col-->

            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="info-box brown-bg">
                    <i class="fa fa-bars"></i>
                    <div class="count">${AccountType.count()}</div>
                    <div class="title"><g:link controller="adminAccountType"><g:message code="accountType"/></g:link></div>
                </div><!--/.info-box-->
            </div><!--/.col-->

            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="info-box dark-bg">
                    <i class="fa fa-code-fork"></i>
                    <div class="count">${ImportFormat.count()}</div>
                    <div class="title"><g:link controller="adminImportFormat"><g:message code="importFormat"/></g:link></div>
                </div><!--/.info-box-->
            </div><!--/.col-->

        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="info-box green-bg">
                    <i class="fa fa-bank"></i>
                    <div class="count">${Account.count()}</div>
                    <div class="title"><g:link controller="adminAccount"><g:message code="account"/></g:link></div>
                </div><!--/.info-box-->
            </div><!--/.col-->




        </div>
        <!-- page end-->
    </section>
</section>
<!--main content end-->

</body>
</html>