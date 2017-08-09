<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>

<%@include file="../common/imports.jsp" %>


<%
    connectionManager dbconnection = new connectionManager();
    Connection connection = dbconnection.getconnection();
    Statement statement = connection.createStatement();

%>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/incoder_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/incoder_sidebar.jsp" %>
            </div>
            <!--      include side bar end-->

            <!--      main content starts-->
            <div class="col-lg-10">
                <div class="col-lg-12" >

                    <div class="row">
                        <div class="col-lg-12">


                            <h4 class="page-header text-capitalize text-primary"><i class="fa fa-laptop"></i> federal police university college Data encoders application interface </h4>


                            <div class="pull-right">


                            </div>

                        </div>
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
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-danger text-center" style="border-radius: 10px;">
                                <span class="fa fa-graduation-cap fa-4x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                       
                                        String number_of_active_stud = null;
                                        String query_no_activestud = "select count(program_id) from TBL_academic_program ";
                                        ResultSet res_no_activestud = statement.executeQuery(query_no_activestud);
                                        if (res_no_activestud.next()) {
                                            number_of_active_stud = res_no_activestud.getString(1);
                                            out.println(number_of_active_stud);
                                        }

                                    %>

                                </div>
                                <div class="text-capitalize text-center"><strong>Active Student</strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->
                         <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-danger text-center" style="border-radius: 10px;">
                                <span class="fa fa-graduation-cap fa-4x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                       
                                        String number_of_inactive_stud = null;
                                        String query_no_inactivestud = "select count(program_id) from TBL_academic_program ";
                                        ResultSet res_no_inactivestud = statement.executeQuery(query_no_inactivestud);
                                        if (res_no_inactivestud.next()) {
                                            number_of_inactive_stud = res_no_inactivestud.getString(1);
                                            out.println(number_of_inactive_stud);
                                        }

                                    %>

                                </div>
                                <div class="text-capitalize text-center"><strong>Inactive Student</strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->
                        
                    </div>



                </div>
            </div>
        </div>

    </div>  <!--      main content ends-->




</html>
