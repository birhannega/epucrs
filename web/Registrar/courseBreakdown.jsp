
<%@page import="Model.CourseManagement"%>
<%@page import="Model.CourseAssignmentModel"%>
<%@page import="Model.Events"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <title>course breakdown</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>

    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">
                <%@include file="sidemenu.jsp" %>
            </div>

            <!-- Main Content -->

            <div class="side-body">
                <div class="container-fluid">
                    <div class="text-info">
                        <h2>Course break down form</h2>     
                    </div>

                    <%
                        connectionManager dbconnection = new connectionManager();
                        Connection connection = dbconnection.getconnection();
                        Statement St_department = connection.createStatement();
                        ResultSet rs_dep = St_department.executeQuery("select * from TBL_DEPARTMENT");
                        String department_name = null;
                        String dep_id = null, term_name, term_id;
                    %>
                    <div class="col-lg-12">
                        ${message} 
                        <form class="form-group" method="post"  action="${pageContext.request.contextPath}/breakDownCourses">
                            <div class="form-group col-sm-6">
                                <label>Select Department</label>
                                <select name="department" id="department"  class="form-control" onchange="showprogram(this.value)" required="" >
                                    <option value="">Select department</option>
                                    <%
                                        while (rs_dep.next()) {
                                            department_name = rs_dep.getString("DEP_NAME");
                                            dep_id = rs_dep.getString("DEP_ID");
                                    %>
                                    <option value="<%=dep_id%>"><%=department_name%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="form-group col-sm-6">
                                <label>Select program</label>
                                <select class="form-control" name="program" id="program" onchange="showcourse(this.value)" required="">
                                    <option value="">select program</option> 

                                </select>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Select course</label>
                                <select name="course" id="course" class="form-control" required="">
                                    <option value="">select course</option> 
                                </select>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Select term</label>
                                <select class="form-control" name="term" required="">
                                    <option value="">Select term</option>
                                    <%
                                        Statement St_term = connection.createStatement();
                                        ResultSet rs_term = St_term.executeQuery("select distinct term_NAME,term_id from Lu_term order by term_name");
                                    %>
                                    <%
                                        while (rs_term.next()) {
                                            term_name = rs_term.getString("TERM_NAME");
                                            term_id = rs_term.getString("term_id");
                                    %>
                                    <option value="<%=term_id%>"><%=term_name%></option>
                                    <%
                                        }
                                    %>
                                    <option></option>
                                </select>
                            </div>
                          
                            <div class="form-group  col-sm-6 pull-right">

                                <input type="reset" class="btn btn-danger " value="Reset form">
                                <input type="submit" class="btn btn-primary " value="Save">
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-12">
                        <p class="lead text-info text-left ">Course breakdown list of  
                            <%
                                Events getyear = new Events();
                                String year = getyear.getActiveyear();

                                out.print(year);
                            %> </p>
                    </div>
                            <%
                                ResultSet rs_deps = St_department.executeQuery("select * from TBL_DEPARTMENT");
                                while (rs_deps.next()) {
                                    department_name = rs_deps.getString("DEP_NAME");
                                    dep_id = rs_deps.getString("DEP_ID");

                            %>
                            <div class="col-lg-12">
                                <pre><%=department_name%></pre></div>

                    <%
                        Statement st_list_program = connection.createStatement();
                        String get_prog_sql = "select * from TBL_ACADEMIC_PROGRAM where dep_id='" + dep_id + "'";
                        ResultSet rs_program_list = st_list_program.executeQuery(get_prog_sql);
                        while (rs_program_list.next()) {
                    %>
                    <p class="page-header text-info"><strong>
                            <%
                                out.print(rs_program_list.getString("PROGRAM_NAME"));
                            %>
                        </strong>
                    </p>
                    <div class="col-lg-6">
                        <p class="text-primary "> <strong> First term</strong></p>
                        <table class=" table table-condensed table-striped table-bordered">
                            <thead>
                            <th>course ID</th>
                            <th>course Name</th>
                            <th>credit hours </th>
                            
                            </thead>
                            <%
                                String progid = rs_program_list.getString("program_id");

                                //                                Get courses of each department
                                Statement st_list_course = connection.createStatement();
                                ResultSet rs_list_course = st_list_course.executeQuery("select * from TBL_COURSE_BREAKDOWN where term_id=1 and program_id='" + progid + "'  ");
                                // out.println("<p class='text-info'> Course breakdown not done</p>");
                                while (rs_list_course.next()) {
                            %> 
                            <tr>
                                <td>
                                    <%
                                        String coourseID=rs_list_course.getString("course_id");
                                        out.print(rs_list_course.getString("course_id"));
                                        CourseManagement coursenfo=new CourseManagement();
                                    %>
                                </td>
                               
                                <td>
                                    <%
                                        
                                        String coursename=coursenfo.getcoursname(coourseID);
                                        out.print(coursename);
                                    %>
                                </td>
                                 <td>
                                    <%
                                        
                                        String credit=coursenfo.getcourcredit(coourseID);
                                        out.print(credit);
                                    %>
                                </td>
                            </tr>

                            <%  }
                            %>
                        </table>
                    </div>

                    <div class="col-lg-6">
                        <p class="text-primary"><strong> Second term</strong></p>
                        <table class=" table table-condensed">
                            <thead>
                            <th>course ID</th>
                            <th>credit hours </th>
                            <th>total hours </th>
                            </thead>
                        </table>
                        
                        <%
                            out.println("<p class='text-info'>No course breakdown done so far</p>");
                        %>
                    </div>
                    <div class="col-lg-6">
                        <p class="text-info "> <strong> Third term</strong></p>
                        <table class=" table table-condensed">
                            <thead>
                            <th>course ID</th>
                            <th>credit hours </th>
                            <th>total hours </th>
                            </thead>
                        </table>
                        <%
                            out.println("<p class='text-info'>No course breakdown done so far</p>");
                        %>
                    </div>
                    <div class="col-lg-6">
                        <p class="text-info "><strong> Fourth term</strong></p>
                        <table class=" table table-condensed">
                            <thead>
                            <th>course ID</th>
                            <th>credit hours </th>
                            <th>total hours </th>
                            </thead>
                        </table>
                        <%
                            out.println("<p class='text-info'>No course breakdown done so far</p>");
                        %>
                    </div>


                    <%}
                        }
                    %>
                </div>


            </div>
        </div>
        <%
            session.setAttribute("message", null);
        %>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>                  
        <script src="../resources/js/getprogram.js" type="text/javascript"></script>
        <script src="../resources/js/getcourses.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    $(function () {
                                        $('.navbar-toggle').click(function () {
                                            $('.navbar-nav').toggleClass('slide-in');
                                            $('.side-body').toggleClass('body-slide-in');
                                           
                                        });

                                    });
        </script>
    </body>
</html>
