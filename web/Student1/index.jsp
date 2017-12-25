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
        <%@include file="../common/student_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/student_sidebar.jsp" %>
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
                                              
                    </div>



                </div>
            </div>
        </div>

    </div>  <!--      main content ends-->




</html>