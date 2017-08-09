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
<style>
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
</style>
<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/header.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
            <div class="col-lg-10"  >
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



                        <%
//                         
                            } else {
                                out.println("no data");
                            }
                    %>

                    <div id="example-async" class="pull-right">
                           ${instregsaved}
                           ${instregnotsaved}
                        <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                        <h3>Instructor Profile</h3>
                        <section >
                            <form class="form-group " method="post" id="inst_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet" >
                                ${instregsaved}
                                ${instregnotsaved}
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Instructor ID</span>
                                        <input type="text" name="instid"  class="form-control" id="instid" placeholder="Auto Inst ID">
                                    </div>
                                </div>
                                <div class="form-group col-lg-2">
                                    <div class="input-group">
                                        <!--<span class="input-group-addon">Search</span>-->
                                        <button type="submit" class="btn btn-info" id="instsearch">Search</button>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <!--<form name="form1" method="post" enctype="multipart/form-data" action="insertimage.jsp">-->

                                    <p>
                                        <input type="file" name="ImageFile" id="ImageFile" />
                                    </p>
                                    <p>
                                        <input type="submit" name="submit" value="submit" />
                                    </p>
                                    <!--</form>-->
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="insttitle" name="insttitle" required="required">
                                            <option value="">-select title-</option>
                                            <option value="">-Commissioner-</option>
                                            <option value="">Ass/Commissioner</option><option value="">Deputy Commissioner</option>
                                            <option value="">Commander</option><option value="">Ass/Commander</option><option value="">Deputy Commander</option>
                                            <option value="">Commander</option><option value="">Ass/Commander</option>
                                            <option value="">Inspector</option><option value=""><option value="">Deputy Inspector</option>
                                            <option value="">Sergeant</option><option value="">Ass/Sergeant</option><option value="">Deputy Sergeant</option>
                                            <option value="">Constable</option><option value="">Nominee Officer</option>
                                            <option value="">Commissioner General</option><option value="">Deputy Commissioner General</option>
                                            <option value="">Deputy Inspector</option><option value="">Engineer Doctor</option>
                                            <option value="">Sister</option><option value="">Health Officer</option><option value="">Nurse</option><option value="">Mid Wife</option>
                                            <option value="">Secretary</option><option value="">Director</option><option value="">Head Director</option>
                                            <option value="">Ra/Tech</option>
