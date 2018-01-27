<!doctype html>
<html lang="en">
    <head>
s        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link href="resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
      

       
    </head>
    <body>
        <div class="row">
            <img alt="header" src="images/header5.jpg" class="img img-responsive" style=" height: 100px; width: 100%"/>
        </div>
        <div class="container"> 
            <div class="page-header">System users Login panel</div>
            <div id="accordion" >
                <h3>Student Login</h3>
                <div>
                    <h3>Student Login</h3>
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
                        <div class="container">
                            <h5 class="text-center">Are you new student? <a href="Student/studentRegistration.jsp"> Register here</a> </h5>
                        </div>
                    </form>
                </div>
                <h3><strong> Staff Login Panel</strong></h3>
                <div>
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

            </div>
        </div>
                          <script src="resources/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
         <script type="text/javascript">
            $(function () {
                var icons = {
                    header: "ui-icon-circle-arrow-e",
                    activeHeader: "ui-icon-circle-arrow-s"
                };
                $("#accordion").accordion({
                    icons: icons
                });
                $("#toggle").button().on("click", function () {
                    if ($("#accordion").accordion("option", "icons")) {
                        $("#accordion").accordion("option", "icons", null);
                    } else {
                        $("#accordion").accordion("option", "icons", icons);
                    }
                });
            });
        </script>
    </body>
</html>