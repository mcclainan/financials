<%@ page import="org.macsuite.financial.banking.Account" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">


    <title><g:layoutTitle default="Mac Financial"/></title>

    <!-- Bootstrap CSS -->
    <link href="${resource(dir: 'css', file:'bootstrap.min.css')}" rel="stylesheet">

    <!-- bootstrap theme -->
    <link href="${resource(dir: 'css',file: 'bootstrap-theme.css')}" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="${resource(dir: 'css',file: 'elegant-icons-style.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'css',file: 'font-awesome.min.css')}" rel="stylesheet" />
    <!-- full calendar css-->
    <link href="${resource(dir: 'assets/fullcalendar/fullcalendar',file: 'bootstrap-fullcalendar.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'assets/fullcalendar/fullcalendar',file: 'fullcalendar.css')}fullcalendar.css" rel="stylesheet" />
    <!-- easy pie chart-->
    <link href="${resource(dir: 'assets/jquery-easy-pie-chart',file: 'jquery.easy-pie-chart.css')}" rel="stylesheet" type="text/css" media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'owl.carousel.css')}" type="text/css">
    <link href="${resource(dir: 'css',file: 'jquery-jvectormap-1.2.2.css')}" rel="stylesheet">
    <!-- Custom styles -->
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'fullcalendar.css')}">
    <link href="${resource(dir: 'css',file: 'widgets.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css',file: 'style.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css',file: 'style-responsive.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'css',file: 'xcharts.min.css')}" rel=" stylesheet">
    <link href="${resource(dir: 'css',file: 'jquery-ui-1.10.4.min.css')}" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="${resource(dir: 'js',file: 'html5shiv.js')}"></script>
      <script src="${resource(dir: 'js',file: 'respond.min.js')}"></script>
      <script src="${resource(dir: 'js',file: 'js/lte-ie7.js')}"></script>
    <![endif]-->
    <link href="${resource(dir: 'css',file: 'macstyle.css')}" rel="stylesheet"/>
    <g:javascript library="jquery"/>
    <g:javascript src="mac.js"/>
    <g:layoutHead/>
</head>

