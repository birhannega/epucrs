<%@page import="javafx.scene.control.Alert"%>
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
    <body oncontextmenu="return false">
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
            <!--<p class="page-header text-primary text-right ">Welcome:<%=session.getAttribute("dpt").toString()%></p>-->
                
                    <!-- Button trigger modal -->
                    <button class="btn btn-primary btn-sm pull-right" data-toggle="modal" data-target="#myModal">
                        <span  class="glyphicon glyphicon-circle-arrow-down glyphicon glyphicon-link">  Add Course</span>
                    </button>
                    ${courseRegistered}
                    ${courseNotRegistered}
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <p class="text-primary text-center "><strong>Course Registration</strong></p>
                                    <button type="button" class="close pull-right" 
                                            data-dismiss="modal" aria-hidden="true" style="color: midnightblue">
                                        &times;
                                    </button>
                                </div>
                                <form name="applicationForm" role="form" class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//CourseServlet">

                                    <div class="modal-body">
        <!--                                <form class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//CourseServlet">-->
                                        <div class="form-group col-lg-4 has-success">  
                                            <span>Department</span>
                                            <select name="department" id="department"  class="form-control" onchange="showState(this.value)" >
                                                <option value="">select department</option>
                                                <%
                                                    connectionManager connnmgr = new connectionManager();
                                                    Connection con = connnmgr.getconnection();
                                                    Statement getdept = con.createStatement();

                                                    String dep_name = null, depid = null;
                                                    ResultSet rs_dept = getdept.executeQuery("select * from TBL_DEPARTMENT");

                                                    while (rs_dept.next()) {
                                                        dep_name = rs_dept.getString("DEP_NAME");
                                                        depid = rs_dept.getString("DEP_ID");
                                                %>
                                                <option value="<%=depid%>"><%=dep_name%></option>
                                                <%
                                                    }
                                                %>

                                            </select>                          
                                        </div>
                                        <div class="form-group col-lg-4 has-success">  
                                            <span class="has-success">Program</span>

                                            <select name="program" id="program" class="form-control has-success">

                                                <option value="">select program</option> 

                                            </select>
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <!--<span class="input-group-addon">Term</span>-->
                                            <span class="pull-center">Term</span>
                                            <!--Term-->
                                            <select class="form-control" id="term" name="term" required="required">
                                                <option value="">-select term-</option>
                                                <%
