<%-- 
    Document   : index
    Created on : Feb 22, 2017, 3:34:47 PM
    Author     : Birhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css"> 

    </head>

    <body>
        <div class="container"> 
            <%@include file="common/head_banner.jsp" %>
                       <div class="col-lg-offset-2 col-lg-8">
                 <div class="header">
                     <h1 class="text-primary page-header text-center">Admin Login Panel</h1>
                <span class="help-block text-center">Please, fill this form</span>
            </div>
            <form name="login-form" class="login-form" action="${pageContext.request.contextPath}//LoginAuthentication" method="post">
              <div class="form-group col-lg-8">
                 User name:   <input name="username" type="text" class="form-control" placeholder="Enter Username" />
                </div>
                <div class="form-group col-lg-8">
                  Password:  <input name="password" type="password" class="form-control" placeholder="Enter Password" />
                </div>

                <div class="form-group col-lg-8">
                    <button type="submit" class="button btn btn-primary  pull-right">Login</button>
                </div>

            </form>
        </div>
        </div>
    </body>
</html>
