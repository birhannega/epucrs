<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
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
        <!--<link href="../resources/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>-->
        <!--        <script src="../resources/jquery-ui/js/jquery-ui.min.js" type="text/javascript"></script>
                <script src="../resources/jquery-ui/js/jquery-1.11.0.min.js" type="text/javascript"></script>-->
    </head>
    <body oncontextmenu="return false">
        <%@include file="../common/head_banner.jsp" %>
        <%
            connectionManager dbconnection = new connectionManager();
            Statement stmt = dbconnection.getconnection().createStatement();
        %>
        <div class="row">
            <style>
                table {
                    max-width: none;
                }
            </style>
            <!--            <style type='text/css'>
                            /* Style to hide Dates / Months */
                            .ui-datepicker-calendar,.ui-datepicker-month { display: none; }
                        </style>-->
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
                        <%@include file="sidemenu.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>
            <!--            <style>
                            .ui-datepicker-calendar {
                                display: none;
                            }
                        </style>-->
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <!-- Button trigger modal -->
                    <button class="btn btn-primary btn-sm pull-right" data-toggle="modal" data-target="#myModal">
                        <span  class="fa fa-plus-circle">  Add Course</span>
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <p class="text-primary text-center"><strong>Course Registration</strong></p>
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
                                            <span class="pull-center has-success">Course Code</span>
                                            <input type="text" name="coursecode"  class="form-control" id="coursecode" placeholder="Enter Course Code">
                                            <!--</div>-->
                                        </div>
