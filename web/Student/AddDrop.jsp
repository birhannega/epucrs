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
                 
                    <%@include file="AddDropform.jsp" %>
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



        });
    </script>
</body>

</html>
<%    }
%>