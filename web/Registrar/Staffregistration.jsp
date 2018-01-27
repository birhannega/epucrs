<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            connectionManager dbconnection = new connectionManager();
            Statement stmt = dbconnection.getconnection().createStatement();
        %>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">

                <%@include file="sidemenu.jsp" %>

            </div>

            <!-- Main Content -->

            <div class="side-body">
                <div class="col-lg-12">

                    <pre><h4>Instructor registration</h4></pre>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#basicinfo"> <span class="fa  fa-user"></span><span class="text-info"><strong> Instructor Info </strong> </span></a></li>
                        <li><a href="#editprofile"> <span class="glyphicon glyphicon-pencil"> </span><span class="text-info"><strong> Edit instructor profile</strong></span> </a></li>
                        <li><a href="#picture"><span class="fa fa-picture-o"></span><span class="text-info">
                                    <strong>
                            Edit profile picture
                                    </strong></span></a></li>
                                    <li><a href="#experience"><span class="glyphicon glyphicon-star"></span><strong> Instructor Experience</strong></a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="basicinfo" class="tab-pane fade in active">
                            <p class="page-header">  <strong>Enter the basic information of instructor</strong></p>
                                ${instreg}
                                ${instNotreg}

                                <%@include file="instructorbasicinfo.jsp" %>
                             
                                <%
                                    session.setAttribute("instreg", null);
                                    session.setAttribute("instNotreg", null);
                                %>
                            </div>
                       


                        <div id="editprofile" class="tab-pane fade">
                            <h3>Edit Instructor profile</h3>
                            <%@include file="editprofile_form.jsp" %>
                         
                        </div>
                        <div id="picture" class="tab-pane fade">
                            <h3 class="text-info">Edit profile picture</h3>
                            <p>change/insert profile picture.</p>
                            <div class="form-group">
                                <div class="form-inline">
                                <input type="file" name="picture" class="form-control"/>
                                <input type="submit" class="btn btn-default">
                            </div>
                            </div>
                        </div>
                        <div id="experience" class="tab-pane fade">
                            <h3 class="text-info">Instructor experience</h3>
                            <%@include file="instructorexperienceform.jsp" %>
                        </div>
                    </div>
                </div>



            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');


                });


            });
        </script>
        <script>
            $(document).ready(function () {
                $(".nav-tabs a").click(function () {
                    $(this).tab('show');
                });
            });
        </script>
    </body>
</html>
