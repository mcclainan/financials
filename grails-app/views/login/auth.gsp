<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="login">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login Page 2 | Creative - Bootstrap 3 Responsive Admin Template</title>

    <!-- Bootstrap CSS -->    
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="${resource(dir: 'css', file: 'bootstrap-theme.css')}" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="${resource(dir: 'css', file: 'elegant-icons-style.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style-responsive.css')}" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="${resource(dir: 'js', file: 'html5shiv.js')}"></script>
    <script src="${resource(dir: 'js', file: 'respond.min.js')}"></script>
    <![endif]-->
</head>

  <body class="login-img3-body">

    <div class="container">

      <form class="login-form"action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
        <g:if test='${flash.message}'>
           <div class='alert alert-block alert-danger fade in'>${flash.message}</div>
        </g:if>
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
                <g:if env="production">
                    <input type='text' class='form-control' name='j_username' id='username'/>
                </g:if>
                <g:else>
                    <input type='text' class='form-control' name='j_username' id='username' value="super"/>
                </g:else>

            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <g:if env="production">
                    <input type='password' class='form-control' name='j_password' id='password'/>
                </g:if>
                <g:else>
                    <input type='password' class='form-control' name='j_password' id='password' value="password"/>
                </g:else>
            </div>
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right"> <g:link  url="http://52.24.30.58:8080/usermanagement/user/forgotPassword"> Forgot Password?</g:link></span>
            </label>
            <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
        </div>
      </form>

    </div>


  </body>
</html>
