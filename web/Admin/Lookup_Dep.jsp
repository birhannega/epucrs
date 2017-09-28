<%-- 
    Document   : Lookup_Dep
    Created on : 20-Sep-2017, 08:56:56
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <%@include file="../common/depsidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="side-body">
                <form class="" method="POST" action="${pageContext.request.contextPath}//lookupdep_servlet">
                    <div class="container-fluid">
                        <p class="page-header text-primary text-center">Lookup Department</p>

                        <div class="col-lg-4">
                            <label class="">Department ID </label>
                            <input class="" placholder="did" name="deplookupid" id="deplookupid">
                        </div>
                        <div class="col-lg-4">
                            <label class="">Department Name</label>
                            <input class="" placholder="name" name="deplookupname" id="deplookupname">
                        </div>
                        <div class="col-lg-4">
                            <button type="submit" class="btn btn-primary"><span class="fa fa-save"> Save</span></button>
                        </div>
                    </div>
                </form>
                <form class="" method="POST" action="${pageContext.request.contextPath}//lookupdep_servlet">
                    <div class="container-fluid">
                        <p class="page-header text-primary text-center">Lookup Program</p>

                        <div class="col-lg-4">
                            <label class="">Department ID </label>
                             <select class="form-control" id="selectinstr" name="selectinstr" required="required">
                                                <option value="-1">-select depid-</option>
                                                <%
                                                    try {
                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select dep_id from lu_dep";

                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_list_inst.next()) {
                                                        String dep_id = rs_list_inst.getString("dep_id");
                                                        //cid;
%>
                                                <option><%=dep_id%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                         
                        </div>
                        <div class="col-lg-4">
                            <label class="">Program ID </label>
                            <input class="" placholder="Prgram ID" name="deplookupid" id="deplookupid">
                        </div>
                        <div class="col-lg-4">
                            <label class="">Program Name</label>
                                    <input class="" placholder="Program Name" name="deplookupname" id="deplookupname" value="">
                        </div>
                        <div class="col-lg-4">
                            <button type="submit" class="btn btn-primary"><span class="fa fa-save"> Save</span></button>
                        </div>
                    </div>
                </form>
            </div>

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
