<%-- 
    Document   : CourseListInstructor
    Created on : 03-Nov-2017, 09:33:52
    Author     : efrem
--%>
<%
    if(session.getAttribute("inst")==null)
{
 response.sendRedirect("../index.jsp");
}
    else {
       
%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <title>Instructor Notification</title>
    </head>
        <body>
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
                        <%@include file="../common/InstructorSidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                   
                    
                    
                     <p class="page-header text-primary text-right">Welcome:<%=session.getAttribute("inst").toString()%></p>
                                    <!--select course-->
                               <form class="form-group " role="form" method="post" id="crsform"  action="">
                                 
                                   <div class="container-fluid">
                                <div class="form-group col-lg-4 align-center"> 
                                    Program Name
                                    <select class="form-control" name="programname" id="programname" onchange="showAssignState(this.value)">
                                        <option value="">-select course-</option>
                                        <%
                                            try {
                                                connectionManager dbconnection = new connectionManager();
                                                Statement st_course = dbconnection.getconnection().createStatement();
                                                String crs_sql = "select  COURSE_CODE, COURSE_NAME,PROGRAM from TBL_COURSE_REGISTRATION group by COURSE_NAME,COURSE_CODE,PROGRAM";

                                                ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                        %>
                                        //                                                                        
                                        <%    while (rs_cours.next()) {
                                                String c_code = rs_cours.getString("COURSE_CODE");
                                                String c_name = rs_cours.getString("COURSE_NAME");
                                                String c_program = rs_cours.getString("PROGRAM");
                                                //cid;
%>
                                        <option value="<%=c_program%>"><%=c_program%></option>
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
                                    </form>
                                    <!--display course-->
                                    <div class="form-group col-lg-12" id="crslistDisplay">


                                </div>
                </div>
            </div>
        </div>
                <!--course ajax-->
        <script type="text/javascript">
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
                var urlass = ".../common/CourseList.jsp";
                urlass += "?programname=" + str; 
                
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", urlass, true);
                xmlHttp.send(null);
            }
            function stateChange() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
//                    document.getElementById("program").innerHTML = xmlHttp.responseText
                    document.getElementById("crslistDisplay").innerHTML = xmlHttp.responseText
                }
            }
        </script>                           
    </body>
</html>
<%}%>