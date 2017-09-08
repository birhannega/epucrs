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
<!--<link rel="stylesheet" href="../css/jQuery.steps.css"/>-->
<link href="../resources/css/searchname.css" rel="stylesheet" type="text/css"/>

<style>
    .accordion-toggle {cursor: pointer;}
    .accordion-content {display: none;}
    .accordion-content.default {display: block;}
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
    <script type="text/javascript">
        $(document).ready(function ($) {
            $('#accordion').find('.accordion-toggle').click(function () {

                //Expand or collapse this panel
                $(this).next().slideToggle('fast');

                //Hide the other panels
                $(".accordion-content").not($(this).next()).slideUp('fast');

            });
        });
    </script>
    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 
        <div class="col-lg-2" id="sidebar">
            <%@include file="../common/department_sidebar.jsp" %>
        </div>
        <div class="col-lg-10"  >
          
            <%
                connectionManager con = new connectionManager();
                Connection connection = con.getconnection();
                Statement statement = connection.createStatement();
                String query = "Select INSTRUCTOR_COUNTER From Tbl_SETUP";
                ResultSet res = statement.executeQuery(query);
                String inst_counter = null;
                if (res.next()) {

                    inst_counter = res.getString("INSTRUCTOR_COUNTER");
                    if (inst_counter.length() == 1) {
                        inst_counter = inst_counter.concat("00");
                    }
                    if (inst_counter.length() == 2) {
                        inst_counter = inst_counter.concat("0");
                    }
                    if (inst_counter.length() == 3) {
                        inst_counter = inst_counter + 1;
                    }
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
            <p class="page-header text-primary text-center">Instructor Registration</p>
            <div id="accordion">
                <div class="form-group col-lg-12">
                      ${instreg}
                      ${instNotreg}
                    <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->
                    <a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorProfile</span></a>
                    <div class="accordion-content default">
                        <form class="form-group " method="POST" id="stud_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet">
                           <div class="form-group col-lg-12">Instructor Id:<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled id="instid" name="instid" value="<%=inst_counter%>"></div> 
                            <div class="form-group col-lg-4 has-success has-feedback">
                                <div class="input-group">
                                    <input type="file" name="ImageFile" id="ImageFile" />
                                </div>
                            </div>
                            <div class="form-group col-lg-4 has-success has-feedback">

                                <div class="input-group">
                                    <span class="input-group-addon" >Title</span>
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
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-lg-4 has-success has-feedback">
                                <div class="input-group">
                                    <span class="input-group-addon">Type</span>
                                    <select class="form-control" id="insttype" name="insttype" required="requiered">
                                        <option value="">-select type-</option>
                                        <option value="Civil">Civil</option>
                                        <option value="Military">Military</option>
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
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
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
                        </form>
                    </div>
                </div>
            <%  request.getSession().setAttribute("instreg", null);
           request.getSession().setAttribute("instNotreg", null);
                            %>
                <div class="form-group col-lg-12">
                    <a class="accordion-toggle"><span class="glyphicon glyphicon-list">EditInstructorProfile</span></a>
                    <div class="accordion-content">
                        <form class="form-group " method="post" id="instrAssign" action="${pageContext.request.contextPath}//CourseAssignment">

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
                        </form>
                    </div>
                </div>



                <div class="form-group col-lg-12">
                    <a class="accordion-toggle"><span class="glyphicon glyphicon-list">AreaofExpertise</span></a>
                    <div class="accordion-content">
                        <form class="form-group " method="post" id="instrAssign" action="${pageContext.request.contextPath}//CourseAssignment">

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

                        </form> 
                    </div>
                </div>
            </div><!--end of accordion-->
              

        </div>
    </div>
    
</body>
</html>
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="../jquery/jquery-1.10.2.min.js" type="text/javascript"/></script>
<script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
<script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>


    <script type="text/javascript">
        $("#datepicker2").datepicker({
            changeMonth: true,
            changeYear: true

        });
    </script>
   <script type="text/javascript">
                    $().ready(function () {
//                    var j = jQuery.noConflict();
                        $('#tblinstprofile').dataTable();
                    });
                    //

</script>
    <script>
        $("#example-async").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slide"
        });
    </script>
    <script type="text/javascript">
        $.noConflict();
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
