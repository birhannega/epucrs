<%@page import="Model.CourseManagement"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MailDateFormat"%>
<%@page import="Model.termManagement"%>


<%
    if (session.getAttribute("student") == null) {
        response.sendRedirect("../index.jsp");
    } else {
%>
<%@page import="Model.StudentInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="Model.UserManagement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.termManagement"%>
<%@page import="Model.StudentManagement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>students page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">
                <%@include file="studentsidemenu.jsp" %>
            </div>

            <!-- Main Content -->
            <div class="container-fluid">

                <div class="side-body">
                    <%
                        // get db connnection
                        connectionManager conmanager = new connectionManager();
                        Connection dbcn_admission = conmanager.getconnection();

                        // identify logged user
                        UserManagement fetchid = new UserManagement();
                        String user = fetchid.getstudentUserID(session.getAttribute("student").toString());
                        String studentID = user;
                        //Get active term;
                        termManagement getactiveterm = new termManagement();
                        String status = "active";
                        String term_id = null;

                        java.util.Date year = new java.util.Date();
                        SimpleDateFormat formatyear = new SimpleDateFormat("Y");
                        String currentYear = formatyear.format(year);
                        int activeyear = Integer.valueOf(currentYear);
                        String ye=String.valueOf(activeyear);
                        String current_term = getactiveterm.getAtiveTerm(ye);

                        //out.println(current_term);
                    %>

                    <%                        // check if there is any previous admission
                        Statement st_admision = dbcn_admission.createStatement();
                        ResultSet rs_admision = st_admision.executeQuery("Select * from TBL_ADMISSION where Stud_id='" + studentID + "'");
                        if (rs_admision.next()) {

                    %>
                    <div class="text-info"><h4>
                            <%                                StudentInfo getfullname = new StudentInfo();
                                String studname = getfullname.getfullname(studentID);
                            %>  
                            <span class="text-capitalize ">  <%=studname%> </span> Admissions </h4></div>

                    <table class="table table-bordered">

                        <thead >
                        <th >Year</th>
                        <th >Term</th>
                        <th >Date of Admission</th>
                        </thead>
                        <%
                            String sql = "Select * from TBL_ADMISSION where Stud_id='" + studentID + "'";
                            ResultSet rs_admissions = st_admision.executeQuery(sql);
                            while (rs_admissions.next()) {
                        %>
                        <tr>
                            <td><% out.print(rs_admissions.getString(4));%></td>
                            <td><% out.print(rs_admissions.getString(2));%></td>
                            <td><% out.print(rs_admissions.getString(3));%></td>
                        </tr>

                        <% }
                        %>
                    </table>
                    <%
                    } else {
                    %>
                    <div class="alert alert-warning">  You have no admissions so far</div>
                    <form class="form-group" method="post" action="${pageContext.request.contextPath}/admission">
                        <input type="hidden" name="studid" value="<%=studentID%>"/>
                        <input type="hidden" name="year" value="<%=currentYear%>"/>

                        <button type="submit" class="btn btn-primary">Claim your first admission</button>
                    </form>
                    <%
                        }
                    %>
                    <div class="col-lg-12">

                        <%
                            String studid, department, program, term;
                            UserManagement getid = new UserManagement();
                            // Get logged student id
                            studid = getid.getstudentUserID(session.getAttribute("student").toString());
                            //Get current active term
                            // out.print(currentYear);
                            StudentInfo getprogram = new StudentInfo();
                            program = getprogram.getProgramID(studentID);
                            //term_id = getactiveterm.gettermId(current_term);
                            //  out.print(current_term);
                            // out.print(term_id);
                            String sql_id = "select term_id from lu_term where term_name like '" + current_term + "'";
                            ResultSet rs_term_id = st_admision.executeQuery(sql_id);
                            if (rs_term_id.next()) {
                                term_id = rs_term_id.getString(1);
                                //out.print(term_id);
                            }
                            //  out.print(program);

                            String listcourse = "select course_id from TBL_COURSE_BREAKDOWN where PROGRAM_ID='" + program + "' and term_id='" + term_id + "' ";

                            Statement st_list_course = conmanager.getconnection().createStatement();
                            ResultSet rs_list = st_list_course.executeQuery(listcourse);
                            String course_code = null,course_credithr=null;

                        %>
                        <table class="table table-bordered">
                            <thead>
                            <th class="active">#</th>
                            <th class="active">Course ID</th>
                            <th class="active">Course name</th>
                            <th class="active">Credit Hour</th>
                            </thead>
                            <tbody>
                                <%                                        int number = 1,credit=0;

                                    CourseManagement getcourseinfo = new CourseManagement();
                                    String course_name = null;
                                    while (rs_list.next()) {
                                        course_code = rs_list.getString("course_id");
                                        
                                        course_name = getcourseinfo.getcoursname(course_code);
                                        course_credithr=getcourseinfo.getcourcredit(course_code);
                                        
                                         credit=Integer.valueOf(course_credithr);
                                        
                                        out.println("<tr>");
                                        credit=credit+credit;
                                        out.print("<td>" + number + "</td>");
                                        out.print("<td>" + course_code + "</td>");
                                        out.print("<td>" + course_name + "</td>");
                                           out.print("<td>" + course_credithr + "</td>");
                                        out.println("</tr>");
                                        number++;
                                       // credit=credit+credit;
                                %>





                                <%
                                    }
                               out.print("<tr><td colspan='3'> Total credit hours for this term</td><td>"+credit+"</td></tr>");
                                %>

                            </tbody>
                        </table>

                    </div> 

                </div>
            </div>
        </div>

        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
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
    </body>

</html>
<%    }
%>