<!--                                            <option value="ኮሚሽነር">ኮሚሽነር</option><option value="2">ዕ/መኮንን</option><option value="3">ም/ኮማንደር</option>
                                            <option value="ኮማንደር" >ኮማንደር</option><option value="5">ረ/ኮሚሽነር</option><option value="6">ም/ኮሚሽነር</option>
                                            <option value="7">ኢንስፔክተር</option><option value="8">ረ/ኢንስፔክተር</option><option value="9">ሳጅን</option>
                                            <option value="10">ኢንስፔክተር</option><option value="11">ኮንስታብል</option><option value="12">ረ/ሳጅን</option><option value="13">ም/ሳጅን</option><option value="14">ዋ/ሳጅን</option>
                                            <option value="15">ራ/ቴክ</option><option value="16">ም/ኢንስፔክተር</option><option value="17">ዋ/ኢንስፔክተርn </option><option value="18">ኢንጂነርዶክተር</option><option value="19">ም/ኮማንደር</option>
                                            <option value="20">ወ/ሮ</option><option value="21">ወ/ት</option><option value="22">አቶ<option value="23">ኮሚሽነር ጄኔራል</option><option value="24">ም/ኮሚሽነር ጄኔራል</option>
                                            <option value="25">ሲስተር</option><option value="26">የጤና መኮንን</option><option value="27">ጸሃፊ</option><option value="28">ነርስ</option>
                                            <option value="29">ጤና መኮንን</option><option value="30">ዋና ዳይሬክተር</option>
                                            <option value="31">ሚድዋ<option value="32">ዶክተር</option>-->
                                            <option value="33">Mr</option><option value="34">Ms</option><option value="35">Phd</option><option value="36">Doctor</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Name</span>
                                        <input type="text" name="firsname"  class="form-control" id="firstname" placeholder="Enter First Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Middle Name</span>
                                        <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Middle Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Last Name</span>
                                        <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Last Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phone NO</span>
                                        <input type="text" name="phoneno"  class="form-control" id="phoneno" placeholder="Enter Phone NO">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Email</span>
                                        <input type="text" name="email"  class="form-control" id="email" placeholder="Enter Email">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Department</span>
                                        <input type="text" name="department"  class="form-control" id="department" placeholder="Enter Department">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Salary</span>
                                        <input type="text" name="salary"  class="form-control" id="firstname" placeholder="Enter salary">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Status</span>
                                        <select class="form-control" id="status" name="status" required="requiered">
                                            <option value="">-select status-</option>
                                            <option value="1">Active</option>
                                            <option value="2">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Type</span>
                                        <select class="form-control" id="insttype" name="insttype" required="requiered">
                                            <option value="">-selct type-</option>
                                            <option value="1">Civil</option>
                                            <option value="2">Military</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Responsibility</span>
                                        <input type="text" name="responsibility"  class="form-control" id="responsibility" placeholder="Enter Responsibility">
                                    </div>
                                </div>
                                   <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Hired Date</span>
                                        <input type="text" name="hireddate"  class="form-control" id="hireddate" placeholder="Enter Hired Date">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Description</span>
                                        <input type="text" name="description"  class="form-control" id="description" placeholder="Enter Description">
                                    </div>
                                </div>
                                <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save instructor info</strong></span></button>

                                <!--                                <div class="form-group col-lg-12" > 
                                                                    <button type="submit" class="btn btn-primary" id="instbtnreg">Register</button>
                                                                </div>-->
                            </form>
                            <!--<div class="">-->
                                 <span class="text-primary">  <strong>Instructor Registration</strong></span>

                                <table class="table table-hover table-bordered table-responsive table-striped" id="tblinstprofile">
                                    <thead>
                                        <tr>
                                            <th>STAFF TITLE</th>
                                            <th>STAFF NAME</th>
                                            <th>DEPARTMENT</th>
                                            <th>PHONE</th>
                                            <th >E-MAIL</th>
                                            <th>DESCRIPTION</th>
                                            <th>ACTION</th>
                                            
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
                            <!--</div>-->
                            <!--</form>-->

                        </section>
                                 <%   
                                     request.getSession().setAttribute("instregsaved", null);
                                      request.getSession().setAttribute("instregnotsaved", null);
                                     
                            %>
                        <h3>Qualification</h3>

                        <section >
                            <button id="addexperience" onclick="return addexperience()">Add experience</button>
                              
                              
                            <form class="input-group" id="instedu_form" method="post" action="">
                                <div class="form-group"><label>Qualification</label></div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Degree</span>
                                        <input type="text" name="instfirstdegree"  class="form-control" id="firstdegree" placeholder="Enter First Degree">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Second Degree</span>
                                        <input type="text" name="instseconddegree"  class="form-control" id="seconddegree" placeholder="Enter Second Degree">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phd</span>
                                        <input type="text" name="instphd"  class="form-control" id="phddegree" placeholder="Enter Phd">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Certificates</span>
                                        <input type="text" name="instcertificates"  class="form-control" id="certificates" placeholder="List Certificates">
                                    </div>
                                </div>
                                <div class="form-group col-lg-12"> <label> Area of experties </label></div>
                                <div class="form-group col-lg-4 "> <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Lecture</div>
                                <div class="form-group col-lg-4 ">     <input  class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Government Office</div>
                                <div class="form-group col-lg-4 ">    <input  class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Private Office</div>
                                <div class="form-group col-lg-4 ">    <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Software</div>
                                <div class="form-group col-lg-4 ">   <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Network</div>
                                <div class="form-group col-lg-4 ">   <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Maintenance
                                </div>


                                <div class="form-group col-lg-12" >                    
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></p>
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></p>
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Update</button></p>
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Delete</button></p>
                                </div>
                                <!--add experience-->
                              
                                <div class="">
                                    <table class="table table-hover table-bordered table-responsive">
                                        <caption>Academic Profile</caption>
                                        <thead>
                                            <tr>
                                                <th>STAFF NAME</th>
                                                <th>ROOM</th>
                                                <th>PHONE</th>
                                                <th >E-MAIL</th>
                                                <th>REMARK</th>
                                            </tr>
                                        </thead>
                                        <tbody>
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

                                        </tbody>
                                    </table>
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
    <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
    <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
    
    <script type="text/javascript">
        $().ready(function(){
    function addexperience(){
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



