<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 23-Aug-2017, 03:45:46
    Author     : user
--%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        connectionManager connManager = new connectionManager();
        Connection con = connManager.getconnection();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css"        rel="stylesheet" type="text/css"/>
        <link href="../resources/jquery-ui/css/jquery-ui.css"         rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css"   rel="stylesheet" type="text/css"/>
        <script src="../resources/js/jquery-1.10.2.min.js"             type="text/javascript"></script>
        <script src="../resources/bootstrap1/js/bootstrap.js"          type="text/javascript"></script>
        <script src="../resources/jquery-ui/js/jquery-ui.js"           type="text/javascript"></script>
        <script src="../resources/jquery/jquery.validate.js"           type="text/javascript"></script>
        <title>Add info</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../common/reg_nav.jsp" %>
        </div>
        <div class="container-fluid">

            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 pull-left">
                <div class="list-group">
                    <div class="list-group-item active">Quick Links</div>
                    <a href='addschedule.jsp' class="list-group-item" id="addschedule" >Add Schedule</a>
                    <a href='Adduser.jsp' class="list-group-item" id="adduser"> Add User</a>
                    <a href='addevent.jsp'  class="list-group-item" id="add">Add Event</a>
                    <a href="addinfo.jsp"  class="list-group-item">Add info</a>
                </div>
            </div>
            <div class="col-lg-9  col-md-4 col-xs-12" id="content">
                <div class="col-lg-12">
                    <%@include file="addevent_form.jsp" %>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#calendar").datepicker();
            });
        </script>               
        <script>
            $(document).ready(function () {
                $("#addschedule").click(function ()
                {
                    $("#content").load("addschedule_form.jsp");
                });

                $("#adduser").click(function ()
                {
                    $("#content").load("adduser_form.jsp");
                });
            });
        </script>
    </body>
</html>
<%}%>