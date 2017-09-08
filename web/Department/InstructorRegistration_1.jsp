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
<link rel="stylesheet" href="../css/jQuery.steps.css"/>
<style>
    section{
        overflow: scroll;
        background: #fff;
    }

</style>

<!--<style>
@font-face {
    font-family: 'abyssinica_silregular';
    src: url('abyssinicasil-r.eot');
    src: url('abyssinicasil-r.eot?#iefix') format('embedded-opentype'),
         url('abyssinicasil-r.woff') format('woff'),
         url('abyssinicasil-r.ttf') format('truetype'),
         url('abyssinicasil-r.svg#abyssinica_silregular') format('svg');
    font-weight: normal;
    font-style: normal;
}
</style>-->
<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
            <div class="col-lg-10"  >
                   <div id="accordion">
                    <div class="form-group col-lg-12">
                        <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->
                        <a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorProfile</span></a>
                        <div class="accordion-content default">
                           <form class="form-group " method="POST" id="stud_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet">
                                <!--<p class="text-primary text-center header"><strong> Instructor Profile</strong></p>-->
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon" style="color: #007fff">Search By</span>
                                        <select name="testdrop" class="form-control" id="testdrop"  required="required">
                                            <option>-select criteria-</option>
                                            <option>Instructor_ID</option>
                                            <option>Instructor_Name</option>
                                        </select>

                                    </div>
                                </div>
                                <!--<form role="search">-->
                                
                                <div class="form-group col-lg-8">
                                    <div class="input-group col-lg-4">
                                        <input type="text" class="form-control" placeholder="Search">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Select Instructor</span>
                                        <select class="form-control" id="selectinstr" name="selectinstr" required="required">
                                            <option value="-1">-select instructor-</option>
                                            <%
                                                try {
                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement st_list_course = dbconnection.getconnection().createStatement();
                                                    String course_sql = "select staff_id, FIRST_NAME ||  ' ' ||  MIDDLE_NAME  || ' ' || LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";

                                                    ResultSet rs_courseinstr = st_list_course.executeQuery(course_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_courseinstr.next()) {
                                                    String id = rs_courseinstr.getString("FULL_NAME");
                                                    //cid;
                                            %>
                                            <option><%=id%></option>
                                            <% } %>
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4" id="hidden_field">
                                    <div class="input-group">
                                        <span class="input-group-addon">Total Course</span>
                                        <input type="text" name="totalcourse"  class="form-control" id="hidden_field" placeholder="Enter Total Course">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4" id="hidden_field">
                                    <div class="input-group">
                                        <span class="input-group-addon">Total Credit</span>
                                        <input type="text" name="totalcredit"  class="form-control" id="hidden_field" placeholder="Enter Total Course">
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                                        <div class="form-group col-lg-12">
                        <a class="accordion-toggle"><span class="glyphicon glyphicon-list">ClassInfo</span></a>
                        <div class="accordion-content">
                            <form class="form-group " method="post" id="instrAssign" action="${pageContext.request.contextPath}//CourseAssignment">

                                <div class="form-group">
                                    <label class="control-label col-lg-2" for="email">School</label>
                                    <div class="col-lg-4">
                                        <input type="email" class="form-control" id="email" placeholder="Enter email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2" for="pwd">School</label>
                                    <div class="col-lg-4">
                                        <input type="password" class="form-control" id="pwd" placeholder="Enter password">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-4">
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </div>
                                </div>
                            </form> 
                        </div>
                    </div>
                     </div>
                <div class="col-lg-12" >
                    <!-- <div class="row">
                         <div class="col-lg-12">-->
                    <!--<p class="text-primary page-header text-center"><strong>Instructor Registration</strong></p>-->
                  
                    <p class="text-primary text-center"><strong>Instructor Registration</strong></p>
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

                    <div id="example-async" class="pull-right">
                        ${instreg}
                        ${instNotreg}
                        <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                        <h3>Instructor Profile</h3>
                        <section >
                            <form class="form-group " method="post" id="inst_reg" enctype="multipart/form-data" action="${pageContext.request.contextPath}//InstructorReg_Servlet" >
                                <!--<form class="form-group " method="post" id="inst_reg"  enctype="multipart/form-data" action="insertimage.jsp">-->
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <input type="file" name="ImageFile" id="ImageFile" />
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">

                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="insttitle" name="insttitle" >
                                            <option value="">-select title-</option>
                                            <option value="Commissioner">Commissioner</option>
                                            <option value="assCommissioner">Ass/Commissioner</option><option value="">Deputy Commissioner</option>
                                            <option value="Commander">Commander</option><option value="">Ass/Commander</option><option value="">Deputy Commander</option>
                                            <option value="">Ass/Commander</option>
                                            <option value="">Inspector</option><option value=""><option value="">Deputy Inspector</option>
                                            <option value="">Sergeant</option><option value="">Ass/Sergeant</option><option value="">Deputy Sergeant</option>
                                            <option value="">Constable</option><option value="">Nominee Officer</option>
                                            <option value="">Commissioner General</option><option value="">Deputy Commissioner General</option>
                                            <option value="">Deputy Inspector</option><option value="">Engineer Doctor</option>
                                            <option value="">Sister</option><option value="">Health Officer</option><option value="">Nurse</option><option value="">Mid Wife</option>
                                            <option value="">Secretary</option><option value="">Director</option><option value="">Head Director</option>
                                            <option value="">Ra/Tech</option>
                                            <option value="33">Mr</option><option value="34">Ms</option><option value="35">Phd</option><option value="36">Doctor</option>
                                        </select>
                                    </div>
                                </div>   
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Name</span>
                                        <input type="text" name="firsname"  class="form-control" id="firstname" placeholder="Enter First Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Middle Name</span>
                                        <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Middle Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Last Name</span>
                                        <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Last Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phone NO</span>
                                        <input type="text" name="phoneno"  class="form-control" id="phoneno" placeholder="Enter Phone NO">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Email</span>
                                        <input type="text" name="email"  class="form-control" id="email" placeholder="Enter Email">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Department</span>
                                        <input type="text" name="department"  class="form-control" id="department" placeholder="Enter Department">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Salary</span>
                                        <input type="text" name="salary"  class="form-control" id="firstname" placeholder="Enter salary">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Status</span>
                                        <select class="form-control" id="status" name="status" required="requiered">
                                            <option value="">-select status-</option>
                                            <option value="1">Active</option>
                                            <option value="2">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Type</span>
                                        <select class="form-control" id="insttype" name="insttype" required="requiered">
                                            <option value="">-select type-</option>
                                            <option value="1">Civil</option>
                                            <option value="2">Military</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Responsibility</span>
                                        <input type="text" name="responsibility"  class="form-control" id="responsibility" placeholder="Enter Responsibility">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Hired Date</span>
                                        <input type="date" name="hireddate"  class="form-control" id="hireddate" placeholder="Enter Hired Date">

                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Police Management</span>
                                        <select class="form-control" id="policemngmt" name="policemngmt" required="requiered">
                                            <option value="">-select type-</option>
                                            <option value="1">Yes</option>
                                            <option value="2">No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Description</span>
                                        <textarea type="text" name="description"  class="form-control" id="description" placeholder="Enter Description"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <button type="submit" id="tnsaveinst" class="btn btn-primary">
                                        <span class="fa fa-save"><strong>  Save instructor info</strong></span></button>
                                </div>

                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <span class="text-primary header "><strong>Instructor Profile</strong></span>
                                </div>

                                <table class="table table-hover table-bordered table-responsive table-striped" id="tblinstprofile">
                                    <thead>
                                        <tr>
                                            <th>STAFF TITLE</th>
                                            <th>STAFF NAME</th>
                                            <th>DEPARTMENT</th>
                                            <th>PHONE</th>
                                            <th >E-MAIL</th>
                                            <th>DESCRIPTION</th>
                                            <th colspan="2">ACTION</th>

                                        </tr>
                                    </thead>
                                    <!--                                    <tbody>
                                                                            <tr>
                                                                                <td style="appearance: hyperlink"><a href="InstructorDetail.jsp" >Dr.Lizi</a></td>
                                                                                <td>Bangalore</td>
                                                                                <td>560001</td>
                                                                                <td>560001</td>
                                                                                <td >560001</td>
                                    
                                                                            </tr>
                                                                            <tr>
                                                                                <td><a href="InstructorDetail.jsp" >Dr.kooper</a></td>
                                                                                <td>Mumbai</td>
                                                                                <td>400003</td>
                                                                                <td>400003</td>
                                                                                <td>400003</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><a href="InstructorDetail.jsp" >Mr.kean</a></td>
                                                                                <td>Pune</td>
                                                                                <td>411027</td>
                                                                                <td>400003</td>
                                                                                <td>400003</td>
                                                                            </tr>
                                    
                                                                        </tbody>-->
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
                                            <td><%=rs_course.getString(7)%></td>
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
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table>
                                <!--</div>-->
                                </form>

                        </section>
                        <%
                            request.getSession().setAttribute("instregsaved", null);
                            request.getSession().setAttribute("instregnotsaved", null);

                        %>
                        <h3>Qualification</h3>

                        <section >
<!--                                                        <div class="col-lg-12"> <button id="addexperience" ondblclick="hideform()" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-down">  Add Higher Qualification</span></button>
                                                            <div class="container" id="formexpericence">
                            
                                                            </div></div>
                            
                                                        <script type="text/javascript">
                                                            $(document).ready(function ()
                                                            {
                                                                $("#addexperience").click(function () {
                                                                    $("#formexpericence").html("\
                                                     <div class='form-group'>\n\
                                                          <form class='form-group' id='expform' action='${pageContext.request.contextPath}/saveexperience'>\n\
                                                    <div class='form-group col-lg-2 '>\n\
                                                               Academic Level <select class='form-control'>\n\
                                                                <option>select degree type</option\n\
                                                                        \n\<option>select degree type</option>\n\
                                                                        <option>BSC degree</option>\\n\
                                                                        <option>MSC degree</option>\\n\
                                                                        <option>PHD degree</option>\\n\
                                                                        <option>DIPLOMA</option>\
                                                                 </select>\n\
                                                                </div> \n\
                                                         <div class='form-group col-lg-3'>Area of Study<input type='text' name='areaofstudy' class='form-control'/>\n\
                                                          </div>\n\
                                                            <div class='form-group col-lg-3'>\n\
                                                           \n\
                                                           institution:<input class='form-control' name='type' placeholder='Enter institution you studied at'/>\n\
                                                             </div>  \n\
                                                         <div class='input-group'>\n\
                                                                            <input class='form-control' id='datefrom_lect_from' name='datefrom_lect_from' placeholder='Enter  Date' type='date' required=''/>\n\
                                                                            <span class=' input-group-addon fa fa-calendar-minus-o'></span>\n\
                                                                        </div>\n\
                                                              <div class='form-group col-lg-2'>Year received\n\
                                                               <input type='date' name='yearrecieveform' id='yearrecieveform' class='form-control' required=''/></div>\n\
                                                      ;         <div class='form-group col-lg-4' ></div>\n\
                                                        <div class='form-group col-lg-4' ><input type='submit' class='btn btn-primary' value='save Qualification'></div>\n\
                                                            </form>\n\
                                                     </div>");
                                                                });
                                                            });
                                                        </script>
                            
                                                        <script type="text/javascript">
                                                            function hideform()
                                                            {
                                                                $("#expform").hide();
                                                            }
                            
                                                        </script>
                            
                                                        <div class="col-lg-12"> <button id="addcertfct" ondblclick="hideformcertfct()" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-down">  Add Certificate Qualification</span></button>
                                                            <div class="container" id="formcertfctdiv">
                            
                                                            </div></div>
                            
                                                        <script type="text/javascript">
                                                            $(document).ready(function ()
                                                            {
                                                                $("#addcertfct").click(function () {
                                                                    $("#formcertfctdiv").html("\
                                                     <div class='form-group col-lg-12'>\n\
                                                          <form class='form-group' id='formcertfct' action='${pageContext.request.contextPath}/saveexperience'>\n\
                                                        <div class='form-group col-lg-3 has-success'>Area of Study<input type='text' name='areaofstudy' class='form-control'/>\n\
                                                          </div>\n\
                                                            <div class='form-group col-lg-3 has-success'>\n\
                                                           \n\
                                                           Institution:<input class='form-control' name='type' placeholder='Enter institution you studied at'/>\n\
                                                             </div>  \n\
                                                             <div class='form-group col-lg-2 has-success'>Year received\n\
                                                               <input type='date' name='year_received' id='yearrecieved' class='form-control'></div>\n\
                                                      ;         <div class='form-group col-lg-4 has-success' ></div>\n\
                                                        <div class='form-group col-lg-4 has-success' ><input type='submit' class='btn btn-primary' value='save Qualification'></div>\n\
                                                            </form>\n\
                                                     </div>");
                                                                });
                                                            });
                                                        </script>
                            
                            
                                                        <script type="text/javascript">
                                                            function hideformcertfct()
                                                            {
                                                                $("#formcertfct").hide();
                                                            }
                            
                                                        </script>-->

<!--                            <div id="accordion">
                                <h3>Section 1</h3>-->
                                <!--<div>-->
                                  
                            <div class="form-group col-lg-12"> <label> Area of experties </label></div>
                            <!--                                <div class="form-group col-lg-4 "> <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Lecture</div>
                                                            <div class="form-group col-lg-4 ">    <input  class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Government Office</div>
                                                            <div class="form-group col-lg-4 ">    <input  class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Private Office</div>
                                                            <div class="form-group col-lg-4 ">    <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Software</div>
                                                            <div class="form-group col-lg-4 ">   <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Network</div>
                                                            <div class="form-group col-lg-4 ">   <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Maintenance
                                                            </div>-->
                            <!--                     table expriance-->


                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Area of Expertise</th>
                                        <th>Organization Type</th>
                                        <th>Organization Name</th>
                                        <th>Total Experience</th>
                                        <th>From</th>
                                        <th>To</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row"><select class="form-control" id="lecture" name="lecture" required="required">
                                                <option value="-1">-select department-</option>
                                                <option value="1">Lecture</option>
                                                <option value="1">IT</option>
                                                <option value="2">Software</option>
                                                <option value="1">Maintenance</option>
                                                <option value="2">Management</option>
                                                <option value="1">Finance</option>
                                                <option value="2">Health</option>
                                                <option value="2">Accounting</option>
                                            </select></th>

                                        <td> 
                                            <select class="form-control" id="lecture" name="lecture" required="required">
                                                <option value="-1">-select department-</option>
                                                <option value="1">Government Office</option>
                                                <option value="2">Private Office</option>
                                            </select>
                                        </td>
                                        <td><input type="text"></td>
                                        <td><input type="text"></td>
                                        <td class="col-lg-2">
                                            <div class="input-group">
                                                <input class="form-control " id="datefrom_lect_from" name="datefrom_lect_from" placeholder="Enter  Date" type="date" required=""/>
                                                <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                            </div>
                                        </td>
                                        <td class="col-lg-2">
                                            <div class="input-group">
                                                <input class="form-control " id="datefrom_lect_to" name="datefrom_lect_to" placeholder="Enter  Date" type="date" required=""/>
                                                <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <div class="form-group col-lg-12" >                    
                                <button type="submit" class="btn navbar-btn btn-info"><span class="glyphicon glyphicon-save">Save</span></button>
                            </div>

                            </form>
                        </section>
                    </div>


                    <!-- </div>
                 </div>-->
                </div>
            </div>
        </div>
    </div>
    <!--<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>-->
    <!--<script src="../jquery/jquery-1.10.2.min.js" type="text/javascript"></script>-->

    <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
    <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>

    <!--<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>-->
    <!--<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>-->

    <script type="text/javascript">
        $("#datepicker2").datepicker({
            changeMonth: true,
            changeYear: true

        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblinstprofile').DataTable();
        });
    </script>

    <script>
        $("#example-async").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slide"
        });
    </script>
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
<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
        $("#hireddate").datepicker({
            changeMonth: true,
            changeYear: true

        });</script>
