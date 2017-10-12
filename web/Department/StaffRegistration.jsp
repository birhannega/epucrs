<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Add-user</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <style>
            .accordion-toggle {cursor: pointer;}
            .accordion-content {display: none;}
            .accordion-content.default {display: block;}
        </style>
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
                        <%@include file="../common/depsidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">

                    <%--<%@include file="adduser_form.jsp" %>--%>



                    <div id="tabs" class="container-fluid">
                        <ul>
                            <li><a href="#tabs-1">StaffProfile</a></li>
                            <li><a href="#tabs-2">EditStaffprofile</a></li>
                            <li><a href="#tabs-3">AddExperiance</a></li>
                        </ul>
                        <div id="tabs-1">

                            ${instreg}
                            ${instNotreg}
                            <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->

                            <form class="form-group " method="POST" id="stud_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet">

                                <div class="form-group col-lg-12">Instructor Id:<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled id="instid" name="instid" value=""></div> 
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
                                            <option value="assCommissioner">Ass/Commissioner</option><option value="Deputy Commissioner">Deputy Commissioner</option>
                                            <option value="Commander">Commander</option><option value="Ass/Commander">Ass/Commander</option><option value="">Deputy Commander</option>
                                            <option value="Ass/Commander">Ass/Commander</option>
                                            <option value="Inspector">Inspector</option><option value="Deputy Inspector">Deputy Inspector</option>
                                            <option value="Sergeant">Sergeant</option><option value="">Ass/Sergeant</option><option value="">Deputy Sergeant</option>
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
                                               <select class="form-control" id="department" name="department" required="required">
                                                <option value="-1">-select department-</option>
                                                <%
                                                    try {
                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_program = dbconnection.getconnection().createStatement();
                                                        String program_sql = "select * from lu_dep";

                                                        ResultSet rs_program = st_program.executeQuery(program_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_program.next()) {
                                                        String id = rs_program.getString("dep_name");
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
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Status</span>
                                        <select class="form-control" id="status" name="status" required="requiered">
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
                                         <select class="form-control" id="responsibility" name="responsibility" required="required">
                                                <option value="-1">-select responsibility-</option>
                                                <%
                                                    try {
                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_program = dbconnection.getconnection().createStatement();
                                                        String program_sql = "select * from lu_responsibility";

                                                        ResultSet rs_program = st_program.executeQuery(program_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_program.next()) {
                                                        String id = rs_program.getString("resp_name");
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
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Hired Date</span>
                                        <input class="form-control" id="datepicker2" name="dateassigned" placeholder="Enter Assigned Date" type="date" required=""/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Police Management</span>
                                        <select class="form-control" id="policemngmt" name="policemngmt" required="requiered">
                                            <option value="">-select PM type-</option>
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
                                        <span class="fa fa-save"><strong>  Save staff info</strong></span></button>
                                </div>
                            </form>
                            <%
                                session.setAttribute("instreg", null);
                                session.setAttribute("instNotreg", null);
                            %>
                        </div>
                        <div id="tabs-2">


                            <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->

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
                                        <th>Instructor TITLE</th>
                                        <th>Instructor NAME</th>
                                        <th>DEPARTMENT</th>
                                        <th>PHONE</th>
                                        <th>STATUS</th>
                                        <th>POLICE MANAGEMENT</th>
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
                                        String course_sql = "select  Staff_Id,Title, First_Name || ' '|| Middle_Name || ' '|| LAST_NAME as FULL_NAME,departement,Phone, STATUS ,POLICE_MANAGEMENT from TBL_ACADEMIC_STAFF_REG ";

                                        ResultSet rs_course = st_list_course.executeQuery(course_sql);
                                        while (rs_course.next()) {
                                            String id = rs_course.getString(1);
                                    %>
                                    <tr>
            <!--                            <td><%=rs_course.getString(1)%></td> -->
                                        <!--<td><%=id%></td>--> 
                                        <td><%=rs_course.getString(2)%></td> 
                                        <td><%=rs_course.getString(3)%></td> 
                                        <td><%=rs_course.getString(4)%></td> 
                                        <td><%=rs_course.getString(5)%></td> 
                                        <td><%=rs_course.getString(6)%></td> 
                                        <td><%=rs_course.getString(7)%></td>
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

                        <div id="tabs-3">

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
                                                    <div class="input-group">
                                                       <input class="form-control " id="datefrom_lect_from" name="datefrom_exp_from" placeholder="Enter  Date" type="date" required=""/>
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="col-lg-2">
                                                <div class="input-group">
                                                    <input class="form-control " id="datefrom_lect_to" name="datefrom_lexp_to" placeholder="Enter  Date" type="date" required=""/>
                                                   <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
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
        <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
        <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <link href="../resources/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

        <script type="text/javascript">
            $().ready(function () {
                //                    var j = jQuery.noConflict();
                $('#tabledate').dataTable();
            });
            //

        </script> <script>
            $(function () {
                $("#tabs").tabs();
            });
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

        <script  type="text/javascript">

            var xmlHttp;
            function showState(str) {
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp == null) {
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var url = ".../common/program.jsp";
                url += "?department=" + str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }

            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("program").innerHTML = xmlHttp.responseText
                }
            }
        </script>
    </body>
</html>
