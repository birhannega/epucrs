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
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorProfile</span></a>
                            <div class="accordion-content default">
                                <form action="" method="POST">
                                    <!--<p class="text-primary text-center header"><strong> Instructor Profile</strong></p>-->
                                    <!--                                    <div class="form-group col-lg-4">
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon" style="color: #007fff">Search By</span>
                                                                                <select name="testdrop" class="form-control" id="testdrop"  required="required">
                                                                                    <option>-select criteria-</option>
                                                                                    <option>Instructor_ID</option>
                                                                                    <option>Instructor_Name</option>
                                                                                </select>
                                    
                                                                            </div>
                                                                        </div>
                                                                        <form role="search">
                                    
                                                                        <div class="form-group col-lg-8">
                                                                            <div class="input-group col-lg-4">
                                                                                <input type="text" class="form-control" placeholder="Search">
                                                                                <div class="input-group-btn">
                                                                                    <button type="submit" class="btn btn-default">
                                                                                        <span class="glyphicon glyphicon-search"></span>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
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
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                            <!--<label class="control-label" for="tclass" >----</label>-->
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
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
                                            <!--<label class="control-label" for="tclass" >----</label>-->
                                        </div>
                                    </div>
                                    <table id="tblcourseass" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0" >
                                        <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>Instructor Name</th>
                                                <th>STATUS</th>
                                                <th>Total Hour</th>
                                                <th>Police Management</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Title</th>
                                                <th>Instructor Name</th>
                                                <th>STATUS</th>
                                                <th>Total Hour</th>
                                                <th>Police Management</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <%
                                                connectionManager dbconnection = new connectionManager();
                                                Statement st_list_course = dbconnection.getconnection().createStatement();
                                                String course_sql = "select  Staff_Id,Title, First_Name || ' '|| Middle_Name || ' '|| LAST_NAME as FULL_NAME,departement,Phone, STATUS ,POLICE_MANAGEMENT from TBL_ACADEMIC_STAFF_REG ";
                                                ResultSet rs_courseinstr = st_list_course.executeQuery(course_sql);
                                                while (rs_courseinstr.next()) {
                                                    String id = rs_courseinstr.getString(1);
                                            %>
                                            <tr>
                    <!--                            <td><%=rs_courseinstr.getString(1)%></td> -->
                                                <!--<td><%=id%></td>--> 
                                                <td><%=rs_courseinstr.getString(2)%></td> 
                                                <td><%=rs_courseinstr.getString(3)%></td> 
                                                <td><%=rs_courseinstr.getString(4)%></td> 
                                                <td><%=rs_courseinstr.getString(5)%></td> 
                                                <td><%=rs_courseinstr.getString(6)%></td>

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
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">ClassInfo</span></a>
                            <div class="accordion-content">

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
                                        <!--</select>-->
                                        <%
                                            } catch (Exception e) {
                                                out.println("wrong selection!" + e);
                                            }
                                        %>
                                        <!--<label class="control-label" for="tclass" >----</label>-->
                                    </div>
                                </div>

                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="pull-center">Assigned Class New</span>
                                    <input type="text" name="assclassnew"  class="form-control" id="assclassnew" placeholder="Enter Assigned class">
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="pull-center">Assigned Class  Indoctrination</span>
                                    <input type="text" name="unassclassinf"  class="form-control" id="unassclassinf" placeholder="Enter Unassigned class">
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="pull-center">Assigned Class  Old</span>
                                    <input type="text" name="assnclsold"  class="form-control" id="assnclsold" placeholder="Enter Unassigned class">
                                    <!--</div>-->
                                </div> 
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="pull-center">UnAssigned Class  Old</span>
                                    <input type="text" name="unassclassold"  class="form-control" id="unassclassold" placeholder="Enter Unassigned class">
                                    <!--</div>-->
                                </div>   

                                <!--                                     
                                                                    </div>
                                                                    <div class="form-group col-lg-8">
                                                                        <label class="control-label col-lg-4" for="unassclass">Date :</label>
                                                                        <div class="col-lg-4">
                                                                            <input type="text" class="form-control" id="unassclass" placeholder="Enter Unassigned class">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group col-lg-8">
                                                                        <label class="control-label col-lg-4" for="unassclass">Time difference :</label>
                                                                        <div class="col-lg-4">
                                                                            <input type="text" class="form-control" id="unassclass" placeholder="Enter Unassigned class">
                                                                        </div>
                                                                    </div>-->
                                <!--                                    <div class="form-group">
                                                                        <div class="col-lg-4">
                                                                            <button type="submit" class="btn btn-default">Submit</button>
                                                                        </div>
                                                                    </div>-->

                                <form class="" method="post" id="instrAssign" action="${pageContext.request.contextPath}//CourseAssignment">

                                    <div class="col-lg-12" ><p class="text-primary text-center header "><strong> Class Assignment</strong></p></div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Instructor Name</span>
                                        <!--<input type="text" name="instructorname"  class="form-control" id="instructorname" placeholder="Enter Unassigned class">-->
                                        <select class="form-control" id="instructorname" name="instructorname" required="required">
                                            <option value="-1">-select instructor-</option>
                                            <%
                                                try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                    Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                    String lis_inst_sql = "select staff_id, FIRST_NAME ||  ' ' ||  MIDDLE_NAME  || ' ' || LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";

                                                    ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_list_inst.next()) {
                                                    String id = rs_list_inst.getString("FULL_NAME");
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
                                        <span class="pull-center">Location</span>
                                        <!--<input type="text" name="Location"  class="form-control" id="Location" placeholder="Enter Unassigned class">-->
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
                                        <select class="form-control" id="classlist" name="classlist" required="required">
                                            <option value="-1">-select class--</option>
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
                                        <input class="form-control" id="assigndate" name="date_registered" placeholder="Enter Assign Date" type="date" required=""/>
                                        <!--                                                                                        <span class="input-group-addon">
                                                                                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                                                                                </span>-->
                                        <!--</div>-->
                                    </div>
                                         <div class="form-group col-lg-2 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Time From</span>
                                        <input class="form-control" id="assigndate" name="date_registered" placeholder="Enter time from"  required=""/>
                                    </div>
                                         <div class="form-group col-lg-2 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Time TO</span>
                                        <input class="form-control" id="assigndate" name="date_registered" placeholder="Enter time to"  required=""/>
                                    </div>
                                    <div class="form-group col-lg-12" > 
                                        <button type="submit" id="saveclass" class="btn btn-primary"><span class="fa fa-save"><strong>  Save info</strong></span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="form-group col-lg-12">
                            <a class="accordion-toggle"><span class="glyphicon glyphicon-list">InstructorAssignment</span></a>
                            <div class="accordion-content">
                                <form class="form-group " role="form" method="post" id="instrAssign"  action="${pageContext.request.contextPath}//CourseAssignment">
                                    <!--                                    <div class="form-group col-lg-4">
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon" style="color: #007fff">Search By</span>
                                                                                <select name="testdrop" class="form-control" id="testdrop"  required="required">
                                                                                    <option>-select criteria-</option>
                                                                                    <option>Instructor_ID</option>
                                                                                    <option>Instructor_Name</option>
                                                                                </select>
                                    
                                                                            </div>
                                                                        </div>
                                                                        <form role="search">
                                                                        <div class="form-group col-lg-8">
                                                                            <div class="input-group col-lg-4">
                                                                                <input type="text" class="form-control" placeholder="Search">
                                                                                <div class="input-group-btn">
                                                                                    <button type="submit" class="btn btn-default">
                                                                                        <span class="glyphicon glyphicon-search"></span>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
                                    <!--</form>--> 


                                    <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon">Instructor Name</span>
                                            <select class="form-control" id="selectinstr" name="selectinstr" required="required">
                                                <option value="-1">-select instructor-</option>
                                                <%
                                                    try {
//                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select staff_id, FIRST_NAME ||  ' ' ||  MIDDLE_NAME  || ' ' || LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";

                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_list_inst.next()) {
                                                        String id = rs_list_inst.getString("FULL_NAME");
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
                                            <span class="input-group-addon">CourseName</span>
                                            <select class="form-control" id="course" name="course" required="required">
                                                <option value="-1">-select course-</option>
                                                <%
                                                    try {
                                                        //connectionManager dbconnection = new connectionManager();
                                                        Statement st_course = dbconnection.getconnection().createStatement();
                                                        String crs_sql = "select COURSE_NAME from TBL_COURSE_REGISTRATION";

                                                        ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_cours.next()) {
                                                        String id = rs_cours.getString("COURSE_NAME");
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
                                                <option value="-1">-select round-</option>
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
                                    <div class="form-group col-lg-4 has-success">
                                        <div class="input-group">
                                            <span class="input-group-addon pull-center">Location</span>
                                            <!--<input type="text" name="Location"  class="form-control" id="Location" placeholder="Enter Unassigned class">-->
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
                                            <span class="input-group-addon pull-center">Block</span>
                                            <!--<input type="text" name="Block"  class="form-control" id="Block" placeholder="Enter Unassigned class">-->
                                            <select class="form-control" id="classlist" name="classlist" required="required">
                                                <option value="-1">-select class--</option>
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
                                            <span class="input-group-addon pull-center">Class List</span>
                                            <!--<input type="text" name="classlist"  class="form-control" id="classlist" placeholder="Enter  class List">-->
                                            <select class="form-control" id="classlist" name="classlist" required="required">
                                                <option value="-1">-select class--</option>
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
                                <div class="list-group col-lg-4">
                                    <a href="#" class="list-group-item active">
                                        Subject Info/Total Course
                                        <span class="badge">6</span>
                                    </a>
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                                </div>
                                <div class="list-group col-lg-4">
                                    <a href="#" class="list-group-item active">
                                        Course Assign<span class="badge">7</span>
                                    </a>
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                                </div>
                                <div class="list-group col-lg-4">
                                    <a href="#" class="list-group-item active">
                                        Period Schedule<span class="badge">3</span>
                                    </a>
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                                </div>

                            </div>

                        </div>
                    </div>   
                    <!--end of accordion-->
                    <!--start table-->
                    <%    request.getSession().setAttribute("instructorAssigned", null);
                        request.getSession().setAttribute("instructorNotAssigned", null);
                    %>

                    <table id="tblcourseEdit" class="table table-striped table-bordered table-hover" width="100%" cellspacing="0" >
                        <thead>
                            <tr>
                                <!--                                <th>Instructor ID</th>
                                                                <th>Course ID</th>-->
                                <th>Instructor Name</th>
                                <th>Corse Name</th>
                                <th>Assigned Date</th>
                                <th>Round</th>
                                <th>Total Hour</th>
                                <th>Duration Date From</th>
                                <th>Duration Date To</th>
                                <th><span class="glyphicon glyphicon-edit">Edit</span></th>
                                <th ><span class="glyphicon glyphicon-remove">Delete</span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <!--                                <th>Instructor ID</th>
                                                                <th>Course ID</th>-->
                                <th>Instructor Name</th>
                                <th>Corse Name</th>
                                <th>Assigned Date</th>
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
                                <!--<td><%=rs_instr.getString(2)%></td>--> 
                                <td><%=rs_instr.getString(3)%></td> 
                                <td><%=rs_instr.getString(4)%></td> 
                                <td><%=rs_instr.getString(5)%></td> 
                                <td><%=rs_instr.getString(6)%></td> 
                                <td><%=rs_instr.getString(7)%></td> 
                                <td><%=rs_instr.getString(8)%></td> 
                                <td><%=rs_instr.getString(9)%></td> 
                                <td>
                                    <form action="" method="Get">
                                        <input type="hidden" name="edit_id_inst" value="<%=id%>"/>

                                        <button class="btn btn-warning">Edit</button>
                                    </form>


                                </td>
                                <td>
                                    <form action="" method="post">
                                        <input type="hidden" name="delete_id_inst" value="<%=id%>"/>
                                        <button class="btn btn-danger" id="deleteid">Delete</button>
                                    </form></td>

                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
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
    </body>
</html>