<script type="text/javascript">
    $("#datefrom_lect_from").datepicker({
        changeMonth: true,
        changeYear: true

    });</script>
<script type="text/javascript">
    $("#yearrecieveform").datepicker({
        changeMonth: true,
        changeYear: true

    });</script>
<script type="text/javascript">
    $("#yearrecieved").datepicker({
        changeMonth: true,
        changeYear: true

    });</script>
<script type="text/javascript">
    $("#datefrom_mnt_from").datepicker({
        changeMonth: true,
        changeYear: true

    });</script>
<script type="text/javascript">
    $("#yearrecieveform").datepicker({
        changeMonth: true,
        changeYear: true

    });</script>

<script>
    $(function () {
        $("#accordion").accordion({
            collapsible: true
        });
    });
</script>
<script type="text/javascript">
    $(function () {

        // Get the form fields and hidden div
        var button = $("#btnshow");
        var checkbox = $("#trigger");
        var hidden = $("#hidden_fields");
        var populate = $("#populate");

        // Hide the fields.
        // Use JS to do this in case the user doesn't have JS 
        // enabled.
        hidden.hide();

        // Setup an event listener for when the state of the 
        // checkbox changes.
        checkbox.change(function () {
            // Check to see if the checkbox is checked.
            // If it is, show the fields and populate the input.
            // If not, hide the fields.
            if (checkbox.is(':checked')) {
                // Show the hidden fields.
                hidden.show();
                // Populate the input.
                populate.val("Dude, this input got populated!");
            } else {
                // Make sure that the hidden fields are indeed
                // hidden.
                hidden.hide();

                // You may also want to clear the value of the 
                // hidden fields here. Just in case somebody 
                // shows the fields, enters data to them and then 
                // unticks the checkbox.
                //
                // This would do the job:
                //
                // $("#hidden_field").val("");
            }
        });
    });
</script>