<%
    if(session.getAttribute("dpt")==null)
{
 response.sendRedirect("../index.jsp");
}
    else {
       
%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Registrar Add-user</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
        <%  connectionManager connnmgr = new connectionManager();
            Connection con = connnmgr.getconnection();
            Statement stmt = con.createStatement();
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

                    <p class="page-header text-primary text-right ">Welcome:<%=session.getAttribute("dpt").toString()%></p>
                    <!-- HTML -->
                    <div id="accordion">
<!--                        <div class="form-group col-lg-12">
                            <span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorProfile</span></a>
                            <div class="accordion-content default">
                                <form action="" method="POST">
                                   
                                    <div class="form-group col-lg-8">
                                        <label class="control-label col-lg-4" for="tclass">Total Instructor:</label>
                                        <div class="col-lg-4">
                                            <%
                                                try {
                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement stm_class = dbconnection.getconnection().createStatement();
                                                    String course_sql = "select count(*) as cnt_inst from tbl_academic_staff_reg";

                                                    ResultSet rs_class = stm_class.executeQuery(course_sql);

                                            %>

                                            <%    while (rs_class.next()) {
                                                    String cnt_instructor = rs_class.getString("cnt_inst");
                                                    //cid;
                                            %>
                                            <label class="control-label" for="tclass" ><%=cnt_instructor%></label>
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
                                    <div class="form-group col-lg-8">
                                        <label class="control-label col-lg-4" for="tclass">Unassigned Instructor:</label>
                                        <div class="col-lg-4">
                                            <%
                                                try {
                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement stm_class = dbconnection.getconnection().createStatement();
                                                    String inst_sql = "select count(*) as cnt_inst from tbl_academic_staff_reg";

                                                    ResultSet rs_class = stm_class.executeQuery(inst_sql);

                                            %>

                                            <%    while (rs_class.next()) {
                                                    String cnt_instructor = rs_class.getString("cnt_inst");
                                                    //cid;
                                            %>
                                            <label class="control-label" for="tclass" ><%=cnt_instructor%> were found</label>
                                            <% } %>
                                            </select>
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                    
                                            <%
                                                connectionManager dbconnection = new connectionManager();
                                                Statement st_list_course = dbconnection.getconnection().createStatement();
                                                String course_sql = "select  ACADEMIC_STAFF_ID,Title, First_Name || ' '|| Middle_Name || ' '|| LAST_NAME as FULL_NAME,department,Phone,POLICE_MANAGEMENT,STATUS from TBL_ACADEMIC_STAFF_REG ";
                                                ResultSet rs_courseinstr = st_list_course.executeQuery(course_sql);
                                                while (rs_courseinstr.next()) {
                                                    String id = rs_courseinstr.getString(1);
                                            %>
                                         
                                            <%
                                                }
                                            %>

                                        </tbody>
                                    </table>


                                </form>
                            </div>
                        </div>-->


                        <div class="form-group col-lg-12">
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorAssignment</span></a>
                            <div class="accordion-content">
                                ${instructorAssigned}
                                ${instructorNotAssigned}
                                ${crslistSave}
                                ${crslistNotSave}
                                ${crslistNotValid}
                                
                                       <div class="container-fluid">            
                                    <div class="list-group col-lg-4">
                                        <a href="#" class="list-group-item active">
                                            Assigned Course
                                            <!--<span class="badge">6</span>-->
                                              <%
                                                try {
//                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement stm_class = dbconnection.getconnection().createStatement();
                                                    String crs_sql = "select count(COURSE_CODE) as cnt_inst from TBL_COURSEASSIGNMENT";

                                                    ResultSet rs_class = stm_class.executeQuery(crs_sql);

                                            %>

                                            <%    while (rs_class.next()) {
                                                    String cnt_instructor = rs_class.getString("cnt_inst");
                                                    //cid;
                                            %>
                                            <!--<label class="control-label" for="tclass" ><%=cnt_instructor%></label>-->
                                            <span class="badge"><%=cnt_instructor%></span>
                                            <% } %>
                                            </select>
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                        </a>
                                        <!--                                    <a href="#" class="list-group-item" >test</a>
                                                                            <a href="#" class="list-group-item">Morbi leo risus</a>-->

                                    </div>
                                    <div class="list-group col-lg-4">
                                        <a href="#" class="list-group-item active">
<!--                                            Subject Info/Dep/Program -->
                                                Assigned Instructor
                                            <!--<span class="badge">7</span>-->
                                            <%
                                                try {
//                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement stm_class = dbconnection.getconnection().createStatement();
                                                    String crs_sql = "select distinct count(ACADEMIC_STAFF_ID) as cnt_inst from TBL_COURSEASSIGNMENT";

                                                    ResultSet rs_class = stm_class.executeQuery(crs_sql);

                                            %>

                                            <%    while (rs_class.next()) {
                                                    String cnt_instructor = rs_class.getString("cnt_inst");
                                                    //cid;
                                            %>
                                            <!--<label class="control-label" for="tclass" ><%=cnt_instructor%></label>-->
                                            <span class="badge"><%=cnt_instructor%></span>
                                            <% } %>
                                            </select>
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                        </a>
                                        <!--                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                                                            <a href="#" class="list-group-item">Morbi leo risus</a>-->

                                    </div>
                                    <div class="list-group col-lg-4">
                                        <a href="#" class="list-group-item active">
                                            Period Schedule <span class="badge">3</span>
                                        </a>
                                        <!--                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                                                            <a href="#" class="list-group-item">Morbi leo risus</a>-->
                                    </div>
                                </div>
                                <form class="form-group " role="form" method="post" id="instrAssign"  action="${pageContext.request.contextPath}//CourseAssignment">

                                    <div class="form-group col-lg-6 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="cursor: zoom-out">Instructor Name</span>
                                            <select class="form-control" id="selectinstr" name="selectinstr" required="required" onchange="showAssignCourse(this.value)">
                                                <option value="-1">-select instructor-</option>
                                                <%
                                                    try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select ACADEMIC_STAFF_ID, FIRST_NAME ||' '||  MIDDLE_NAME  ||' '|| LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";
                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_list_inst.next()) {
                                                        String staffid = rs_list_inst.getString("ACADEMIC_STAFF_ID");
                                                        String staffname = rs_list_inst.getString("FULL_NAME");
                                                        //cid;
%>
                                                <option value="<%=staffid%>"><%=staffname%></option>
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
                                             <div class="form-group col-lg-6 has-success">  
                                            <span>Department</span>
                                            <select name="department" id="department"  class="form-control" onchange="showState(this.value)" >
                                                <option value="">select department</option>
                                                <%
//                                                    connectionManager connnmgr = new connectionManager();
//                                                    Connection con = connnmgr.getconnection();
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
                                    
                                         <div class="form-group col-lg-6 has-success">  
                                            <span class="has-success">Program</span>

                                            <select name="program" id="program" class="form-control has-success" onchange="showStateCourse(this.value)">

                                                <option value="">select program</option> 

                                            </select>
                                        </div>
                                         <div class="form-group col-lg-6 has-success">  
                                            <span class="has-success">Course Name</span>

                                            <select name="course" id="course" class="form-control has-success">

                                                <option value="">select course</option> 

                                            </select>
                                        </div>
                                 
                                            
                                             <p class=" col-lg-12 page-header text-primary text-center">select common Fields</p> 
                                     <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon">Assigned Date</span>
                                            <input class="form-control" id="datepicker2" name="dateassigned" placeholder="Enter Assigned Date" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>


                                    <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon">Round</span>
                                            <select class="form-control" id="round" name="round" required="required">
                                                <option value="">-select round-</option>
                                                <%
                                                    try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_program = dbconnection.getconnection().createStatement();
                                                        String program_sql = "select round_name from lu_round";

                                                        ResultSet rs_program = st_program.executeQuery(program_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_program.next()) {
                                                        String id = rs_program.getString("round_name");
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

                                    <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon">Total Hour</span>
                                            <input type="text" name="totalH"  class="form-control" id="totalH" placeholder="Enter Total Hour">
                                        </div>
                                    </div>
                                    <!--                                    <div class="form-group col-lg-4 has-success">
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon pull-center">Location</span>
                                                                                <input type="text" name="Location"  class="form-control" id="Location" placeholder="Enter Unassigned class">
                                                                                <select class="form-control" id="classlist" name="classlist" required="required">
                                                                                    <option value="-1">-select class--</option>
                                    <%
                                        try {
                                            //                                                        connectionManager dbconnection = new connectionManager();
                                            Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                            String lis_inst_sql = "select  location from TBL_CLASS";

                                            ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_list_inst.next()) {
                                            String id = rs_list_inst.getString("location");
                                            //cid;
%>
                                                                                                                                                                                                        <option><%=id%></option>
                                    <% } %>
                                    </select>
                                    <%
                                        } catch (Exception e) {
                                            out.println("wrong selection!" + e);
                                        }
                                    %>
                           
                                    <%
                                        try {
                                            //                                                        connectionManager dbconnection = new connectionManager();
                                            Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                            String lis_inst_sql = "select  block_name from TBL_CLASS";

                                            ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_list_inst.next()) {
                                            String id = rs_list_inst.getString("block_name");
                                            //cid;
%>
                                                                                                                                                                                                        <option><%=id%></option>
                                    <% } %>
                                    </select>
                                    <%
                                        } catch (Exception e) {
                                            out.println("wrong selection!" + e);
                                        }
                                    %>
                               
                                    <%
                                        try {
                                            //                                                        connectionManager dbconnection = new connectionManager();
                                            Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                            String lis_inst_sql = "select  class_name from TBL_CLASS";

                                            ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_list_inst.next()) {
                                            String id = rs_list_inst.getString("class_name");
                                            //cid;
%>
                                                                                                                                                                                                        <option><%=id%></option>
                                    <% } %>
                                    </select>
                                    <%
                                        } catch (Exception e) {
                                            out.println("wrong selection!" + e);
                                        }
                                    %>
                                </select>
                            </div>
                        </div>-->

                                    <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon">Duration Date From</span>
                                            <input class="form-control" id="durationFrom" name="durationFrom" placeholder="Enter Duration Date From" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon">Duration Date To</span>
                                            <input class="form-control" id="durationTo" name="durationTo" placeholder="Enter Duration Date To" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-12" > 
                                        <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save info</strong></span></button>

                                    </div>
                                </form>
                                <%    request.getSession().setAttribute("instructorAssigned", null);
                                    request.getSession().setAttribute("instructorNotAssigned", null);
                                %>
                                <div class="container-fluid">
                                <div class="form-group col-lg-4 align-center"> 
                                   <p class="page-header text-primary text-center">Select Instructor for Assignment</p> 
                                    <select class="form-control" name="courseAssname" id="courseAssname" onchange="showAssignState(this.value)">
                                        <option value="-1">-select instructor-</option>
                                        <%
                                            try {
                                                //connectionManager dbconnection = new connectionManager();
                                                Statement st_course = dbconnection.getconnection().createStatement();
//                                                String crs_sql = "select  COURSE_CODE from TBL_COURSE_LIST group by COURSE_CODE";
                                                String crs_sql = "select ACADEMIC_STAFF_ID, FIRST_NAME ||' '||  MIDDLE_NAME  ||' '|| LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";
                                                
                                                ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                        %>
                                        //                                                                        
                                        <%    while (rs_cours.next()) {
                                                String a_id = rs_cours.getString("ACADEMIC_STAFF_ID");
                                                String a_name = rs_cours.getString("FULL_NAME");
                                                //cid;
%>
                                        <option value="<%=a_id%>"><%=a_name%></option>
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
                                 <!--display instructor info-->
                                <div class="form-group col-lg-12 container-fluid" id="crsassignintr">


                                </div>
                               
                               <!--select course-->
                               
                            </div>

                        </div>
                    </div>   
                    <!--end of accordion-->
                    <!--start table-->
                    <%    request.getSession().setAttribute("instructorAssigned", null);
                        request.getSession().setAttribute("instructorNotAssigned", null);
                    %>
                     <%    request.getSession().setAttribute("crslistSave", null);
                        request.getSession().setAttribute("crslistNotSave", null);
                         request.getSession().setAttribute("crslistNotValid", null);
                    %>
                
                    <!--update course assignment-->
                    ${CrsAssUpdate}
                    ${CrsAssNotUpdate}
                    <%
                        if (request.getParameter("action") != null && request.getParameter("id") != null) {
                            String action = request.getParameter("action");
                            String id = request.getParameter("id");
                            if (action.equalsIgnoreCase("delete")) {
                                //Alert="";
                                ResultSet rs_delete_update = stmt.executeQuery("delete from TBL_COURSEASSIGNMENT where COURSEASSIGNMENT_SEQNO='" + id + "'");
//                                if (rs_delete_update.next()) {

                    %>    
                    <!--                    <div class="alert alert-success" id="">
                                            Successfully deleted
                                        </div>  -->


                    <% } else if (action.equalsIgnoreCase("edit")) {
                        ResultSet rs_edit_update = stmt.executeQuery("select * from TBL_COURSEASSIGNMENT where COURSEASSIGNMENT_SEQNO='" + id + "'");
                        if (rs_edit_update.next()) {

                    %>
                    <div class="form-group">
                        <form class="form-group " role="form" method="post" id="instrAssign"  action="${pageContext.request.contextPath}//CourseAssignmentUpdateServlet">
                         <div class="form-group col-lg-4 has-success">
                                <!--<div class="input-group">-->
                                <span class="" style="font-weight: bolder">Course Code</span>
                                <input type="text" name="crsnameupdate"  class="form-control" id="crsnameupdate" placeholder="Enter Course Coder" value="<%=rs_edit_update.getString("COURSE_CODE")%>">
                                <!--</div>-->
                            </div>
                           
                            <div class="form-group col-lg-4 has-success">
                                <div class="input-group">
                                    <span class="" style="font-weight: bolder">Assigned Date</span>
                                    <input class="form-control" id="datepicker2" name="dateassignedupdate" placeholder="Enter Assigned Date" type="date" required="" value="<%=rs_edit_update.getString("ASSIGN_DATE")%>"/>
                                    <!--                                    <span class="input-group-addon">
                                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                                        </span>-->
                                </div>
                            </div>


                            <div class="form-group col-lg-4 has-success">
                                <!--<div class="input-group">-->
                                <span class="" style="font-weight: bolder">Round</span>
                                <select class="form-control" id="round" name="roundupdate" required="required">
                                    <option class="" value="<%=rs_edit_update.getString("ROUND")%>"> <%=rs_edit_update.getString("ROUND")%></option>
                                    <option value="">-select round-</option>
                                    <%
                                        try {
//                                                        connectionManager dbconnection = new connectionManager();
                                            Statement st_program = dbconnection.getconnection().createStatement();
                                            String program_sql = "select round_name from lu_round";

                                            ResultSet rs_program = st_program.executeQuery(program_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_program.next()) {
                                            String rn = rs_program.getString("round_name");
                                            //cid;
%>
                                    <option value="<%=rn%>"><%=rn%></option>
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
                                <span class="" style="font-weight: bolder">Total Hour</span>
                                <input type="text" name="totalHupdate"  class="form-control" id="totalH" placeholder="Enter Total Hour" value="<%=rs_edit_update.getString("TOTAL_HOUR")%>">
                                <!--</div>-->
                            </div>
                            <div class="form-group col-lg-4 has-success">
                                <!--<div class="input-group">-->
                                <span class="" style="font-weight: bolder">Duration Date From</span>
                                <input class="form-control" id="durationFrom" name="durationFromupdate" placeholder="Enter Duration Date From" type="date" required="" value="<%=rs_edit_update.getString("DURATION_FROM")%>"/>

                            </div>
                            <div class="form-group col-lg-4 has-success">
                                <div class="input-group">
                                    <span class="" style="font-weight: bolder">Duration Date To</span>
                                    <input class="form-control" id="durationTo" name="durationToupdate" placeholder="Enter Duration Date To" type="date" required="" value="<%=rs_edit_update.getString("DURATION_TO")%>"/>

                                </div>
                            </div>
                            <div class="form-group col-lg-4 has-success" hidden="">
                                <div class="input-group ">
                                    <span class="">SeqNo</span>
                                    <input class="form-control" id="crsseqno" name="crsseqno" readonly="" value="<%=rs_edit_update.getString("COURSEASSIGNMENT_SEQNO")%>">
                                </div>
                            </div>
                            <div class="form-group col-lg-12" > 
                                <button type="submit" id="tnsaveinst" class="btn btn-success"><span class="fa fa-save"><strong>  Update info</strong></span></button>

                            </div>
                        </form>
                    </div>


                    <%}
                            }
                        }
                    %>

                    <%    request.getSession().setAttribute("CrsAssUpdate", null);
                        request.getSession().setAttribute("CrsAssNotUpdate", null);
                    %>
                    <div class="table table-responsive">
                    <table id="tblcourseEdit" class="table table-striped table-bordered table-hover" width="100%" cellspacing="0" >
                        <thead>
                            <tr>
                                <!--                                <th>Instructor ID</th>
                                                                <th>Course ID</th>-->
                                <th>Course ID</th>
                                <th>Round</th>
                                <th>Total Hour</th>
                                <th>Duration Date From</th>
                                <th>Duration Date To</th>
                                <th><span class="glyphicon glyphicon-edit" style="color: gold">Edit</span></th>
                                <th ><span class="glyphicon glyphicon-remove" style="color: red">Delete</span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <!--                                <th>Instructor ID</th>
                                                                <th>Course ID</th>-->
                                <th>Course Name</th>
                                <th>Round</th>
                                <th>Total Hour</th>
                                <th>Duration Date From</th>
                                <th>Duration Date To</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <%
//                                connectionManager dbconnection = new connectionManager();
                                Statement st_linst_list = dbconnection.getconnection().createStatement();
                                String linslist_sql = "select * from TBL_COURSEASSIGNMENT";
                                ResultSet rs_instr = st_linst_list.executeQuery(linslist_sql);
                                while (rs_instr.next()) {
                                    String id = rs_instr.getString(1);
                            %>
                            <tr>
    <!--                            <td><%=rs_instr.getString(1)%></td> -->
                                <!--<td><%=id%></td>--> 
                                <td><%=rs_instr.getString(2)%></td> 
                                <!--<td><%=rs_instr.getString(3)%></td>--> 
                                <td><%=rs_instr.getString(4)%></td> 
                                <td><%=rs_instr.getString(5)%></td> 
                                <td><%=rs_instr.getString(6)%></td> 
                                <td><%=rs_instr.getString(7)%></td> 
                                <td>
                                    <form action="" method="post">
                                        <input  type="hidden" name="action" value="edit"/>
                                        <input type="hidden" name="id" id="edit_id" value="<%=rs_instr.getString(8)%>"/>

                                        <button class="btn btn-warning glyphicon glyphicon-edit" id="edit_id">Edit</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="" class="form-group" method="Post" >
                                        <input type="hidden" name="action" value="delete"/>
                                        <input type="hidden" name="id" id="delete_id" value="<%=rs_instr.getString(8)%>"/>

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
                        programassign:{
                                 required: true
                        },
                        department:{
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
     
    function showAssignState(str) {
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp == null) {
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var urlass = ".../common/CourseAssignInstSelect.jsp";
                urlass += "?courseAssname=" + str;
       
                xmlHttp.onreadystatechange = crsassignSelect;
                xmlHttp.open("GET", urlass, true);
                xmlHttp.send(null);
            }
            function crsassignSelect() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
//                    document.getElementById("program").innerHTML = xmlHttp.responseText
                    document.getElementById("crsassignintr").innerHTML = xmlHttp.responseText
                }
            }
        </script>
        <script type="text/javascript">
             var xmlHttp;
             function showAssignCourse(str) {
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp == null) {
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var urlass = ".../common/CourseAssignInstSelect.jsp";
                urlass += "?selectinstr=" + str;
    
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", urlass, true);
                xmlHttp.send(null);
            }
            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
//                    document.getElementById("program").innerHTML = xmlHttp.responseText
                    document.getElementById("crsassignintr").innerHTML = xmlHttp.responseText
                }
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
        <script  type="text/javascript">

            var xmlHttp;
            function showStateCourse(str) {
                if (typeof XMLHttpRequest != "undefined") {
                    xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp == null) {
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var url = ".../common/CoursePopulate.jsp";
                url += "?program=" + str;
                xmlHttp.onreadystatechange = listcourse;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }

            function listcourse() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    document.getElementById("course").innerHTML = xmlHttp.responseText
                }
            }
        </script>
        
        <script type="text/javascript">
            function myFunction() {
                // Declare variables
                var input, filter, ul, li, a, i;
                input = document.getElementById('myInput');
                filter = input.value.toUpperCase();
                ul = document.getElementById("myUL");
                li = ul.getElementsByTagName('li');

                // Loop through all list items, and hide those who don't match the search query
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("a")[0];
                    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
        </script>

    </body>
</html>
<%}%>