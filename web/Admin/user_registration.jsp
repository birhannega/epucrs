<%-- 
    Document   : Instructor Registration
    Created on : 27-Feb-2017, 13:22:06
    Author     : Efrem
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/jQuery.steps.css">
<style>
    section{
        overflow: scroll;
        background: #fff;
    }

</style>
<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/admin_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/admin_sidebar.jsp" %>
            </div>
            <div class="col-lg-10"  >
                <div class="col-lg-12" > 
                    <!-- <div class="row">
                         <div class="col-lg-12">-->
                    <!--<p class="text-primary page-header text-center"><strong>Instructor Registration</strong></p>-->
                    <p class="text-primary text-center"><strong>User Registration</strong></p>
                    <%
                        connectionManager con = new connectionManager();
                        Connection connection = con.getconnection();
                        Statement statement = connection.createStatement();
                        String query = "Select Start_Date From Tbl_Schedule where SCHEDULE_ID='SI03' and acadamic_year=2010";
                        ResultSet res = statement.executeQuery(query);
                        //Date startdate;
                        if (res.next()) {
                            // startdate = res.getDate(1);

                            //                       }
                            // out.println("current month is  " + currentMonth + "scheduled month is " + month);
//                                if (Integer.valueOf(currentMonth) == Integer.valueOf(month)) {
//                                    //                         currentMonth=currentMonth+12; 
//                                    out.println("allowed");
//
//                                } else {
//                                    out.print("not");
//                                }
                    %>



                    <%//                         
                        } else {
                            out.println("no data");
                        }
                    %>
                    <!--<section>-->
                    <div id="example-async" class="pull-right">
                        ${instregsaved}
                        ${instregnotsaved}
                        <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                      
                            <form class="form-group " method="post" id="inst_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet" >
                                ${instregsaved}
                                ${instregnotsaved}
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">User ID</span>
                                        <input type="text" name="instid"  class="form-control" id="instid" placeholder="Auto User ID">
                                    </div>
                                </div>
                                <div class="form-group col-lg-8">
                                    <div class="input-group">
                                        <!--<span class="input-group-addon">Search</span>-->
                                        <button type="submit" class="btn btn-info" id="instsearch">Search</button>
                                    </div>
                                </div>
                               
                                
                               <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Full Name</span>
                                        <input type="text" name="fullname"  class="form-control" id="fullname" placeholder="Enter Full Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">User Name</span>
                                        <input type="text" name="username"  class="form-control" id="username" placeholder="Enter User Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Password</span>
                                        <input type="text" name="password"  class="form-control" id="password" placeholder="Enter Password Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Re-Password</span>
                                        <input type="text" name="repassword"  class="form-control" id="repassword" placeholder="Enter Re-Password">
                                    </div>
                                </div>
                                 <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">User Type</span>
                                        <select class="form-control" id="insttype" name="insttype" required="requiered">
                                            <option value="">-Select User type-</option>
                                            <option value="R-00">Admin</option>
                                            <option value="R_01">Encoder</option>
                                            <option value="R_02">Instructor</option>
                                             <option value="R_03">Student</option>
                                            <option value="R_04">Department</option>
                                           </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Secret Question</span>
                                        <select class="form-control" id="insttype" name="insttype" required="requiered">
                                            <option value="">-select Question type-</option>
                                            <option value="1">What is your Fathers Last Name</option>
                                            <option value="2">What is the name of your elementary school</option>
                                            <option value="3">What is your Mothers Last Name</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <!--<span class="input-group-addon">Answer</span>-->
                                        <input type="text" name="Answer"  class="form-control" id="Answer" placeholder="Enter Answer">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save User</strong></span></button>
                                    </div>
                                    </div>
                              </form>
                    </div>
                            <!--<div class="">-->
                            <span class="text-primary">  <strong>Instructor Registration</strong></span>

                            <table class="table table-hover table-bordered table-responsive table-striped" id="tblinstprofile">
                                <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>User NAME</th>
                                        <th>User Type</th>
                                        <th>Secret Question</th>
                                       </tr>
                                </thead>

                                <tbody>
                                    <%
                                        connectionManager dbconnection = new connectionManager();
                                        Statement st_list_course = dbconnection.getconnection().createStatement();
                                        String course_sql = "select  Staff_Id,Title, First_Name || ' '|| Middle_Name || ' '|| LAST_NAME as FULL_NAME,Phone, E_Mail,  STATUS ,RESPONSIBILITY from TBL_ACADEMIC_STAFF_REG ";
                                        ResultSet rs_course = st_list_course.executeQuery(course_sql);
                                        while (rs_course.next()) {
                                            String id = rs_course.getString(1);
                                    %>
                                    <tr>
                                        <!--<td><%=rs_course.getString(1)%></td>--> 
                                        <!--<td><%=id%></td>--> 
                                        <td><%=rs_course.getString(2)%></td> 
                                        <!--<td><%=rs_course.getString(3)%></td>--> 
                                        <td style="appearance: hyperlink"><u><a href="InstructorDetail.jsp" style="font-size: medium" ><%=rs_course.getString(3)%></a></u></td>
                                        <td><%=rs_course.getString(4)%></td> 
                                        <td><%=rs_course.getString(5)%></td> 
                                        <td><%=rs_course.getString(6)%></td> 
                                        <td>
                                            <form action="" method="Get">
                                                <input type="hidden" name="edit_id" value="<%=id%>"/>

                                                <button class="btn btn-warning">Edit</button>
                                            </form>


                                        </td>
                                        <td>
                                            <form>
                                                <input type="hidden" name="delete_id" value="<%=id%>"/>
                                                <button class="btn btn-danger">Delete</button>
                                            </form></td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>
                           <%
                            request.getSession().setAttribute("instregsaved", null);
                            request.getSession().setAttribute("instregnotsaved", null);

                        %>
                    <!--</section>-->
                    </div>
              
                </div>
            </div>
        </div>
        <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
    <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>

    <script type="text/javascript">
        $().ready(function () {
            function addexperience() {
                alert("clicked");
            }

        });

//var dom = {};
//dom.query = jQuery.noConflict( true );
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblinstprofile').DataTable();
        });
    </script>
<!--    <script>
        $("#example-async").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slide"
        });
    </script>-->
    <script type="text/javascript">
        $("#inst_reg").validate({
            rules: {
                instid: {

                    required: true,
                    minlength: 5,
                    digits: !true,
                    maxlength: 30
                },
                insttitle: {
                    required: true
                },
                firsname: {
                    required: true
                },
                middlename:
                        {
                            required: true
                        },
                lastname: {
                    required: true
                },
                phoneno: {
                    required: true,
                    digits: true
                },
                email: {
                    required: true
                },
                department: {
                    required: true
                },
                salary: {
                    required: true,
                    digits: true
                },
                status:
                        {
                            required: true
                        },
                insttype: {
                    required: true
                },
                responsibility:
                        {
                            required: true
                        },
                description:
                        {
                            required: true
                        }
            }
        });
    </script>
    <script type="text/javascript">
        $("#instedu_form").validate({
            rules: {
                instfirstdegree: {
                    required: true
                },
                instseconddegree: {
                    required: true
                },
                instphd: {
                    required: true
                },
                instcertificates: {
                    required: true
                }
            }



        });
    </script>
</body>
</html>



