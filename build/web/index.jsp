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
        <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">

        </style>
    </head>
    <body>
        <div class="container"> 
            <img alt="header" src="images/header5.jpg" class="img img-responsive" style=" height: 100px"/>
            <div class="col-lg-6 col-sm-6">

                <h5 class="text-primary  page-header"><strong> Staff Login Panel</strong></h5>
                <form name="login-form" id="login_form" class="form-group" action="${pageContext.request.contextPath}/LoginAuthentication" method="post">




                    <div class="form-group col-lg-8">
                        User name:   
                        <input name="username" type="text" class="form-control" placeholder="Enter Username" />
                    </div>
                    <div class="form-group col-lg-8">
                        Password:
                        <input name="password" type="password" class="form-control" placeholder="Enter Password"  />
                    </div>
                    <div class="form-group col-lg-8">
                        ${error}   <button type="submit" class=" btn btn-primary  pull-right"><span class="fa fa-2x fa-sign-in"> </span> </button>
                    </div>

                </form>
            </div>

            <div class="col-lg-6 col-sm-6">

                <h5 class="page-header"> <strong class="text-primary  text-center">Student login panel</strong></h5>
                <form name="login-form" id="login_form" class="form-group" action="${pageContext.request.contextPath}/studLoginAuthentication" method="post">





                    <div class="form-group col-lg-8">
                        User name:   
                        <input name="username" type="text" class="form-control" placeholder="Enter Username" />
                    </div>
                    <div class="form-group col-lg-8">
                        Password:
                        <input name="password" type="password" class="form-control" placeholder="Enter Password"  />
                    </div>
                    <div class="form-group col-lg-8">
                        ${studerror}   <button type="submit" class=" btn btn-primary  pull-right"><span class="fa fa-2x fa-sign-in"> </span> </button>
                    </div>
                    
                </form>
            </div>


        </div>
        <div class="container">
            <h5 class="text-center">Are you new student? <a href="Student/studentRegistration.jsp"> Register here</a> </h5>
        </div>
        <%
            session.setAttribute("error", null);
             session.setAttribute("studerror", null);
        %>
        <script src="resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="resources/jquery/jquery.validate.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#stud_login_form").validate({
                    rules: {
                        username: {
                            required: true,
                            minlength: 3
                        },
                        password: {
                            required: true,
                            minlength: 5
                        }
                    }
                });
                  $("#login_form").validate({
                    rules: {
                        username: {
                            required: true,
                            minlength: 3
                        },
                        password: {
                            required: true,
                            minlength: 5
                        }
                    }
                });
            });

        </script>
    </body>
</html>
