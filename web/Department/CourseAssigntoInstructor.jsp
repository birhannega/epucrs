<%-- 
    Document   : Course Registration LU
    Created on : 06-Mar-2017, 12:30:50
    Author     : Efrem
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!--<link rel="stylesheet" href="../css/jQuery.steps.css"-->
<%@include file="../common/imports.jsp" %>
<!--<link  rel="stylesheet" href="../bootstrap/DataTable/css/jquery.dataTables.min.css">-->
<body>
    <%
        int sid, cid;
    %>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
            <div class="col-lg-10">
                <div class="col-lg-12">
                    <!--                    <p class="text-primary page-header text-center"><strong>Course Assign to Instructor</strong></p>-->
                    <p class="text-primary text-center"><strong>Course Assign to Instructor</strong></p>
                    <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                    ${CourseAssigned}
                    ${CoursenotAssignment}
                    <form class="form-group " method="post" id="instrAssign" action="${pageContext.request.contextPath}//CourseAssignment">
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
                        <!--</form>--> 


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
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Assigned Date</span>
                                <input class="form-control" id="datepicker2" name="dateassigned" placeholder="Enter Assigned Date" type="date" required=""/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>


                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Program</span>
                                <select class="form-control" id="program" name="program" required="required">
                                    <option value="-1">-select department-</option>
                                    <%
                                        try {
                                            connectionManager dbconnection = new connectionManager();
                                            Statement st_list_course = dbconnection.getconnection().createStatement();
                                            String course_sql = "select DEPARTEMENT from TBL_ACADEMIC_STAFF_REG";

                                            ResultSet rs_courseinstr = st_list_course.executeQuery(course_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_courseinstr.next()) {
                                            String id = rs_courseinstr.getString("DEPARTEMENT");
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
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Course</span>
                                 <select class="form-control" id="course" name="course" required="required">
                                    <option value="-1">-select course-</option>
                                    <%
                                        try {
                                            connectionManager dbconnection = new connectionManager();
                                            Statement st_list_course = dbconnection.getconnection().createStatement();
                                            String course_sql = "select COURSE_NAME from TBL_COURSE_REGISTRATION";

                                            ResultSet rs_courseinstr = st_list_course.executeQuery(course_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_courseinstr.next()) {
                                            String id = rs_courseinstr.getString("COURSE_NAME");
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
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Credit Hour</span>
                                <input type="text" name="creditH"  class="form-control" id="creditH" placeholder="Enter Credit Hour">
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Modified Date</span>
                                <input class="form-control" id="datemodiied" name="datemodiied" placeholder="Enter Modified Date" type="date" required=""/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Modified By</span>
                                <input type="text" name="modifiedby"  class="form-control" id="modifiedby" placeholder="Enter Modifier">
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Period</span>
                                <input type="text" name="period"  class="form-control" id="period" placeholder="Enter Modifier">
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Previous Instructor</span>
                                <input type="text" name="previousinstructor"  class="form-control" id="previousinstructor" placeholder="Enter Previous Instructor">
                            </div>
                        </div>
                        <div class="form-group col-lg-12" > 
                            <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save info</strong></span></button>

                        </div>
                    </form>

                    <table id="tblcourseass" class="table table-striped table-bordered table-hover" width="100%" cellspacing="0" >
                        <thead>
                            <tr>
                                <th>Instructor Name</th>
                                <th>Assigned Date</th>
                                <th>Subject</th>
                                <th>Course Name</th>
                                <th>Credit Hour</th>
                                <th>Modified Date</th>
                                <th>Modified By</th>
                                <th>Period</th>
                                <th>Previous Instructor</th>
                                <th><span class="glyphicon glyphicon-edit">Edit</span></th>
                                <th ><span class="glyphicon glyphicon-remove">Delete</span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Instructor Name</th>
                                <th>Assigned Date</th>
                                <th>Subject</th>
                                <th>Course Name</th>
                                <th>Credit Hour</th>
                                <th>Modified Date</th>
                                <th>Modified By</th>
                                <th>Period</th>
                                <th>Previous Instructor</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <%
                                connectionManager dbconnection = new connectionManager();
                                Statement st_list_course = dbconnection.getconnection().createStatement();
                                String course_sql = "select * from TBL_COURSEASSIGNMENT";
                                ResultSet rs_courseinstr = st_list_course.executeQuery(course_sql);
                                while (rs_courseinstr.next()) {
                                    String id = rs_courseinstr.getString(1);
                            %>
                            <tr>
    <!--                            <td><%=rs_courseinstr.getString(1)%></td> -->
                                <td><%=id%></td> 
                                <td><%=rs_courseinstr.getString(2)%></td> 
                                <td><%=rs_courseinstr.getString(3)%></td> 
                                <td><%=rs_courseinstr.getString(4)%></td> 
                                <td><%=rs_courseinstr.getString(5)%></td> 
                                <td><%=rs_courseinstr.getString(6)%></td> 
                                <td><%=rs_courseinstr.getString(7)%></td> 
                                <td><%=rs_courseinstr.getString(8)%></td> 
                                <td><%=rs_courseinstr.getString(9)%></td> 
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

                    </form> 
                    <%    request.getSession().setAttribute("CourseAssigned", null);
                        request.getSession().setAttribute("CoursenotAssignment", null);
                    %>
                </div>
            </div>
        </div>
    </div>


    <script src="../bootstrap/DataTable/js/dataTables.bootstrap.min.js"></script>
    <script src="../bootstrap/DataTable/js/jquery.dataTables.min.js"></script>
    <!--<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
    <!--<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
    <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

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
                creditH: {
                    required: true
                },
                datemodified: {
                    required: true
                },
                modifiedby: {
                    required: true
                },
                period: {
                    required: true
                },
                previousinstructor: {
                    required: true
                }
            }
        });
    });
    $('#tblcourseass').dataTable();
</script>
<script type="text/javascript">
//    $("#datemodified").datepicker({
//        changeMonth: true,
//        changeYear: true
//                //dateFormat: 'yyyy-mm-dd'
//                //format:'yyyy-mm-dd'
//
//    });

    $('input[type=date]').datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true

    });

</script>