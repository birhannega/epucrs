<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="org.apache.xml.security.utils.Base64"%>
<%@page import="java.io.OutputStream"%>
<%
    if (session.getAttribute("admin") == null) {
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
        <title>Registrar ban-user</title>
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
                <%@include file="sidemenu.jsp" %>
            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <%@include file="form_banuser.jsp" %>
                </div>
            </div>
        </div>

               
                
                
                
                
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
       ;
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
               });
            });
        </script>
    </body>

</html>
<%    }
%>