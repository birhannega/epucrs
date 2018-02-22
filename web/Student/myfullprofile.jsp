<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="Model.DepartmentManagement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
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

                <pre>Full description of Your profile</pre>

                <div id="tabs" style="margin-top: -8px">
                    <ul>
                        <li><a href="#tabs-1">personal info</a></li>
                        <li><a href="#tabs-2">Family information</a></li>
                        <li><a href="#tabs-3">Experience</a></li>
                        <li><a href="#tabs-4">Post Graduate Education</a></li>
                        <li><a href="#tabs-5">Educational background</a></li>
                        <li><a href="#tabs-6">Student photo</a></li>
                    </ul>
                    <div id="tabs-1">
                        <%
                            UserManagement fetchid = new UserManagement();

                            String user = fetchid.getstudentUserID(session.getAttribute("student").toString());
                            // Get Id number of Logged student using username 
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
                    <div id="tabs-2">
                        <table class="table table-striped">
                            <thead>
                            <th>Family info</th>
                            </thead>
                            <tbody>

                                <% 
                                    //Creating object of student info
                                    StudentInfo familyInfo = new StudentInfo();
                                    //Get mother full name
                                    String motherfullname = familyInfo.getmotherFullNeme(studentID);
                                    //Get father fullname
                                    String fatherfullname = familyInfo.getfatherFullName(studentID);
                                    //get father job
                                    String fatherjob = familyInfo.getfatherJOb(studentID);
                                    //Get father address
                                    String fatherAddress = familyInfo.getfatherAddress(studentID);
                                    // Get mother job
                                    String motherjob = familyInfo.getMotherJOb(studentID);
                                    //Get mother's address
                                    String motherAddress = familyInfo.getMotherAddress(studentID);

                                    out.println("<tr><td>Father full name: </td><td>" + fatherfullname + "<td></tr>");
                                    out.println("<tr><td>Father Address: </td><td>" + fatherAddress + "<td></tr>");
                                    out.println("<tr><td>Father Job: </td><td>" + fatherjob + "<td></tr>");
                                    out.println("<tr><td>Mother full name: </td><td>" + motherfullname + "<td></tr>");
                                    out.println("<tr><td>Mother Address : </td><td>" + motherAddress + "<td></tr>");
                                    out.println("<tr><td>Mother Job: </td><td>" + fatherjob + "<td></tr>");
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div id="tabs-3">
                        <div class="page-header"> Student Experience</div>
                        <%
                            String studexperience = familyInfo.GetStudentExperience(studentID);
                            out.println("<div class='text-capitalize'>" + studexperience + "</div>");

                        %>
                    </div>
                    <div id="tabs-4">

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-info pull-right " data-toggle="modal" data-target="#myModal">
                            Add new 
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                    </div>
                                    <div class="modal-body">
                                        ...
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table">
                            <table class="table table-striped">
                                <thead>
                                <th>#</th>
                                <th>Name of Institution</th>
                                <th>Program attended</th>
                                <th>Field of study</th>
                                <th>Start year</th>
                                <th>End year</th>
                                <th>cumulative GPA</th>


                                </thead>
                                <tbody>
                                    <% 
                                        String psei = familyInfo.GetPSeiInfo(studentID);
                                        out.println(psei);
                                    %>
                                </tbody>
                            </table>
                        </div>


                    </div>
                    <div id="tabs-5">
                        <table class="table table-striped">
                            <thead>
                            <th>#</th>
                            <th>Grade</th>
                            <th>SCHOOL</th>
                            <th>Start Date</th>
                            <th>End Date</th>


                            </thead>
                            <tbody>

                                <%
                                    ResultSet rsbg = familyInfo.getinfo(studentID);
                                    int counter = 1;
                                    while (rsbg.next()) {
                                %>
                                <tr>
                                    <td>
                                        <%
                                       out.println(counter);
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rsbg.getString("Grade"));
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rsbg.getString("SCHOOL"));
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rsbg.getString("START_DATE"));
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            out.println(rsbg.getString("END_DATE"));
                                        %>
                                    </td>
                                </tr>
                                <%
                                        counter++;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div id="tabs-6"> 
                        <%
                            //out.println("photo ");
                            byte[] imgData = null;
                            Blob blob = familyInfo.getProfilePic(studentID);
                            imgData = blob.getBytes(1, (int) blob.length());

                            BASE64Encoder Base64 = new BASE64Encoder();

                            String photo = "data:image/png;base64," + Base64.encode(imgData);

                            //OutputStream o = response.getOutputStream();
                            out.println("<center><img style='width:240px;height:320px' class='img img-thumbnabil img-rounded img-responsive'src='" + photo + "'/img>"+"<h3 class='text-info'>"+user+"</h3></center>");
                            //out.print("<p class='text-info'>ID no.:" + user + "</p>");
                        %>
                        
                    </div>
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