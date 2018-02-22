<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="org.apache.xml.security.utils.Base64"%>
<%@page import="java.io.OutputStream"%>
<%
    if (session.getAttribute("student") == null) {
        response.sendRedirect("../index.jsp");
    } else {
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
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
         <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>

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
                        <div class="container-fluid">
                    <%
                        connectionManager dbconnection = new connectionManager();
                        Connection dbcon = dbconnection.getconnection();
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

                        if (rs_profile.next()) {
                            fname = rs_profile.getString("STUD_FIRST_NAME");
                            mname = rs_profile.getString("STUD_MIDDLE_NAME");
                            lname = rs_profile.getString("STUD_LAST_NAME");
                            department = rs_profile.getString("DEP_ID");
                            program = rs_profile.getString("PROGRAM_ID");

                        }

                    %>   
                        <div class="col-lg-4 pull-right">
                        <%                            Blob blob = null;

                            byte[] imgData = null;

                            Statement st_photo = dbcon.createStatement();
                            String photosql = "select * from TBL_PICTURES where Stud_id='" + user + "'";
                            ResultSet rs_profilepic = st_photo.executeQuery(photosql);
                            if (rs_profilepic.next()) {
                                blob = rs_profilepic.getBlob("photo");
                                imgData = blob.getBytes(1, (int) blob.length());
//                            out.println("<img class='img img-thumbnail' value='"+blob+"'</img>");
                            }

                            if (blob == null) {
                                out.print("<div>No picture added  <button  id='addpic' class='btn btn-primary'>Add profile picture</button>"
                                );
                        %>
                        ${message}
                        <div id='photoform'>
                            <form action = "${pageContext.request.contextPath}/uploadprofilepic" method="post" enctype="multipart/form-data">
                                <label> choose photo
                                </label>
                                <input type='hidden' name='studid' value="<%=user%>">
                                <input type='file' name='picture'/><br>
                                <button type='submit' class='btn btn-info'>upload photo</button> 
                            </form>
                        </div>  </div> 
                        <%
                            } else {
                                //response.setContentType("image/gif");
                                BASE64Encoder Base64 = new BASE64Encoder();
                                String photo = "data:image/png;base64," + Base64.encode(imgData);

                                //OutputStream o = response.getOutputStream();
                                out.println("<img style='width:240px;height:320px' class='img img-thumbnabil img-circle img-responsive'src='" + photo + "'/img>");
                                out.print("<p class='text-info'>ID no.:"+user+"</p>");
                            }
                        %>
                    <!--<img  class="img img-thumbnabil" src="../images/kooper.JPG"alt="profile picture"/>-->
                </div>
                <div class="col-lg-8 ">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td colspan="3"> <strong> Welcome ${student}. Here is Short summary of your profile </strong>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Name</td>
                                <td> <strong><span class="text-capitalize text-primary">  <%=fname + " " + mname + " " + lname%> </span></strong> </td>
                            </tr>

                            <tr>
                                <td>Department</td>
                                <td>

                                    <%
                                        ResultSet rs_department = st_profile.executeQuery("select * from TBL_DEPARTMENT where DEP_ID='" + department + "'");
                                        if (rs_department.next()) {
                                            out.println(rs_department.getString("dep_name"));
                                        }
                                    %> 
                                </td>
                            </tr>
                            <tr>
                                <td>program:</td>
                                <td> <%
                                    ResultSet rs_program = st_profile.executeQuery("select * from TBL_ACADEMIC_PROGRAM where PROGRAM_ID='" + program + "'");
                                    if (rs_program.next()) {
                                        out.println(rs_program.getString("PROGRAM_NAME"));
                                    }
                                    %></td>
                            </tr>

                            <tr>
                                <td>Age</td>
                                <td>  </td>
                            </tr>
                            <tr>
                                <td>Round</td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>

                    <table class="table table-condensed table-responsive table-striped">
                        <thead>
                            <tr>
                                <th>Family information</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                                <td> <strong> Father's info</strong></td>
                                <td><strong> Mother's info </strong></td>
                            </tr>
                            <tr>
                                <td>full name:   <%
                                    StudentInfo fatherinfo = new StudentInfo();
                                    String father_fullname = fatherinfo.getfatherFullName(user);
                                    //
                                    out.print(father_fullname);

                                    %>   
                                </td>
                                <td>full name: 
                                    <% 
                                        StudentInfo motherinfo = new StudentInfo();
                                        String mother_fullname = motherinfo.getmotherFullNeme(user);
                                        out.print(mother_fullname);
                                    %>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <%
                                        StudentInfo getfatheraddress = new StudentInfo();
                                        String fatheraddress = getfatheraddress.gefatheraddress(studentID);
                                        out.print("Address:  " + fatheraddress);
                                    %>

                                </td>
                                <td>

                                    <%
                                        StudentInfo getmotheraddress = new StudentInfo();
                                        String motheraddress = getmotheraddress.gemotheraddress(studentID);
                                        out.print("Address: " + motheraddress);
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <th>Educational background</th>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        StudentInfo educationalBackground = new StudentInfo();
                                        String education = educationalBackground.geteducationalBackground(studentID);
                                        out.print("Grade:" + education);
                                    %>

                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    
    <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#photoform").hide();
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
            $("#addpic").click(function (e) {

                $("#photoform").show();

            });


        });
    </script>
</body>

</html>
<%    }
%>