<!--                                        <div class="form-group col-lg-4 has-success">
                                            <div class="input-group">
                                            <span class="input-group-addon">Term</span>
                                            <span class="pull-center">Term</span>
                                            Term
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
                                                        termid = rs_term.getString("TERM_ID");
                                                %>
                                                <option value="<%=term_name%>"><%=term_name%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </div>
                                        </div>-->

                                        <!--<div data-dte-e="input-control" class="DTE_Field_InputControl" style="display: block;">Term<input id="DTE_Field_first_name" type="text"></div>-->
                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center has-success">Course Title</span>
                                            <input type="text" name="coursename"  class="form-control" id="coursename" placeholder="Enter Course Name">
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <div class="input-group">
                                            <span class="pull-center">Registration Year</span>
                                            <input class="form-control" id="datepicker2" name="reg_year" placeholder="Enter Date" type="date" required=""/>
                                            </div>
                                           
                                        </div>


                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center">Credit Hour</span>
                                            <input type="text" name="creditH"  class="form-control" id="ch" placeholder="Enter Credit Hour">
                                            <!--</div>-->
                                        </div>

                                        <div class="form-group col-lg-4 has-success">
                                            <!--<div class="input-group">-->
                                            <span class="pull-center">Course Type</span>
                                            <!--Term-->
                                            <select class="form-control" id="coursetype" name="coursetype" required="required">
                                                <!--<option value="">-select type-</option>-->
                                                <option value="Modular">Modular</option>
                                                <option value="Linear">Linear</option>

                                            </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <div class="input-group">
                                            <span class="pull-center">Course Approach</span>
                                            Term
                                            <select class="form-control" id="courseapproach" name="courseapproach" required="required">
                                                <option value="">-select approach-</option>
                                                <option value="Main">Main</option>
                                                <option value="Supportive">Supportive</option>
                                                <option value="Common">Common</option>

                                            </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer" >
                                            <span class="fa sp_empty"><p></p></span>
                                            <button type="button" class="btn btn-info" 
                                                    data-dismiss="modal">
                                                <span class="glyphicon glyphicon-record">Reset</span>
                                            </button>
                                            <button type="button" class="btn btn-warning" 
                                                    data-dismiss="modal">
                                                <span class="glyphicon glyphicon-remove">Close</span>
                                            </button>
                                            <button type="submit" class="btn btn-primary" id="btnregister">
                                                <span  class="fa fa-save"> Register</span>
                                            </button>
                                        </div>
                                        <!--display prerequest-->

                                        <!--</form>-->
                                    </div>
                                    <!--</form>-->
                                    <div class="modal-footer">



                                    </div>   <!--end footer-->
                                </form>

                            </div><!-- /.modal-content -->
                        </div>
                    </div><!-- /.modal -->
                    <!--start tab-->
                    <ul class="nav nav-tabs" id="myTab">

                        <li class="active"><a data-toggle="tab" href="#sectionA"><span class="fa fa-navicon"> Course List</span></a></li>

                        <li><a data-toggle="tab" href="#sectionB"><span class="fa fa-plus-square"> Pre Request</span></a></li>

                        <li><a data-toggle="tab" href="#sectionC"><span class="fa fa-edit"> Edit Course Credit Hours</span></a></li>

                    </ul>

                    <div class="tab-content">

                        <div id="sectionA" class="tab-pane fade in active">

                            ${courseRegistered}
                            ${courseNotRegistered}

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
                                        ResultSet rs_delete = getdept.executeQuery("delete from TBL_COURSE_REGISTRATION where COURSE_SEQNO='" + id + "'");
                                        // if (rs_delete.next()) {

                            %>    
                            <!--                    <div class="alert alert-success" id="">
                                                    Successfully deleted
                                                </div>        -->

                            <% } else if (action.equalsIgnoreCase("edit")) {
                                ResultSet rs_edit = getdept.executeQuery("select * from TBL_COURSE_REGISTRATION where COURSE_SEQNO='" + id + "'");
                                if (rs_edit.next()) {

                            %>

                            <div class="form-group">

                                <p class=""> <strong>Editing <%=rs_edit.getString("COURSE_NAME")%></strong> </p>
                                <form class="form-group" action="${ pageContext.request.contextPath }/CourseUpdateServlet" method="Post">
                                    <!--<form class="form-group" action="../CommonOprations/EditCourse.jsp" method="Post">-->
                                    <div class="form-group col-lg-4">
                                        COURSE CODE:
                                        <input class="form-control" type="text" name="edit_coursecode" value="<%=rs_edit.getString("COURSE_CODE")%>" />
                                    </div>
                                    <div class="form-group col-lg-4">
                                        DEPARTMENT:
                                        <input class="form-control" type="text" name="edited_department" value="<%=rs_edit.getString("DEP_ID")%>" />
                                    </div>
                                    <div class="form-group col-lg-4">
                                        PROGRAM:
                                        <input class="form-control" type="text" name="edited_program" value="<%=rs_edit.getString("PROGRAM_ID")%>" />
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
                                        CREDIT_HOURS:
                                        <input class="form-control" type="text" name="edited_credit_hour" value="<%=rs_edit.getString("CREDIT_HOURS")%>"/>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <span class="pull-center">PRE_REQUEST:</span>
                                        <!--prerequest-->
                                        <select class="form-control" id="edited_prerequest" name="edited_prerequest" required="required">
                                            <option value="<%=rs_edit.getString("PRE_REQUEST")%>"><%=rs_edit.getString("PRE_REQUEST")%></option>
                                            <option value="">-select prerequest-</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>

                                        </select> 
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Course Type</span>
                                        <!--course type-->
                                        <select class="form-control" id="edit_coursetype" name="edit_coursetype" required="required">
                                            <option value="<%=rs_edit.getString("COURSE_TYPE")%>"><%=rs_edit.getString("COURSE_TYPE")%></option>
                                            <option value="">-select type-</option>
                                            <option value="Modular">Modular</option>
                                            <option value="Linear">Linear</option>

                                        </select>
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4">
                                        REGISTRATION_YEAR:
                                        <input class="form-control" type="date" name="edit_academicyear" id="edit_academicyear" value="<%=rs_edit.getString("REGISTRATION_YEAR")%>"/>
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Course Approach</span>
                                        <!--Term-->
                                        <select class="form-control" id="edit_courseapproach" name="edit_courseapproach" required="required">
                                            <option value="<%=rs_edit.getString("COURSE_APPROACH")%>"><%=rs_edit.getString("COURSE_APPROACH")%></option>
                                            <option value="">-select course approach-</option>
                                            <option value="Main">Main</option>
                                            <option value="Supportive">Supportive</option>
                                            <option value="Common">Common</option>
                                            

                                        </select>
                                        <!--</div>-->
                                    </div>

                                    <div class="form-group col-lg-4">
                                        SEQ_NO:
                                        <input class="form-control" type="TEXT" name="edit_COURSE_SEQNO" id="edit_COURSE_SEQNO" value="<%=rs_edit.getString("COURSE_SEQNO")%>" readonly=""/>
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
                                session.setAttribute("del", null);
                            %>

                            <!--end of edit form-->
                            <div class="table table-responsive">
                                <table  class="table table-striped table-bordered table-hover"  id="tabledate" >
                                    <thead>
                                        <tr>
                                            <th>Course Code</th>
                                            <th>Department</th>
                                            <th>Program</th>
<!--                                            <th>Term</th>-->
                                            <th>Course Name</th>
<!--                                            <th>Offering Year</th>-->
                                            <th>Credit Hours</th>
                                            <th>Has Pre Request</th>
                                            <th>Course_Type</th>
                                            <th>Reg_Year</th>
                                            <th>Course_Approach</th>
                                            <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                                            <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                                        </tr>
                                    </thead>


                                    <tbody>
                                        <%
//                                            connectionManager dbconnection = new connectionManager();
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
                                                    <input type="hidden" name="id" id="edit_id" value="<%=rs_course.getString(10)%>"/>
                                                    <!--<input type="hidden" name="edit_id" value="<%=idcc%>"/>-->

                                                    <button class="btn btn-warning glyphicon glyphicon-edit" id="edit_id">Edit</button>
                                                </form>
                                            </td>
                                            <td>
                                                <!--<form action="deletecourse.jsp" method="Post" >-->
                                                <form action="" class="form-group" method="Post" >
                                              <!--<input type="hidden" name="delete_id" value="<%=idcc%>"/>-->
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="id" id="delete_id" value="<%=rs_course.getString(10)%>"/>

                                                    <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid">Delete</button>
                                                </form>
                                            </td>

                                        </tr>
                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>

                        </div><!--tab a end-->


                        <div id="sectionB" class="tab-pane fade">
                            ${prerequestsave}
                            ${prerequestNotsave}
                            ${PrerequestUpdatesave}
                            ${PrerequestUpdateNotsave}
                            <!--display pre-request-->
                            <form class="form-group" method="POST">

                                <br>
                                <div class="input-group col-lg-4">
                                    <!--<label class="form-control">Search By ID:</label>--> 
                                    <input  type="text" name="crscode" id="crscode" placeholder="Enter Course Code!" class="form-control">
                                    <div class="input-group-btn">
                                        <!--<input type="submit" value="search"/>-->
                                        <button type="submit" class="btn btn-default">
                                            <span class="glyphicon glyphicon-search">Search</span>
                                        </button>
                                        <!--<span class="glyphicon glyphicon-search"></span>-->
                                    </div>
                                </div>
                                <p class="page-header">Pre Request List</p>
                                <%
                                    String crsc = request.getParameter("crscode");

                                    if (crsc == null || crsc == "") {
                                        //                                        out.println("Enter correct id");
                                        //                                         out.println("<img width='100' height='50' src=displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
                                    } else {

                                        connectionManager conn1 = new connectionManager();
                                        PreparedStatement ps = conn1.getconnection().prepareStatement("select * from TBL_PREREQUEST where COURSE_CODE='" + crsc + "'");
                                        ResultSet rs = ps.executeQuery();%>

                                <input type="text" value="<%=request.getParameter("crscode")%>" readonly=""><br>
                                <% while (rs.next()) {
                                        //                   out.println("<h3>" + rs.getString("ACADEMIC_STAFF_ID") + "</h3>");
                                        //                    out.println("<img width='100' height='50' src=../displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
%>

                                <!--<div class="col-lg-6">--> 

                                <input type="checkbox" name="fetchprerequest" id="fetchprerequest"><%=rs.getString("PRE_REQUEST_NAME")%><br>
                                <%  }

                                %>

                                <!--</div>-->
                            </form>
                            <%  }%>
                            <form class="form-group" method="POST"action="${ pageContext.request.contextPath }/Pre_requestRegServlet">
                                <!--<input type="text" value="<%=request.getParameter("crscode")%>" hidden="" name="precrscode" id="crscode">-->
                                <p class="page-header pull-center has-success">Additional Pre Request?</p>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="pull-center has-success">Has Pre Request?</span>
                                    <strong>Yes</strong><input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="yesCheck"> 
                                    <strong>No </strong><input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="noCheck"><br>
                                    <!--<input type="text" name="coursename"  class="form-control" id="coursename" placeholder="Enter Course Name">-->
                                    <!--</div>-->
                                </div>

                                <div id="ifYes" style="visibility:hidden" class="form-group col-lg-8">

                                    <div class="form-group col-lg-4">
                                        Course_Code:
                                        <input class="form-control" type="text" name="precrscode" id="precrscode" value="" placeholder="Enter Pre Request Code"/>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        Pre_Request Name:
                                        <input type="text" class="input-small form-control" id="prerequestname"  name="prerequestname"  placeholder="Enter Pre Request Name " >
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <button type="submit" id="saveinstexp" class="btn btn-warning">
                                        <span class="fa fa-save"><strong> Save Pre Request</strong></span></button>
                                </div>
                                <!--</form>-->

                            </form>

                            <%
                                session.setAttribute("prerequestsave", null);
                                session.setAttribute("prerequestNotsave", null);
                            %>
                            <!--start edit table pre request-->
                            <%
                         if (request.getParameter("action") != null && request.getParameter("id") != null) {
                             String action = request.getParameter("action");
                             String id = request.getParameter("id");
                             if (action.equalsIgnoreCase("delete")) {
                                 //Alert="";
                                 ResultSet rs_delete = getdept.executeQuery("delete from TBL_PREREQUEST  where SEQNO_PREREQUEST='" + id + "'");
                                 // if (rs_delete.next()) {

                            %>    
                            <!--                    <div class="alert alert-success" id="">
                                                    Successfully deleted
                                                </div>        -->

                            <% } else if (action.equalsIgnoreCase("edit")) {
                                ResultSet rs_edit = getdept.executeQuery("select * from TBL_PREREQUEST  where SEQNO_PREREQUEST='" + id + "'");
                                if (rs_edit.next()) {

                            %>

                            <div class="form-group">

                                <p class=""> <strong>Editing <%=rs_edit.getString("COURSE_CODE")%></strong> </p>
                                <form class="form-group" action="${ pageContext.request.contextPath }/PrerequestUpdateServlet" method="Post">
                                    <!--<form class="form-group" action="../CommonOprations/EditCourse.jsp" method="Post">-->
                                    <div class="form-group col-lg-4">
                                        COURSE CODE:
                                        <input class="form-control" type="text" name="edit_precoursecode" value="<%=rs_edit.getString("COURSE_CODE")%>" readonly=""/>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        PRE REQUEST NAME:
                                        <input class="form-control" type="text" name="edited_prerequestname" value="<%=rs_edit.getString("PRE_REQUEST_NAME")%>" />
                                    </div>

                                    <div class="form-group col-lg-4">
                                        SEQ_NO:
                                        <input class="form-control" type="TEXT" name="edit_PRECOURSE_SEQNO" id="edit_PRECOURSE_SEQNO" value="<%=rs_edit.getString("SEQNO_PREREQUEST")%>" readonly=""/>
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
                            <!--end edit table pre request-->
                            <!--start pre_request table-->
                            <div class="table table-responsive">
                                <table  class="table table-striped table-bordered table-hover"  id="tabledateprerequest" >
                                    <thead>
                                        <tr>
                                            <th>Course_Code</th>
                                            <th>Pre_request Name</th>
                                            <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                                            <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                                        </tr>
                                    </thead>


                                    <tbody>
                                        <%
//                                            connectionManager dbconnection = new connectionManager();
//                                            Statement st_list_course = dbconnection.getconnection().createStatement();
                                            String _sql = "select * from TBL_PREREQUEST order by COURSE_CODE";
                                            ResultSet rs_ = stmt.executeQuery(_sql);
                                            while (rs_.next()) {
                                                String idcc = rs_.getString(1);
                                        %>
                                        <tr>
                                            <td><%=idcc%></td> 
                                            <td><%=rs_.getString(2)%></td> 

                                            <td>
                                                <form action="" method="post">
                                                    <input type="hidden" name="action" value="edit"/>
                                                    <input type="hidden" name="id" id="edit_id" value="<%=rs_.getString(3)%>"/>
                                                    <!--<input type="hidden" name="edit_id" value="<%=idcc%>"/>-->

                                                    <button class="btn btn-warning glyphicon glyphicon-edit" id="edit_id">Edit</button>
                                                </form>
                                            </td>
                                            <td>
                                                <!--<form action="deletecourse.jsp" method="Post" >-->
                                                <form action="" class="form-group" method="Post" >
                                              <!--<input type="hidden" name="delete_id" value="<%=idcc%>"/>-->
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="id" id="delete_id" value="<%=rs_.getString(3)%>"/>

                                                    <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid">Delete</button>
                                                </form>
                                            </td>

                                        </tr>
                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table>
                            </div>
                                    <%
                               session.setAttribute("PrerequestUpdatesave", null);
                               session.setAttribute("PrerequestUpdateNotsave", null);
                                %>      
                            <!--end pre_request table-->
                        </div>


                        <div id="sectionC" class="tab-pane fade">
                            ${creditsave}
                            ${creditNotsave}
                            ${creditUpdateNotsave}
                            ${creditUpdatesave}
                            <p class="page-header text-primary text-center">Credit Hour Management</p>
                            <form class="form-group">

                                <br>
                                <div class="input-group col-lg-4">
                                    <!--<label class="form-control">Search By ID:</label>--> 
                                    <input  type="text" name="crscodecredit" id="crscodecredit" placeholder="Enter Course Code!" class="form-control">
                                    <div class="input-group-btn">
                                        <!--<input type="submit" value="search"/>-->
                                        <button type="submit" class="btn btn-default">
                                            <span class="glyphicon glyphicon-search">Search</span>
                                        </button>
                                        <!--<span class="glyphicon glyphicon-search"></span>-->
                                    </div>
                                </div>
                                <%
                                    String crscd = request.getParameter("crscodecredit");

                                    if (crscd == null || crscd == "") {
                                        //                                        out.println("Enter correct id");
                                        //                                         out.println("<img width='100' height='50' src=displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
                                    } else {

                                        connectionManager conpre = new connectionManager();
                                        PreparedStatement ps = conpre.getconnection().prepareStatement("select * from TBL_COURSE_REGISTRATION where COURSE_CODE='" + crscd + "'");
                                        ResultSet rs = ps.executeQuery();
                                        //                            out.println("<h3>Students</h3>");
                                        while (rs.next()) {
                                            //                   out.println("<h3>" + rs.getString("ACADEMIC_STAFF_ID") + "</h3>");
                                            //                    out.println("<img width='100' height='50' src=../displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
                                %>

                                <table class="table table-responsive table-hover table-bordered" style="width: 100px">

                                    <thead>  
                                    <th>
                                        COURSE_CODE
                                    </th>
                                    <th>
                                        COURSE_NAME
                                    </th>
                                    <th>
                                        TOTAL_CREDIT_HOUR
                                    </th>
                                    </thead>

                                    <tr>
                                        <td>
                                            <%=rs.getString("COURSE_CODE")%>  
                                        </td>
                                        <td>
                                            <%=rs.getString("COURSE_NAME")%>
                                        </td>
                                        <td>
                                            <%=rs.getString("CREDIT_HOURS")%> 
                                        </td>
                                    </tr>

                                </table>
                                   <%}%>
                                   <div class="form-group col-lg-12">
                                <p class="page-header text-primary text-center">You want to edit credit hour:</p>
                                <form class="form-group" method="POST"  action="${pageContext.request.contextPath}//CreditHourServlet">

                                    <input type="hidden" name="creditcrscode" id="creditcrscode" value="<%=request.getParameter("crscodecredit")%>">
                                    <!--<p class="page-header pull-center has-success">Additional credit Request?</p>-->
                                    <div class="form-group col-lg-8 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center has-success">Spit Credit Hour?</span>
                                        <strong>Yes</strong><input type="radio" onclick="javascript:yesnoCheckCredit();" name="yesno" id="yesCheckCredit"> 
                                        <strong>No </strong><input type="radio" onclick="javascript:yesnoCheckCredit();" name="yesno" id="noCheck"><br>
                                        <!--<input type="text" name="coursename"  class="form-control" id="coursename" placeholder="Enter Course Name">-->
                                        <!--</div>-->
                                    </div>
                                
                                    <div id="ifYesCredit" style="visibility:hidden" class="form-group col-lg-6">
                                        <div class="form-group col-lg-4 has-success">
                                            <label>Course_Code</label>
                                            <input type="text" class="input-small form-control" id="crscodecredit" name="crscodecredit"  placeholder="Enter course code  " >
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <label>TheoryCredit Hr</label>
                                            <input type="text" class="input-small form-control" id="thrycredithour" name="thrycredithour"  placeholder="Enter theory credit hour  " >
                                        </div>
                                        <div class="form-group col-lg-4 has-success">
                                            <label>PracticeCredit Hr</label>
                                            <input type="text" class="input-small form-control" id="prctcredithour" name="prctcredithour"  placeholder="Enter practice credit hour  " >
                                        </div>

                                        <div class="col-lg-8 col-md-6 col-sm-6">
                                            <button type="submit" id="saveinstexp" class="btn btn-success">
                                                <span class="fa fa-save"><strong> Save Credit Hour</strong></span></button>
                                        </div>
                                    </div>

                                    </script>
                                </form>
                                   </div>
                                     <%}%>
                                     
                                <%
                                   session.setAttribute("creditsave", null);
                                   session.setAttribute("creditNotsave", null);
                                %>
                                <!--start edit table credit hour-->
                                <%
                             if (request.getParameter("actioncredit") != null && request.getParameter("idcredit") != null) {
                                 String action = request.getParameter("actioncredit");
                                 String id = request.getParameter("idcredit");
                                 if (action.equalsIgnoreCase("delete")) {
                                     //Alert="";
                                     ResultSet rs_delete = getdept.executeQuery("delete from TBL_CREDIT  where SEQNO_CREDITHOUR='" + id + "'");
                                     // if (rs_delete.next()) {

                                %>    
                                <!--                    <div class="alert alert-success" id="">
                                                        Successfully deleted
                                                    </div>        -->

                                <% } else if (action.equalsIgnoreCase("edit")) {
                                    ResultSet rs_edit = getdept.executeQuery("select * from TBL_CREDIT  where SEQNO_CREDITHOUR='" + id + "'");
                                    if (rs_edit.next()) {

                                %>

                                <div class="form-group">

                                    <p class=""> <strong>Editing <%=rs_edit.getString("COURSE_CODE")%></strong> </p>
                                    <form class="form-group" action="${ pageContext.request.contextPath }/CreditHourUpdateServlet" method="Post">
                                        <!--<form class="form-group" action="../CommonOprations/EditCourse.jsp" method="Post">-->
                                        <div class="form-group col-lg-4">
                                            COURSE CODE:
                                            <input class="form-control" type="text" name="edit_creditcrscode" value="<%=rs_edit.getString("COURSE_CODE")%>" />
                                        </div>
                                        <div class="form-group col-lg-4">
                                            THEORY CREDIT HOUR:
                                            <input class="form-control" type="text" name="edit_credittheory" value="<%=rs_edit.getString("THEORY_CREDIT")%>" />
                                        </div>
                                        <div class="form-group col-lg-4">
                                            PRACTICE CREDIT HOUR:
                                            <input class="form-control" type="text" name="edit_creditpractice" value="<%=rs_edit.getString("PRACTICE_CREDIT")%>" />
                                        </div>

                                        <div class="form-group col-lg-4">
                                            SEQ_NO:
                                            <input class="form-control" type="TEXT" name="edit_crdt_SEQNO" id="edit_PRECOURSE_SEQNO" value="<%=rs_edit.getString("SEQNO_CREDITHOUR")%>" readonly=""/>
                                        </div>
                                        <div class="form-group col-lg-4"> <br>

                                            <input class="btn btn-warning" type="submit" value="Update"/>
                                        </div>
                                    </form>
                                    <%
                                        session.setAttribute("creditUpdatesave", null);
                                        session.setAttribute("creditUpdateNotsave", null);
                                    %>
                                </div>
                                <% }
                                        }
                                    }
                                %>
                                <!--end edit table credit hour-->
                                <!--start table credit-->
                                <div class="table table-responsive">
                                    <table  class="table table-striped table-bordered table-hover"  id="tabledatecredit" >
                                        <thead>
                                            <tr>
                                                <th>COURSE_CODE</th>
                                                <th>THEORY_CREDIT</th>
                                                <th>PRACTICE_CREDIT</th>
                                                <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                                                <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                                            </tr>
                                        </thead>


                                        <tbody>
                                            <%
                                               String sql_credit = "select * from TBL_CREDIT order by COURSE_CODE";
                                                ResultSet rs_credit = stmt.executeQuery(sql_credit);
                                                while (rs_credit.next()) {
                                                    String idcc = rs_credit.getString(1);
                                            %>
                                            <tr>
                                                <td><%=idcc%></td> 
                                                <td><%=rs_credit.getString(2)%></td> 
                                                <td><%=rs_credit.getString(3)%></td>                                        
                                                <td>
                                                    <form action="" method="post">
                                                        <input type="hidden" name="actioncredit" value="edit"/>
                                                        <input type="hidden" name="idcredit" id="edit_id" value="<%=rs_credit.getString(4)%>"/>
                                                        <!--<input type="hidden" name="edit_id" value="<%=idcc%>"/>-->

                                                        <button class="btn btn-warning glyphicon glyphicon-edit" id="edit_id">Edit</button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <!--<form action="deletecourse.jsp" method="Post" >-->
                                                    <form action="" class="form-group" method="Post" >
                                                  <!--<input type="hidden" name="delete_id" value="<%=idcc%>"/>-->
                                                        <input type="hidden" name="actioncredit" value="delete"/>
                                                        <input type="hidden" name="idcredit" id="delete_id" value="<%=rs_credit.getString(4)%>"/>
                                                        <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid">Delete</button>
                                                    </form>
                                                </td>

                                            </tr>
                                            <%
                                                }
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <!--end credit table-->

                        </div>
                    </div>
                </div>

                <!--end tab-->
            </div>
        </div>

        <!--pre request script-->
        <script type="text/javascript">
            function yesnoCheck() {
                if (document.getElementById('yesCheck').checked) {
                    document.getElementById('ifYes').style.visibility = 'visible';
                } else
                    document.getElementById('ifYes').style.visibility = 'hidden';

            }
            function yesnoCheckCredit() {
                if (document.getElementById('yesCheckCredit').checked) {
                    document.getElementById('ifYesCredit').style.visibility = 'visible';
                } else
                    document.getElementById('ifYesCredit').style.visibility = 'hidden';

            }
            
        </script>
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
        <!--        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
                <script src="../jquery/jquery-1.10.2.min.js" type="text/javascript"/></script>
        
                <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
                <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
                <link href="../resources/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        
                <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
                <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>              -->
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
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
            $().ready(function () {
                //                    var j = jQuery.noConflict();
                $('#tabledateprerequest').dataTable();
            });


        </script>
        <script type="text/javascript">
            $().ready(function () {
                //                    var j = jQuery.noConflict();
                $('#tabledatecredit').dataTable();
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
        <script type="text/javascript">

            $(document).ready(function () {

                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                    localStorage.setItem('activeTab', $(e.target).attr('href'));

                });

                var activeTab = localStorage.getItem('activeTab');

                if (activeTab) {

                    $('#myTab a[href="' + activeTab + '"]').tab('show');

                }

            });

        </script>

    </body>
</html>
