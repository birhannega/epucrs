<%-- 
    Document   : Instructor Registration
    Created on : 28-Sep-2017, 02:33:06
    Author     : Efrem
--%>
<%
    if(session.getAttribute("dpt")==null)
{
 response.sendRedirect("../index.jsp");
}
    else {
       
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/jQuery.steps.css"
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
        <%
            connectionManager dbconnection = new connectionManager();
            Connection connection = dbconnection.getconnection();
            Statement statement = connection.createStatement();

        %>
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
                        <%@include file="../common/depsidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                <%
                String strname=session.getAttribute("dpt").toString();
                %>
                <div class="row">
                 <ul class="nav navbar-nav navbar-left">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        Java 
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">jmeter</a></li>
                                        <li><a href="#">EJB</a></li>
                                        <li><a href="#">Jasper Report</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
<!--                            <form class="navbar-form navbar-left" role="search">
                                <button type="submit" class="btn btn-default">
                                    Left align-Submit Button   
                                </button>
                            </form> -->
                            <!--<p class="navbar-text navbar-left">Left align-Text</p>-->
                            <!--Right Align-->
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                                        <b class="glyphicon glyphicon-comment" >
                                      </b> Welcome:<%out.println(session.getAttribute("dpt")); %> <b class="badge" ><%
                                          ResultSet rs=statement.executeQuery("select count(*) as cntntf from TBL_NOTIFFICATION where RECIEVER_NAME='"+ strname +"' ");
                                          while (rs.next()) { 
                                    String nameval=rs.getString("cntntf");
                                              %>
                                            <label class="control-label" for="tclass" ><%=nameval%> msg found</label>  
                                             <% }%>
                                         </b><b class="caret"></b>
                                       <%
                                                try {
//                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement stm_class = dbconnection.getconnection().createStatement();
                                                    String inst_sql = "select count(*) as cnt_inst from TBL_NOTIFFICATION";

                                                    ResultSet rs_class = stm_class.executeQuery(inst_sql);

                                            %>

                                            <%    while (rs_class.next()) {
                                                    String cnt_instructor = rs_class.getString("cnt_inst");
                                                    //cid;
                                            %>
                                            <label class="control-label" for="tclass" ><%=cnt_instructor%> notif found</label>
                                            <% } %>
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Course</a></li>
                                        <li><a href="#">Class</a></li>
                                        <li><a href="#">Jasper Report</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-info text-center" style="border-radius: 10px;">
                                <span class="fa fa-graduation-cap fa-4x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                        String number_of_stud = null;
                                        String query_no_student = "select count(Stud_id) from TBL_STUDENT_PROFILE where STUD_TYPE='Regular'";
                                        ResultSet res_no_student = statement.executeQuery(query_no_student);
                                        if (res_no_student.next()) {
                                            number_of_stud = res_no_student.getString(1);
                                            out.println(number_of_stud);
                                        }

                                    %>



                                </div>
                                <div class="text-capitalize text-center"><strong> Regular Students  Learning </strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-info text-center" style="border-radius: 10px;">
                                <span class="fa fa-graduation-cap fa-4x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                        String number_of_extstud = null;
                                        String query_no_extstudent = "select count(Stud_id) from TBL_STUDENT_PROFILE where STUD_TYPE='Extension'";
                                        ResultSet res_no_extstudent = statement.executeQuery(query_no_student);
                                        if (res_no_extstudent.next()) {
                                            number_of_extstud = res_no_extstudent.getString(1);
                                            out.println(number_of_extstud);
                                        }

                                    %>



                                </div>
                                <div class="text-capitalize text-center"><strong> Extension Students </strong> </div>					
                            </div><!--/.info-box-->			
                        </div><!--/.col-->



                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-success text-center" style="border-radius: 10px;">
                                <span class="fa fa-book fa-4x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                         String number_of_course = null;
                                        String query_no_course = "select count(course_code) from TBL_COURSE_REGISTRATION ";
                                        ResultSet res_no_courset = statement.executeQuery(query_no_course);
                                        if (res_no_courset.next()) {
                                            number_of_course = res_no_courset.getString(1);
                                            out.println(number_of_course);
                                        }

                                    %>



                                </div>
                                <div class="text-capitalize text-center"><strong>Total Courses</strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->

                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-danger text-center" style="border-radius: 10px;">
                                <span class="fa fa-delicious fa-4x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                        String number_of_program = null;
                                        String query_no_program = "select count(program_id) from TBL_academic_program ";
                                        ResultSet res_no_program = statement.executeQuery(query_no_program);
                                        if (res_no_program.next()) {
                                            number_of_program = res_no_program.getString(1);
                                            out.println(number_of_program);
                                        }

                                    %>

                                </div>
                                <div class="text-capitalize text-center"><strong>Total Program</strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->


                    </div>
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
        </script>   
        <%}%>
    </body>
</html>
