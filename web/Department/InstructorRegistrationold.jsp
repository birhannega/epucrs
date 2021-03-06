<%-- 
    Document   : Course Registration LU
    Created on : 06-Mar-2017, 12:30:50
    Author     : Efrem
--%>

<%@page import="java.sql.*"%>

<%@page import="dbconnection.connectionManager"%>

<%@include file="../common/imports.jsp" %>

<body>
<link href="../resources/css/searchname.css" rel="stylesheet" type="text/css"/>

<style>
    .accordion-toggle {cursor: pointer;}
    .accordion-content {display: none;}
    .accordion-content.default {display: block;}
</style>

<div class="container-fluid"  style="margin-top: 5px">
    <%@include file="../common/department_nav.jsp" %>
</div>
<div class="col-lg-2" id="sidebar">
    <%@include file="../common/department_sidebar.jsp" %>
</div>
<div class="col-lg-10">

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
    <div id="accordion">
        <div class="form-group col-lg-12">
            ${instreg}
            ${instNotreg}
            <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->
            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">RegisterInstructorProfile</span></a>
            <div class="accordion-content">
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
                                <option value="">Inspector</option><option value="">Deputy Inspector</option>
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
        <div class="form-group col-lg-12">
            ${instreg}
            ${instNotreg}
            <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->
            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">EditInstructorProfile</span></a>
            <div class="accordion-content default">
                <script type="text/javascript">
                    $('#edit_id').click(function ()
                    {
                        $("#editing_form").css('visibility', "visible");
                    });
                </script>
                          ${del}
                <table  class="table table-striped table-bordered table-hover "  id="tabledate">
                    <thead>
                        <tr>
                            <th>STAFF TITLE</th>
                            <th>STAFF NAME</th>
                            <th>DEPARTMENT</th>
                            <th>PHONE</th>
                            <th>E-MAIL</th>
                            <th>DESCRIPTION</th>
                            <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                            <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                        </tr>
                    </thead>
                    <%
                        session.setAttribute("del", null);
                    %>

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
<!--                            <td><%=rs_course.getString(1)%></td> -->
                            <td><%=id%></td> 
                            <td><%=rs_course.getString(2)%></td> 
                            <td><%=rs_course.getString(3)%></td> 
                            <td><%=rs_course.getString(4)%></td> 
                            <td><%=rs_course.getString(5)%></td> 
                            <td><%=rs_course.getString(6)%></td> 
                            <td>


                                <form action="" method="post">

                                    <input type="hidden" name="edit_id" value="<%=id%>"/>

                                    <button class="btn btn-warning" id="edit_id">Edit</button>
                                </form>

                            </td>

                            <td>
                                <form action="deletecourse.jsp" method="Post" >
                                    <input type="hidden" name="delete_id" value="<%=id%>"/>
                                    <button class="btn btn-danger" id="deleteid">Delete</button>
                                </form>


                            </td>
                            <!--                    <script type="text/javascript">
                                                    $('#deleteid').on('click', function () {
                                                        table
                                                                .row($(this).parents('tr'))
                                                                .remove()
                                                                .draw();
                                                    });
                                                </script>-->
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
                <strong></strong>
                <form action="" id="editing_form" method="post" style="visibility: hidden">

                    <input type="text" name="edit_id" value="<%%>"/>

                    <button class="btn btn-warning" id="edit_id">Edit</button>
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
                                <th scope="row"><select class="form-control" id="expctgry" name="expctgry" required="required">
                                        <option value="-1">-select category-</option>
                                        <option value="Lecture">Lecture</option>
                                        <option value="IT">IT</option>
                                        <option value="Software">Software</option>
                                        <option value="Maintenance">Maintenance</option>
                                        <option value="Management">Management</option>
                                        <option value="Finance">Finance</option>
                                        <option value="Health">Health</option>
                                        <option value="Accounting">Accounting</option>
                                    </select></th>

                                <td> 
                                    <select class="form-control" id="officetype" name="officetype" required="required">
                                        <option value="-1">-select Office-</option>
                                        <option value="Government Office">Government Office</option>
                                        <option value="Private Office">Private Office</option>
                                    </select>
                                </td>
                                <td><input type="text" id="orgname" name="orgname" placeholder="Enter org name"></td>
                                <td><input type="text" id="totalexp" name="totalexp" placeholder="Enter total exp"></td>
                                <td class="col-lg-2">
                                    <div class="input-group">
                                        <input class="form-control " id="datefrom_lect_from" name="datefrom_exp_from" placeholder="Enter  Date" type="date" required=""/>
                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                    </div>
                                </td>
                                <td class="col-lg-2">
                                    <div class="input-group">
                                        <input class="form-control " id="datefrom_lect_to" name="datefrom_lexp_to" placeholder="Enter  Date" type="date" required=""/>
                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <div class="col-lg-12 col-md-6 col-sm-6">
                        <button type="submit" id="saveinstexp" class="btn btn-primary">
                            <span class="fa fa-save"><strong>  Save Instructor Expertise</strong></span></button>
                    </div>
                </form> 
            </div>
        </div>
    </div>


</div>

<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../jquery/jquery-1.10.2.min.js" type="text/javascript"/></script>
<script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
<script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
                    $().ready(function () {
//                    var j = jQuery.noConflict();
                        $('#tabledate').dataTable();
                    });
                    //

</script>
<script type="text/javascript">
    $(function () {

        $("#stud_reg").validate({
            rules: {
                exptype: {
                    required: true
                },
                officetype: {
                    required: true
                },
                datefrom_exp_from: {
                    required: true

                },
                datefrom_exp_to:
                        {
                            required: true
                        },
                date_registered:
                        {
                            required: true
                        },
                creditH: {
                    required: true,
                    digits: true
                },
                prerequest: {
                    required: true
                },
                term:
                        {
                            required: true
                        }
            },
            messages: {
                coursename: {
                    required: "Please enter some data",
                    minlength: "Your data must be at least 8 characters"
                },
                coursetype: "Please provide CourseType",
                date_registered: "Please provide Date",
                creditH: {
                    required: "Please enter some data",
                    digits: "Please provide Number"
                },
                prerequest: "Please Select Pre-Request",
                term: "Please Select Term"

            }
        });
    });
</script>

<script type="text/javascript">
    $("#date_registered").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
                //dateFormat: 'yyyy-mm-dd'
                //format:'yyyy-mm-dd'

    });

    $('input[type=date]').datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true

    });

</script>
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
</body>
</html>
