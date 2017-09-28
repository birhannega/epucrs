<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Program Manager Index</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">

                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <%@include file="../common/depsideheader.jsp" %>

                    </div>

                    <!-- Main Menu -->
                    <div class="side-menu-container">
                        <%@include file="../common/ProgramManagersidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">

                    <%--<%@include file="adduser_form.jsp" %>--%>
                    ${ClassReg}
                    ${ClassNotReg}
                    <p class="page-header text-primary text-center">Class Registration</p>

                    <form class="form-horizontal" role="form" id="classform" action="${pageContext.request.contextPath}//ClassServlet">
                        <div class="form-group col-lg-10">
                            <label for="blockname"  class="col-lg-4 col-sm-2 control-label">Block Name</label>
                            <div class="col-lg-6 col-sm-10">
                                <input type="text" class="form-control" id="blockname" name="blockname" 
                                       placeholder="Enter Bloack Name">
                            </div>
                        </div>
                        <div class="form-group col-lg-10">
                            <label for="classname" class="col-lg-4 col-sm-2 control-label">Class Name</label>
                            <div class="col-lg-6 col-sm-10">
                                <input type="text" class="form-control" id="classname"  name="classname" 
                                       placeholder="Enter Class Name">
                            </div>
                        </div>
                        <div class="form-group col-lg-10">
                            <label for="classdate" class="col-lg-4 col-sm-2 control-label" >Date</label>
                            <div class="col-lg-6 col-sm-10">
                                <input type="text" class="form-control" id="classdate"  name="classdate" 
                                       placeholder="Enter class date">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary"><span class="fa fa-save"> Save Class Info</span></button>
                            </div>
                        </div>
                    </form>
                    <%    request.getSession().setAttribute("ClassReg", null);
                        request.getSession().setAttribute("ClassNotReg", null);
                    %>
                </div>  <!--body end-->
            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
                    $('#search').removeClass('in').addClass('collapse').slideUp(200);

                    /// uncomment code for absolute positioning tweek see top comment in css
                    //$('.absolute-wrapper').toggleClass('slide-in');

                });

                // Remove menu for searching
                $('#search-trigger').click(function () {
                    $('.navbar-nav').removeClass('slide-in');
                    $('.side-body').removeClass('body-slide-in');

                    /// uncomment code for absolute positioning tweek see top comment in css
                    //$('.absolute-wrapper').removeClass('slide-in');

                });
            });
        </script>
        <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
    $("#classdate").datepicker({
        changeMonth: true,
        changeYear: true,
       dateFormat: 'yy-mm-dd'

    });
</script>    </body>
</html>