<body>
<!-- container section start -->
<section id="container" class="">


    <header class="header dark-bg">
        <div class="toggle-nav">
            <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
        </div>

        <!--logo start-->
        <g:link uri="/" class="logo">Mac <span class="lite">Financial</span></g:link>
        <!--logo end-->

        %{--<div class="nav search-row" id="top_menu">--}%
            %{--<!--  search form start -->--}%
            %{--<ul class="nav top-menu">--}%
                %{--<li>--}%
                    %{--<form class="navbar-form">--}%
                        %{--<input class="form-control" placeholder="Search" type="text">--}%
                    %{--</form>--}%
                %{--</li>--}%
            %{--</ul>--}%
            %{--<!--  search form end -->--}%
        %{--</div>--}%

        <div class="top-nav notification-row">
            <!-- notificatoin dropdown start-->
            <ul class="nav pull-right top-menu">

                <!-- task notificatoin start -->
                <li id="task_notificatoin_bar" class="dropdown">
                    <g:link data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <g:message code="global.cash.account.total"/>: <g:formatNumber number="${Account.cashTotal.get()?:0}" type="currency" currencyCode="USD"/>
                    </g:link>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-blue"></div>
                        <g:each in="${Account.cashAccounts.list()}" var="account">
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">${account}: <g:formatNumber number="${account.balance}" type="currency" currencyCode="USD"/></div>
                                    </div>
                                    
                                </a>
                            </li>
                        </g:each>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <li class="external">
                                <g:link controller="adminAccount">See All Accounts</g:link>
                            </li>
                        </sec:ifAnyGranted>
                    </ul>
                </li>
                <li id="task_notificatoin_bar" class="dropdown">
                    <g:link data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <g:message code="global.credit.account.total"/>: <g:formatNumber number="${Account.creditTotal.get()?:0}" type="currency" currencyCode="USD"/>
                    </g:link>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-blue"></div>
                        <g:each in="${Account.creditAccounts.list()}" var="account">
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">${account}: <g:formatNumber number="${account.balance}" type="currency" currencyCode="USD"/></div>
                                    </div>

                                </a>
                            </li>
                        </g:each>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <li class="external">
                                <g:link controller="adminAccount">See All Accounts</g:link>
                            </li>
                        </sec:ifAnyGranted>
                    </ul>
                </li>
            <li id="task_notificatoin_bar" class="dropdown">
                <g:link data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <g:message code="global.benefits.account.total"/>: <g:formatNumber number="${Account.benefitsTotal.get()?:0 }" type="currency" currencyCode="USD"/>
                </g:link>
                <ul class="dropdown-menu extended tasks-bar">
                    <div class="notify-arrow notify-arrow-blue"></div>
                    <g:each in="${Account.benefitsAccounts.list()}" var="account">
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">${account}: <g:formatNumber number="${account.balance}" type="currency" currencyCode="USD"/></div>
                                </div>

                            </a>
                        </li>
                    </g:each>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <li class="external">
                            <g:link controller="adminAccount">See All Accounts</g:link>
                        </li>
                    </sec:ifAnyGranted>
                </ul>
            </li>


                <li id="task_notificatoin_bar" class="dropdown">
                    <sec:ifLoggedIn>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            %{--<span class="profile-ava">--}%
                                %{--<img alt="" src="${resource(dir: 'img', file: 'avatar1_small.png')}">--}%
                            %{--</span>--}%
                            <span class="username"><sec:username/></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                                <li class="border-top">
                                    <g:link controller="logout"><i class="icon_key_alt"></i>Logout</g:link>
                                </li>
                        </ul>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <g:link controller="login">Login</g:link>
                    </sec:ifNotLoggedIn>
                </li>
                <!-- user login dropdown end -->
            </ul>
            <!-- notificatoin dropdown end-->
        </div>
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="active">
                    <g:link uri="/">
                        <i class="icon_house_alt"></i>
                        <span>Dashboard</span>
                    </g:link>
                </li>
            <g:if env="development">
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_document_alt"></i>
                        <span>Forms</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link uri="/form_component">Form Elements</g:link></li>
                        <li><g:link class="" uri="/form_validation">Form Validation</g:link></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_desktop"></i>
                        <span>UI Fitures</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link class="" uri="/general">Elements</g:link></li>
                        <li><g:link class="" uri="/buttons">Buttons</g:link></li>
                        <li><g:link class="" uri="/grids">Grids</g:link></li>
                    </ul>
                </li>
                <li>
                    <g:link class="" uri="/widgets">
                        <i class="icon_genius"></i>
                        <span>Widgets</span>
                    </g:link>
                </li>
                <li>
                    <g:link class="" uri="/chart">
                        <i class="icon_piechart"></i>
                        <span>Charts</span>
                    </g:link>

                </li>

                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_table"></i>
                        <span>Tables</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link class="" uri="/basic_table">Basic Table</g:link></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="icon_documents_alt"></i>
                        <span>Pages</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link class="" uri="/profile">Profile</g:link></li>
                        <li><g:link class="" uri="/login"><span>Login Page</span></g:link></li>
                        <li><g:link class="" uri="/blank">Blank Page</g:link></li>
                        <li><g:link class="" uri="/404">404 Error</g:link></li>
                        <li><g:link class="" uri="/calendar">Calendar</g:link></li>

                    </ul>
                </li>
            </g:if>

                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <span>Tracking</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link class="" controller="transactionHome"><g:message code="transaction.index.title"/></g:link></li>
                        <li><g:link class="" controller="transactionSingle"><g:message code="transactionSingle.index.heading"/></g:link></li>
                        <li><g:link class="" controller="transactionCombo"><g:message code="transactionCombo.index.heading"/></g:link></li>
                        <li><g:link class="" controller="transactionAccountTransfer"><g:message code="transactionAccountTransfer.index.heading"/></g:link></li>

                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <span><g:message code="changeMe" default="Planning"/></span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><g:link class="" controller="plannedTransaction"><g:message code="changeMe" default="Budget"/></g:link></li>
                    </ul>
                </li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <span>Admin</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><g:link class="" uri="/admin">Admin Home</g:link></li>
                            <li><g:link class="" controller="adminMainCategory"><g:message code="mainCategory"/> Home</g:link></li>
                            <li><g:link class="" controller="adminCategory"><g:message code="category"/> Home</g:link></li>
                            <li><g:link class="" controller="adminImportFormat"><g:message code="importFormat"/> Home</g:link></li>
                            <li><g:link class="" controller="adminAccount"><g:message code="account"/> Home</g:link></li>
                            <li><g:link class="" controller="adminAccountType"><g:message code="accountType"/> Home</g:link></li>
                        </ul>
                    </li>
                </sec:ifAnyGranted>



            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <g:layoutBody/>
