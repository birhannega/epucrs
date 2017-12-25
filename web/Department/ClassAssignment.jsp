<%@page import="org.omg.PortableInterceptor.LOCATION_FORWARD"%>
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
    <body  oncontextmenu="return false">
        <%
            int sid, cid;
        %>
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

        <!-- CSS -->
        <style>
            .accordion-toggle {cursor: pointer;}
            .accordion-content {display: none;}
            .accordion-content.default {display: block;}
        </style>
        <%
            connectionManager connnmgr = new connectionManager();
            Connection con = connnmgr.getconnection();
            Statement smt = con.createStatement();
        %>
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

                    <!-- HTML -->
                    <div id="accordion">
                        <div class="form-group col-lg-12">
                            <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->
                            <!--<a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorProfile</span></a>-->
                            <!--                            <div class="accordion-content default">
                                                      
                                                        </div>-->
                            <% connectionManager dbconnection = new connectionManager();%>
                        </div>
                        <div class="form-group col-lg-12">
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">ClassAssignment</span></a>
                            <div class="accordion-content">
                                ${ClassAssignmentReg}
                                ${ClassAssignmentNotReg}
                                <!--                                <form action="" method="POST">
                                                                    <div class="form-group col-lg-4 has-success">
                                                                        <span class="pull-center">Total Class:</span>
                                                                        <div class="form-control">
                                <%
                                    try {
                                        //connectionManager dbconnection = new connectionManager();
                                        Statement stm_class = dbconnection.getconnection().createStatement();
                                        String class_sql = "select count(*) as cnt_class from TBL_CLASS";

                                        ResultSet rs_class = stm_class.executeQuery(class_sql);

                                %>

                                <%    while (rs_class.next()) {
                                        String cnt_class = rs_class.getString("cnt_class");
                                        //cid;
%>
                                                                                                            <label class="control-label" for="tclass" ><%=cnt_class%></label>
                                <% } %>
                                </select>
                                <%
                                    } catch (Exception e) {
                                        out.println("wrong selection!" + e);
                                    }
                                %>
                                <label class="control-label" for="tclass" >----</label>
                            </div>
                        </div>

                        <div class="form-group col-lg-4 has-success">
                            <div class="input-group">
                            <span class="pull-center">Assigned Class New</span>
                            <div class="form-control">
                                <%
                                    try {
                                        //connectionManager dbconnection = new connectionManager();
                                        Statement stm_class = dbconnection.getconnection().createStatement();
                                        String class_sql = "select count(status) as cnt_class from TBL_CLASS where status='ASSIGN'";

                                        ResultSet rs_class = stm_class.executeQuery(class_sql);

                                %>

                                <%    while (rs_class.next()) {
                                        String cnt_class = rs_class.getString("cnt_class");
                                        //cid;
%>
                                                                                                            <label class="control-label" for="tclass" ><%=cnt_class%></label>
                                <% } %>
                                </select>
                                <%
                                    } catch (Exception e) {
                                        out.println("wrong selection!" + e);
                                    }
                                %>
                                <label class="control-label" for="tclass" >----</label>
                            </div>
                        </div>
                        <div class="form-group col-lg-4 has-success">
                            <div class="input-group">
                            <span class="pull-center">Assigned Class  Indoctrination</span>
                            <input type="text" name="unassclassinf"  class="form-control" id="unassclassinf" placeholder="Enter Unassigned class">
                            </div>
                            <div class="form-control">
                                <%
                                    try {
                                        //connectionManager dbconnection = new connectionManager();
                                        Statement stm_class = dbconnection.getconnection().createStatement();
                                        String class_sql = "select count(*) as cnt_class from TBL_CLASS where status='ASSIGN' and location='INDOCTRINATION BUILDING'";

                                        ResultSet rs_class = stm_class.executeQuery(class_sql);

                                %>

                                <%    while (rs_class.next()) {
                                        String cnt_class = rs_class.getString("cnt_class");
                                        //cid;
%>
                                                                                                            <label class="control-label" for="tclass" ><%=cnt_class%></label>
                                <% } %>
                                </select>
                                <%
                                    } catch (Exception e) {
                                        out.println("wrong selection!" + e);
                                    }
                                %>
                                <label class="control-label" for="tclass" >----</label>
                            </div>
                        </div>
                        <div class="form-group col-lg-4 has-success">
                            <div class="input-group">
                            <span class="pull-center">Assigned Class  Old</span>
                            <input type="text" name="assnclsold"  class="form-control" id="assnclsold" placeholder="Enter Unassigned class">
                            </div>
                            <div class="form-control">
                                <%
                                    try {
                                        //connectionManager dbconnection = new connectionManager();
                                        Statement stm_class = dbconnection.getconnection().createStatement();
                                        String class_sql = "select count(*) as cnt_class from TBL_CLASS where status='ASSIGN' and location='OLD BUILDING'";

                                        ResultSet rs_class = stm_class.executeQuery(class_sql);

                                %>

                                <%    while (rs_class.next()) {
                                        String cnt_class = rs_class.getString("cnt_class");
                                        //cid;
%>
                                                                                                            <label class="control-label" for="tclass" ><%=cnt_class%></label>
                                <% } %>
                                </select>
                                <%
                                    } catch (Exception e) {
                                        out.println("wrong selection!" + e);
                                    }
                                %>
                                <label class="control-label" for="tclass" >----</label>
                            </div>
                        </div> 
                        <div class="form-group col-lg-4 has-success">
                            <div class="input-group">
                            <span class="pull-center">UnAssigned Class  Old</span>
                            <input type="text" name="unassclassold"  class="form-control" id="unassclassold" placeholder="Enter Unassigned class">
                            </div>
                            <div class="form-control">
                                <%
                                    try {
                                        //connectionManager dbconnection = new connectionManager();
                                        Statement stm_class = dbconnection.getconnection().createStatement();
                                        String class_sql = "select count(*) as cnt_class from TBL_CLASS where status='UNASSIGN' and location='OLD BUILDING'";

                                        ResultSet rs_class = stm_class.executeQuery(class_sql);

                                %>

                                <%    while (rs_class.next()) {
                                        String cnt_class = rs_class.getString("cnt_class");
                                        //cid;
%>
                                                                                                            <label class="control-label" for="tclass" ><%=cnt_class%></label>
                                <% } %>
                                </select>
                                <%
                                    } catch (Exception e) {
                                        out.println("wrong selection!" + e);
                                    }
                                %>instructorname
                                <label class="control-label" for="tclass" >----</label>
                            </div>
                        </div>   

                    </form>-->
                                <form class="" method="post" id="classAssign" action="${pageContext.request.contextPath}/ClassAssignServlet">

                                    <div class="col-lg-12" ><p class="text-primary text-center header "><strong> Class Assignment</strong></p></div>
                                    <div class="form-group col-lg-4 has-success" id="">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Instructor Name</span>
                                        <!--<input type="text" name="instructorname"  class="form-control" id="instructorname" placeholder="Enter Unassigned class">-->
                                        <select class="form-control" id="instructorname" name="instructorname" required="required" onchange="showState(this.value)" >
                                            <option value="-1">-select instructor-</option>
                                            <%
                                                try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                    Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                    String lis_inst_sql = "select ACADEMIC_STAFF_ID, FIRST_NAME ||  ' ' ||  MIDDLE_NAME  || ' ' || LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";

                                                    ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_list_inst.next()) {
                                                    String id = rs_list_inst.getString("ACADEMIC_STAFF_ID");
                                                    String name = rs_list_inst.getString("FULL_NAME");
                                                    //cid;
                                            %>
                                            <option value="<%=id%>" ><%=name%></option>
                                            <% } %>
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                        </select>
                                        <!--</div>-->
                                    </div>



                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Course Name</span>
                                        <select class="form-control" id="courseName" name="courseName" required="required">
                                            <option value="-1">-select course-</option>
                                            <%
                                                try {
                                                    //connectionManager dbconnection = new connectionManager();
                                                    Statement st_course = dbconnection.getconnection().createStatement();
                                                    String crs_sql = "select  COURSE_CODE from TBL_COURSEASSIGNMENT group by COURSE_CODE";

                                                    ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_cours.next()) {
                                                    String c_code = rs_cours.getString("COURSE_CODE");
//                                                    String c_name = rs_cours.getString("COURSE_NAME");
                                                    //cid;
                                            %>
                                            <option value="<%=c_code%>"><%=c_code%></option>
                                            <% } %>
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                        </select>
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Location</span>
                                        <!--<input type="text" name="Location"  class="form-control" id="Location" placeholder="Enter Unassigned class">-->
                                        <select class="form-control" id="locatio" name="location" required="required">
                                            <option value="-1">-select class--</option>
                                            <%
                                                try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                    Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                    String lis_inst_sql = "select  location from TBL_CLASS group by location";

                                                    ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_list_inst.next()) {
                                                    String id = rs_list_inst.getString("location");
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
                                        <!--</div>-->
                                    </div> 
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Block</span>
                                        <!--<input type="text" name="Block"  class="form-control" id="Block" placeholder="Enter Unassigned class">-->
                                        <select class="form-control" id="block" name="block" required="required">
                                            <option value="-1">-select class--</option>
                                            <%
                                                try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                    Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                    String lis_inst_sql = "select  block_name from TBL_CLASS group by block_name";

                                                    ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_list_inst.next()) {
                                                    String id = rs_list_inst.getString("block_name");
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
                                        <!--</div>-->
                                    </div>  
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Class List</span>
                                        <!--<input type="text" name="classlist"  class="form-control" id="classlist" placeholder="Enter  class List">-->
                                        <select class="form-control" id="classlist" name="classlist" required="required">
                                            <option value="-1">-select class--</option>
                                            <%
                                                try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                    Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                    String lis_inst_sql = "select class_id, class_name from TBL_CLASS group by class_id,class_name";

                                                    ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_list_inst.next()) {
                                                    String classid = rs_list_inst.getString("class_id");
                                                    String classname = rs_list_inst.getString("class_name");
                                                    //cid;
                                            %>
                                            <option value="<%=classid%>"><%=classname%></option>
                                            <% } %>
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                        </select>
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Assign Date</span>
                                        <input class="form-control" id="assigndate" name="assigndate" placeholder="Enter Assign Date" type="date" required=""/>
                                        <!--                                                                                        <span class="input-group-addon">
                                                                                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                                                                                </span>-->
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-2 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Time From</span>
                                        <!--<input class="form-control" id="timeFrom" name="timeFrom" placeholder="Enter time from"  required=""/>-->
                                        <input type="text" id="timeFrom" name="timeFrom" pattern="([01]?[0-9]|2[0-3])(:[0-5][0-9]){1}" required="required" placeholder="hh:mm" />
                                    </div>
                                    <div class="form-group col-lg-2 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Time TO</span>
                                        <!--<input class="form-control" id="timeTo" name="timeTo" placeholder="Enter time to"  required=""/>-->
                                        <!--<input type="text" pattern="([01]?[0-9]|2[0-3])(:[0-5][0-9]){2}"  required="required" placeholder="hh:mm:ss" />--> 
                                        <input type="text" id="timeTo" name="timeTo" pattern="([01]?[0-9]|2[0-3])(:[0-5][0-9]){1}"  required="required" placeholder="hh:mm" /> 
                                    </div>
                                    <div class="form-group col-lg-12" > 
                                        <button type="submit" id="saveclass" class="btn btn-primary"><span class="fa fa-save"><strong>  Save info</strong></span></button>
                                    </div>
                                </form>
                                <form action="" method="POST">

                                    <div class="form-group col-lg-4 align-center" id="coursenamepop" onchange="showState()"> 
                                             Course Name
                                            <select class="form-control" name="courseID">
                                               <option value="-1">-select course-</option>
                                                <%
                                                    try {
                                                        //connectionManager dbconnection = new connectionManager();
                                                        Statement st_course = dbconnection.getconnection().createStatement();
                                                        String crs_sql = "select  COURSE_CODE, COURSE_NAME from TBL_COURSEASSIGNMENT group by COURSE_NAME,COURSE_CODE";

                                                        ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_cours.next()) {
                                                        String c_code = rs_cours.getString("COURSE_CODE");
                                                        String c_name = rs_cours.getString("COURSE_NAME");
                                                        //cid;
                                                %>
                                                <option value="<%=c_code%>"><%=c_name%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                      <!--<button type="submit" id="classstatus" class="btn btn-primary"><span class="fa fa-save"><strong>  Show info</strong></span></button>-->
                                    </div>     

                                    <div class="col-lg-12 align-center" >
                                               <a href="#" class="list-group-item active">
                                            Course Assigned
                                            <span class="badge">
                                                <% String instrname = request.getParameter("instructorname");%>
                                                <%                                              
//                                                    String instrname = request.getParameter("instructorname");
                                                    try {
                                                        //                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select COUNT(ACADEMIC_STAFF_ID) AS academicid  from TBL_CLASS_ASSIGN WHERE "
                                                                + "ACADEMIC_STAFF_ID='" +instrname+ "' GROUP by  ACADEMIC_STAFF_ID";

                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>

                                                <%    while (rs_list_inst.next()) {
                                                        String id = rs_list_inst.getString("academicid");
                                                        //cid;
                                                %>
                                                <%=id%>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </span>
                                        </a>
                                     </div>
                                     <div class="form-group col-lg-12" id="classname">
<!--                                        
                                        <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                        <a href="#" class="list-group-item">Morbi leo risus</a>-->

                                    </div>
                                    <div class="list-group col-lg-4">
                                        <a href="#" class="list-group-item active">
                                            Class Assign<span class="badge">
                                                <%
                                                    String strname=request.getParameter("instructorname");
                                                    try {
                                                        
                                                        //                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select COUNT(class_id) AS classid  from TBL_CLASS_ASSIGN WHERE "
                                                                + "ACADEMIC_STAFF_ID='" + strname + "' GROUP by  ACADEMIC_STAFF_ID";

                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>

                                                <%    while (rs_list_inst.next()) {
                                                        String id = rs_list_inst.getString("ACADEMIC_STAFF_ID");
                                                        //cid;
                                                %>
                                                <%=id%>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                        <a href="#" class="list-group-item">Morbi leo risus</a>

                                    </div>
                                    
                                </form>
                                <%
                                    session.setAttribute("ClassAssign", null);
                                    session.setAttribute("ClassNotAssign", null);
                                %>
                            </div>
                        </div>

                        <div class="form-group col-lg-12">
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">ClassInfoUpdate</span></a>
                            <div class="accordion-content default">
                                <!--update class assignment-->
                                <!--                                 <script type="text/javascript">
                                                        $('#edit_id').click(function ()
                                                        {
                                                            $("#editing_form").css('visibility', "visible");
                                                        });
                                                    </script>
                                -->

                                <%
                                    if (request.getParameter("action") != null && request.getParameter("id") != null) {
                                        String action = request.getParameter("action");
                                        String id = request.getParameter("id");
                                        if (action.equalsIgnoreCase("delete")) {
                                            //Alert="";
                                            ResultSet rs_delete = smt.executeQuery("delete from TBL_CLASS_ASSIGN where CLASSASSIGN_ID='" + id + "'");
                                            // if (rs_delete.next()) {

                                %>    
                                <div class="alert alert-success" id="">
                                    Successfully deleted
                                </div>        

                                <% } else if (action.equalsIgnoreCase("edit")) {
                                    ResultSet rs_edit = smt.executeQuery("select * from TBL_CLASS_ASSIGN where CLASSASSIGN_ID='" + id + "'");
                                    if (rs_edit.next()) {

                                %>

                                <div class="form-group">

                                    <p class="center-block" > <strong>Editing Class ID:  <%=rs_edit.getString("CLASSASSIGN_ID")%></strong> </p>
<!--                                    <form class="form-group" action="${ pageContext.request.contextPath }/CourseUpdateServlet" method="Post">
                                        <form class="form-group" action="../CommonOprations/EditCourse.jsp" method="Post">-->
                                    <form class="form-group"  method="Post" action="${ pageContext.request.contextPath }/ClassAssignUpdateServlet">

                                        <div class="form-group col-lg-4">
                                            CLASS ASSIGN ID:
                                            <input class="form-control" type="text" name="classassignID" value="<%=id%>" readonly/>
                                            <!--<input class="form-control" type="text" name="coursecode" value="CLASSASSIGN_ID" readonly/>-->
                                        </div>
                                        <div class="form-group col-lg-4">
                                            Academic Staff ID:
                                            <input class="form-control" type="text" name="acdstaffID" readonly value="<%=rs_edit.getString("ACADEMIC_STAFF_ID")%>" />
                                            <!--<select class="form-control" name="acdstaffID" readonly><option  value="<%=rs_edit.getString("ACADEMIC_STAFF_ID")%>"><%=rs_edit.getString("ACADEMIC_STAFF_ID")%></option></select>-->
                                            <!--<input class="form-control" type="text" name="coursecode" value="CLASSASSIGN_ID" readonly/>-->
                                        </div> 
                                        <div class="form-group col-lg-4">
                                            Course Name

                                            <select class="form-control" name="courseID"><option value="<%=rs_edit.getString("COURSE_CODE")%>"><%=rs_edit.getString("COURSE_CODE")%></option>
                                                <option value="-1">-select course-</option>
                                                <%
                                                    try {
                                                        //connectionManager dbconnection = new connectionManager();
                                                        Statement st_course = dbconnection.getconnection().createStatement();
                                                        String crs_sql = "select  COURSE_CODE, COURSE_NAME from TBL_COURSEASSIGNMENT group by COURSE_NAME,COURSE_CODE";

                                                        ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_cours.next()) {
                                                        String c_code = rs_cours.getString("COURSE_CODE");
                                                        String c_name = rs_cours.getString("COURSE_NAME");
                                                        //cid;
                                                %>
                                                <option value="<%=c_code%>"><%=c_name%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            Class Name
 <!--                                            <input class="form-control" type="text" name="courseID" value="<%=rs_edit.getString("COURSE_CODE")%>"/>
                                             <input class="form-control" type="text" name="courseID" value="<%=rs_edit.getString("COURSE_CODE")%>" />-->
                                            <select class="form-control" name="classID"><option value="<%=rs_edit.getString("CLASS_ID")%>"><%=rs_edit.getString("CLASS_ID")%></option>
                                                <option value="-1">-select class--</option>
                                                <%
                                                    try {
    //                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select class_id, class_name from TBL_CLASS group by class_id,class_name";

                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_list_inst.next()) {
                                                        String classid = rs_list_inst.getString("class_id");
                                                        String classname = rs_list_inst.getString("class_name");
                                                        //cid;
                                                %>
                                                <option value="<%=classid%>"><%=classname%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                               <!--<select class="form-control" name="classID"><option value="<%=rs_edit.getString("CLASS_ID")%>"><%=rs_edit.getString("CLASS_ID")%></option></select>-->
                                        </div>
                                        <div class="form-group col-lg-4">
                                            ASSIGN DATE
                                            <input class="form-control" type="date" name="assigndate" value="<%=rs_edit.getString("ASSIGN_DATE")%>"/>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            TIME FROM
                                            <input class="form-control" type="text" name="timeFrom" value="<%=rs_edit.getString("TIME_FROM")%>"/>

                                        </div>
                                        <div class="form-group col-lg-4">
                                            TIME TO
                                            <input class="form-control" type="text" name="timeTo" value="<%=rs_edit.getString("TIME_TO")%>"/>
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
                                <table id="tblcourseEdit" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0" >
                                    <thead>
                                        <tr>
                                            <th>ClassAssignID</th>
                                            <th>Class id</th>
                                            <th>Assign Date</th>
                                            <th>Time  From</th>
                                            <th>Time  To</th>
                                            <th><span class="glyphicon glyphicon-edit " style="color: goldenrod" >Edit</span></th>
                                            <th ><span class="glyphicon glyphicon-remove" style="color: red">Delete</span></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ClassAssignID</th>
                                            <th>Class ID</th>
                                            <th>Assign Date</th>
                                            <th>Time  From</th>
                                            <th>Time  To</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%
                                            //                                connectionManager dbconnection = new connectionManager();
                                            Statement st_linst_list = dbconnection.getconnection().createStatement();
                                            String linslist_sql = "select CLASSASSIGN_ID, CLASS_ID "
                                                    + "   ,ASSIGN_DATE , TIME_FROM ,TIME_TO  from TBL_CLASS_ASSIGN ";
                                            ResultSet rs_instr = st_linst_list.executeQuery(linslist_sql);
                                            while (rs_instr.next()) {
                                                String class_id = rs_instr.getString(1);
                                        %>
                                        <tr>
                <!--                            <td><%=rs_instr.getString(1)%></td> -->
                                            <td><%=class_id%></td> 
                                            <td><%=rs_instr.getString(2)%></td> 
                                            <td><%=rs_instr.getString(3)%></td> 
                                            <td><%=rs_instr.getString(4)%></td>
                                            <td><%=rs_instr.getString(5)%></td>
                                            <td>
                                                <form action="" method="POST">
                                                    <input type="hidden" name="action" value="edit"/>
                                                    <input type="hidden" name="id" id="edit_id" value="<%=rs_instr.getString(1)%>"/>

                                                    <button class="btn btn-warning glyphicon glyphicon-edit">Edit</button>
                                                </form>


                                            </td>
                                            <td>
                                                <form action="" method="post">
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="id" id="delete_id" value="<%=rs_instr.getString(1)%>"/>
                                                    <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid">Delete</button>
                                                </form></td>

                                        </tr>
                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>   
                    <!--end of accordion-->
                    <!--start table-->
                    <%    request.getSession().setAttribute("ClassAssign", null);
                        request.getSession().setAttribute("ClassNotAssign", null);
                    %>


                    <!--end table-->
                    
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
        <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
        <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <link href="../resources/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

        <script type="text/javascript">
            $().ready(function () {
                //                    var j = jQuery.noConflict();
                $('#tblcourseass').dataTable();
            });
            //

        </script>
        <script type="text/javascript">
            $().ready(function () {
                //                    var j = jQuery.noConflict();
                $('#tblcourseEdit').dataTable();
            });
            //

        </script> 
        <script type="text/javascript">
            $(function () {

                $("#instrAssign").validate({
                    rules: {

                        selectinstr: {
                            required: true
                                    //                    minlength: 8
                        },

                        dateassigned: {
                            required: true
                        },
                        program: {
                            required: true
                        },
                        course: {
                            required: true
                        },
                        totalH: {
                            required: true
                        },
                        durationFrom: {
                            required: true
                        },
                        durationTo: {
                            required: true
                        }
                    }
                });
            });

            //            $('#tblcourseass').dataTable();
        </script>
        <script type="text/javascript">


            $('input[type=date]').datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

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
                var url = ".../common/ClassAssignmentDetail.jsp";
                url += "?instructorname=" + str;
                
                 var url_course = ".../common/Courseselection.jsp";
                url_course += "?coursenamepop=" + str;
                
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }

            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("classname").innerHTML = xmlHttp.responseText
                }
            }
        </script>
    </body>
</html>
    
<form name="doublecombo">
    <p align="center">
        <select name="example" size="1" onchange="ChanGeValue()">
            <option value="1">A1</option>
            <option value="2">A2</option>
            <option value="3">A3</option>
            <option value="4">A4</option>
            <option value="5">A5</option>
        </select>
        <select name="stage2" size="1">
            <option value="1">A1</option>
            <option value="2">A2</option>
            <option value="3">A3</option>
            <option value="4">A4</option>
            <option value="5">A5</option>
        </select>
    </p>

    </body>
    <script>

        var temp = document.doublecombo.stage2
        function ChanGeValue() {
            var sel = document.doublecombo.example;
            var opt = sel.options[sel.selectedIndex].value;
            var txt = sel.options[sel.selectedIndex].text;
            temp.options[sel.selectedIndex].selected = true
        }
    </script>
</form>