//                                                    connectionManager connnmgr = new connectionManager();
//                                                    Connection con = connnmgr.getconnection();
                                                    Statement getterm = con.createStatement();

                                                    String term_name = null, termid = null;
                                                    ResultSet rs_term = getterm.executeQuery("select * from LU_TERM");

                                                    while (rs_term.next()) {
                                                        term_name = rs_term.getString("TERM_NAME");
                                                        termid = rs_term.getString("TERM_SEQNO");
                                                %>
                                                <option value="<%=termid%>"><%=term_name%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <!--</div>-->
                                        </div>

                                        <!--<div data-dte-e="input-control" class="DTE_Field_InputControl" style="display: block;">Term<input id="DTE_Field_first_name" type="text"></div>-->
                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center has-success">Course Name</span>
                                            <input type="text" name="coursename"  class="form-control" id="coursename" placeholder="Enter Course Name">
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center">Date</span>
                                            <input class="form-control" id="datepicker2" name="date_registered" placeholder="Enter Date" type="date" required=""/>
                                            <!--                                            <span class="input-group-addon">
                                                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                                                        </span>-->
                                            <!--</div>-->
                                        </div>


                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center">Credit Hour</span>
                                            <input type="text" name="creditH"  class="form-control" id="ch" placeholder="Enter Credit Hour">
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center">Pre Request</span>
                                            <!--Term-->
                                            <select class="form-control" id="prerequest" name="prerequest" required="required">
                                                <option value="">-select term-</option>
                                                <option value="Yes">Yes</option>
                                                <option value="No">No</option>

                                            </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center">Type</span>
                                            <!--Term-->
                                            <select class="form-control" id="coursetype" name="coursetype" required="required">
                                                <option value="">-select term-</option>
                                                <option value="Modular">Modular</option>
                                                <option value="Linear">Linear</option>

                                            </select>
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <!--</form>-->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-info" 
                                                data-dismiss="modal">
                                            <span class="glyphicon glyphicon-record">Refresh</span>
                                        </button>
                                        <button type="button" class="btn btn-warning" 
                                                data-dismiss="modal">
                                            <span class="glyphicon glyphicon-remove">Close</span>
                                        </button>
                                        <button type="submit" class="btn btn-primary" id="btnregister">
                                            <span  class="fa fa-save"> Register</span>
                                        </button>
                                    </div>
                                </form>

                            </div><!-- /.modal-content -->
                        </div>
                    </div><!-- /.modal -->
                    <!--table start-->
                    <%
                        session.setAttribute("courseRegistered", null);
                        session.setAttribute("courseNotRegistered", null);
                    %>

                    <div class="col-lg-12 header">
                        <span class="text-primary">  <strong>List of available courses</strong></span>
                    </div>
                    ${del}
                    ${courseUpdate}
                    ${courseNotUpdate}
                    <!--start form edit-->
                    <%
                        if (request.getParameter("action") != null && request.getParameter("id") != null) {
                            String action = request.getParameter("action");
                            String id = request.getParameter("id");
                            if (action.equalsIgnoreCase("delete")) {
                                //Alert="";
                                ResultSet rs_delete = getdept.executeQuery("delete from TBL_COURSE_REGISTRATION where COURSE_CODE='" + id + "'");
                                // if (rs_delete.next()) {

                    %>    
                    <div class="alert alert-success" id="">
                        Successfully deleted
                    </div>        

                    <% } else if (action.equalsIgnoreCase("edit")) {
                        ResultSet rs_edit = getdept.executeQuery("select * from TBL_COURSE_REGISTRATION where COURSE_CODE='" + id + "'");
                        if (rs_edit.next()) {

                    %>

                    <div class="form-group">

                        <p class=""> <strong>Editing <%=rs_edit.getString("COURSE_NAME")%></strong> </p>
                        <form class="form-group" action="${ pageContext.request.contextPath }/CourseUpdateServlet" method="Post">
                            <!--<form class="form-group" action="../CommonOprations/EditCourse.jsp" method="Post">-->
                            <div class="form-group col-lg-4">
                                COURSE CODE:
                                <input class="form-control" type="text" name="coursecode" value="<%=id%>" readonly/>
                            </div>
                            <div class="form-group col-lg-4">
                                DEPARTMENT:
                                <input class="form-control" type="text" name="edited_department" value="<%=rs_edit.getString("DEPARTMENT")%>" readonly/>
                            </div>
                            <div class="form-group col-lg-4">
                                PROGRAM:
                                <input class="form-control" type="text" name="edited_program" value="<%=rs_edit.getString("PROGRAM")%>" readonly/>
                            </div>
                            <div class="form-group col-lg-4">
                                TERM:
                                <!--<input class="form-control" type="text" name="edited_term" value="<%=rs_edit.getString("TERM")%>"/>-->
                                <select class="form-control" name="edited_term">
                                    <option class="" value="<%=rs_edit.getString("TERM")%>"><%=rs_edit.getString("TERM")%></option>
                                    <option class="" value="">-select term-</option>
                                    <%
                                        try {
                                            String trmid = null, termname = null;
                                            Statement termstm = con.createStatement();
                                            ResultSet termrs = termstm.executeQuery("select * from lu_term");
                                    %>

                                    <%while (termrs.next()) {
                                            trmid = termrs.getString("term_seqno");
                                            termname = termrs.getString("term_name");
                                    %>
                                    <option value="<%=termid%>"><%=termname%></option>
                                    <%}%>
                                    <%
                                        } catch (Exception e) {
                                            out.println("wrong selection!" + e);

                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group col-lg-4">
                                COURSE_NAME:
                                <!--<input class="form-control" type="text" name="edited_coursename" value="<%=rs_edit.getString("COURSE_NAME")%>"/>-->
                                <select name="edited_coursename" Class="form-control">
                                    <option class="form-control" name="edited_coursename" value="<%=rs_edit.getString("COURSE_NAME")%>"><%=rs_edit.getString("COURSE_NAME")%></option>
                                    <option class="">-select course-</option>
                                    <%
                                        try {
                                            String trmid = null, termname = null;
                                            Statement termstm = con.createStatement();
                                            ResultSet termrs = termstm.executeQuery("select * from TBL_COURSE_REGISTRATION");
                                    %>

                                    <%while (termrs.next()) {
                                            trmid = termrs.getString("COURSE_CODE");
                                            termname = termrs.getString("COURSE_NAME");
                                    %>
                                    <option value="<%=termid%>"><%=termname%></option>
                                    <%}%>
                                    <%
                                        } catch (Exception e) {
                                            out.println("wrong selection!" + e);

                                        }
                                    %>
                                </select>

                            </div>
                            <div class="form-group col-lg-4">
                                ADDED_DATE:
                                <input class="form-control" type="date" name="edited_added_date" value="<%=rs_edit.getString("ADDED_DATE")%>"/>
                            </div>
                            <div class="form-group col-lg-4">
                                CREDIT_HOURS:
                                <input class="form-control" type="text" name="edited_credit_hour" value="<%=rs_edit.getString("CREDIT_HOURS")%>"/>
                            </div>
                            <div class="form-group col-lg-4">
                                <span class="pull-center">PRE_REQUEST:</span>
                                <!--Term-->
                                <select class="form-control" id="edited_prerequest" name="edited_prerequest" required="required">
                                    <option value="<%=rs_edit.getString("PRE_REQUEST")%>"><%=rs_edit.getString("PRE_REQUEST")%></option>
                                    <option value="">-select term-</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>

                                </select> 
                            </div>
                            <div class="form-group col-lg-4 has-success">
                                <!--<div class="input-group">-->
                                <span class="pull-center">Type</span>
                                <!--Term-->
                                <select class="form-control" id="edit_coursetype" name="edit_coursetype" required="required">
                                    <option value="<%=rs_edit.getString("COURSE_TYPE")%>"><%=rs_edit.getString("COURSE_TYPE")%></option>
                                    <option value="">-select term-</option>
                                    <option value="Modular">Modular</option>
                                    <option value="Linear">Linear</option>

                                </select>
                                <!--</div>-->
                            </div>
                            <div class="form-group col-lg-4"> <br>

                                <input class="btn btn-warning" type="submit" value="Update"/>
                            </div>
                        </form>

                    </div>
                    <%}
                            }
                        }
                    %>

                    <%
                        session.setAttribute("courseUpdate", null);
                        session.setAttribute("courseNotUpdate", null);
                    %>
                    <%
                        session.setAttribute("del", null);
                    %>
                    <!--end of edit form-->
                    <table  class="table table-striped table-bordered table-hover "  id="tabledate" >
                        <thead>
                            <tr>
                                <th>Course Code</th>
                                <th>Department</th>
                                <th>Program</th>
                                <th>Term</th>
                                <th>Course Name</th>
                                <th>Added Date</th>
                                <th>Credit Hours</th>
                                <th>Has Pre Request</th>
                                <th>Course_Type</th>
                                <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                                <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                            </tr>
                        </thead>


                        <tbody>
                            <%
                                connectionManager dbconnection = new connectionManager();
                                Statement st_list_course = dbconnection.getconnection().createStatement();
                                String course_sql = "select * from TBL_COURSE_REGISTRATION order by COURSE_CODE";
                                ResultSet rs_course = st_list_course.executeQuery(course_sql);
                                while (rs_course.next()) {
                                    String idcc = rs_course.getString(1);
                            %>
                            <tr>
    <!--                            <td><%=rs_course.getString(1)%></td> -->
                                <td><%=idcc%></td> 
                                <td><%=rs_course.getString(2)%></td> 
                                <td><%=rs_course.getString(3)%></td> 
                                <td><%=rs_course.getString(4)%></td> 
                                <td><%=rs_course.getString(5)%></td> 
                                <td><%=rs_course.getString(6)%></td> 
                                <td><%=rs_course.getString(7)%></td> 
                                <td><%=rs_course.getString(8)%></td> 
                                <td><%=rs_course.getString(9)%></td> 
                                <td>
                                    <form action="" method="post">
                                        <input type="hidden" name="action" value="edit"/>
                                        <input type="hidden" name="id" id="edit_id" value="<%=rs_course.getString(1)%>"/>
                                        <!--<input type="hidden" name="edit_id" value="<%=idcc%>"/>-->

                                        <button class="btn btn-warning glyphicon glyphicon-edit" id="edit_id">Edit</button>
                                    </form>
                                </td>
                                <td>
                                    <!--<form action="deletecourse.jsp" method="Post" >-->
                                    <form action="" class="form-group" method="Post" >
                                  <!--<input type="hidden" name="delete_id" value="<%=idcc%>"/>-->
                                        <input type="hidden" name="action" value="delete"/>
                                        <input type="hidden" name="id" id="delete_id" value="<%=rs_course.getString(1)%>"/>

                                        <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid">Delete</button>
                                    </form>
                                </td>

                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <!--                    <strong></strong>
                                        <form action="" id="editing_form" method="post" style="visibility: hidden">
                    
                                            <input type="text" name="edit_id" value="<%%>"/>
                    
                                            <button class="btn btn-warning" id="edit_id">Edit</button>
                                        </form>-->

                    <!--table end-->
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
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <!--<script src="../jquery/jquery-1.10.2.min.js" type="text/javascript"/></script>-->

        <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
        <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <link href="../resources/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>

        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
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
            $().ready(function () {
                //                    var j = jQuery.noConflict();
                $('#tabledate').dataTable();
            });


        </script>
        <script type="text/javascript">
            $(function () {

                $("#stud_reg").validate({
                    rules: {
                        department: {
                            required: true
                        },
                        program: {
                            required: true
                        },
                        coursename: {
                            required: true

                        },
                        coursetype:
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
                        coursetype: {
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