</section>
<!-- container section start -->

<!-- javascripts -->
<script src="${resource(dir: 'js', file:'jquery.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery-ui-1.10.4.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery-1.8.3.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file:'jquery-ui-1.9.2.custom.min.js')}"></script>
<script src="${resource(dir: 'js', file:'bootstrap.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.scrollTo.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.nicescroll.js')}" type="text/javascript"></script>
<script src="${resource(dir: 'assets/jquery-knob/js', file:'jquery.knob.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.sparkline.js')}" type="text/javascript"></script>
<script src="${resource(dir: 'assets/jquery-easy-pie-chart', file:'jquery.easy-pie-chart.js')}"></script>
<script src="${resource(dir: 'js', file:'owl.carousel.js')}" ></script>
<script src="${resource(dir: 'js', file:'fullcalendar.min.js')}"></script> <!-- Full Google Calendar - Calendar -->
<script src="${resource(dir: 'assets/fullcalendar/fullcalendar', file:'fullcalendar.js')}"></script>
%{--<script src="${resource(dir: 'js', file:'calendar-custom.js')}"></script>--}%
<g:render template="/templates/calendar"/>
<script src="${resource(dir: 'js', file:'jquery.rateit.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.customSelect.min.js')}" ></script>
<script src="${resource(dir: 'assets/chart-master/', file:'Chart.js')}"></script>
<script src="${resource(dir: 'js', file:'scripts.js')}"></script>
<script src="${resource(dir: 'js', file:'sparkline-chart.js')}"></script>
<script src="${resource(dir: 'js', file:'easy-pie-chart.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery-jvectormap-1.2.2.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery-jvectormap-world-mill-en.js')}"></script>
<script src="${resource(dir: 'js', file:'xcharts.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.autosize.min.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.placeholder.min.js')}"></script>
<script src="${resource(dir: 'js', file:'gdp-data.js')}"></script>
<script src="${resource(dir: 'js', file:'morris.min.js')}"></script>
<script src="${resource(dir: 'js', file:'sparklines.js')}"></script>
<script src="${resource(dir: 'js', file:'charts.js')}"></script>
<script src="${resource(dir: 'js', file:'jquery.slimscroll.min.js')}"></script>
<script>

    //knob
    $(function() {
        $(".knob").knob({
            'draw' : function () {
                $(this.i).val(this.cv + '%')
            }
        })
    });

    //carousel
    $(document).ready(function() {
        $("#owl-slider").owlCarousel({
            navigation : true,
            slideSpeed : 300,
            paginationSpeed : 400,
            singleItem : true

        });
    });

    //custom select box

    $(function(){
        $('select.styled').customSelect();
    });

    /* ---------- Map ---------- */
    $(function(){
        $('#map').vectorMap({
            map: 'world_mill_en',
            series: {
                regions: [{
                    values: gdpData,
                    scale: ['#000', '#000'],
                    normalizeFunction: 'polynomial'
                }]
            },
            backgroundColor: '#eef3f7',
            onLabelShow: function(e, el, code){
                el.html(el.html()+' (GDP - '+gdpData[code]+')');
            }
        });
    });



</script>

</body>
</html>
