<%@page import="Model.DepartmentManagement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="org.apache.xml.security.utils.Base64"%>
<%@page import="java.io.OutputStream"%>
<%
    if (session.getAttribute("student") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        connectionManager dbconnection = new connectionManager();
        Connection dbcon = dbconnection.getconnection();
%>


<%@page import="Model.StudentInfo"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="Model.UserManagement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Model.StudentManagement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>students page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/registrar-side-menu.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- side bar -->
            <div class="side-menu">
                <%@include file="studentsidemenu.jsp" %>
            </div>
            <!-- Main Content -->
            <div class="side-body">
                <!--                <pre><strong>Full description of Your profile</strong></pre>-->

                <h2>Full description of Your profile</h2>

                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">personal info</a></li>
                        <li><a href="#tabs-2">Family information</a></li>
                        <li><a href="#tabs-3">Experience</a></li>
                        <li><a href="#tabs-4">Post Graduate Education</a></li>
                        <li><a href="#tabs-5">Educational background</a></li>
                        <li><a href="#tabs-6">photo</a></li>
                    </ul>
                    <div id="tabs-1">
                        <%
                            UserManagement fetchid = new UserManagement();

                            String user = fetchid.getstudentUserID(session.getAttribute("student").toString());
                            String studentID = user;
                            // out.println(user);
                            //  StudentManagement profile=new StudentManagement();
                            Statement st_profile = dbcon.createStatement();
                            String profilesql = "select * from TBL_STUDENT_PROFILE where Stud_id='" + user + "'";
                            ResultSet rs_profile = st_profile.executeQuery(profilesql);
                            String fname = null,
                                    department = null,
                                    program = null,
                                    lname = null,
                                    mname = null;
                            String bdate = null, round = null;
                            if (rs_profile.next()) {
                                fname = rs_profile.getString("STUD_FIRST_NAME");
                                mname = rs_profile.getString("STUD_MIDDLE_NAME");
                                lname = rs_profile.getString("STUD_LAST_NAME");
                                department = rs_profile.getString("DEP_ID");
                                bdate = rs_profile.getString("STUD_BIRTHDATE");
                                program = rs_profile.getString("PROGRAM_ID");
                                round = rs_profile.getString("round");
                                //  out.print(fname+" "+mname+" "+lname);

                                //Get fullname of Logged student
                                StudentInfo myinfo = new StudentInfo();
                                String fullname = myinfo.getfullname(studentID);
                                //
//                                Get department
//                                DepartmentManagement departments = new DepartmentManagement();
                                String departmentname = null, programname = null;
                                ResultSet rs_department = st_profile.executeQuery("select * from TBL_DEPARTMENT where DEP_ID='" + department + "'");
                                if (rs_department.next()) {
                                    departmentname = rs_department.getString("dep_name");
                                } else {
                                    departmentname = "unknown department name";
                                }
                                //Get program name 
                                ResultSet rs_program = st_profile.executeQuery("select * from TBL_ACADEMIC_PROGRAM where PROGRAM_ID='" + program + "'");
                                if (rs_program.next()) {
                                    programname = rs_program.getString("PROGRAM_NAME");
                                } else {
                                    programname = "unknown program name";
                                }
                                // calculate age of logged user based on birthdate

                                SimpleDateFormat yrformat = new SimpleDateFormat("yyyy");
                                String year = bdate.substring(0, 4);
                                int year_from_db = Integer.valueOf(year);
                              
                                // get current year
                                java.util.Date thisyear = new java.util.Date();
                                //
                                String thisyearf = yrformat.format(thisyear);
                                int age = Integer.valueOf(thisyearf) - year_from_db;
                                //
                                

                                // out.println(age);
                                out.println("<p><strong>Full name: <span class='text-capitalize text-info'>" + fullname + "</span></strong></p>");
                                out.println("<p><strong>Age: </strong><span class='text-capitalize'>" + age + "( " + year_from_db + "-current)" + "</span></p>");
                                out.println("<p><strong>Department: </strong><span class='text-capitalize'>" + departmentname + "</span></p>");
                                out.println("<p><strong>Program: </strong><span class='text-capitalize'>" + programname + "</span></p>");
                                  out.println("<p><strong>Round: </strong><span class='text-capitalize'>" + round + "</span></p>");
                            }

                        %>   
                    </div>
                    <div id="tabs-2">Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
                    <div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellen</div>
                    <div id="tabs-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
                    <div id="tabs-5">Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
                    <div id="tabs-6">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
                </div>

            </div>
            <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
            <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
            <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
            <script type="text/javascript">

                $(function () {
                    $('.navbar-toggle').click(function () {
                        $('.navbar-nav').toggleClass('slide-in');
                        $('.side-body').toggleClass('body-slide-in');
                    });

                    $("#tabs").tabs();


                });
            </script>
        </div>
    </body>

</html>
<%    }
%>