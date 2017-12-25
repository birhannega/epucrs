<%-- 
    Document   : DepartmentReport
    Created on : 24-Nov-2017, 08:42:02
    Author     : user
--%>

<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<!DOCTYPE">
<html>
    <head>
        <title>Department Report</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body oncontextmenu="return false">
         <% connectionManager dbconnection = new connectionManager();
           Statement stmt = dbconnection.getconnection().createStatement();
           %>
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
                        <%@include file="../common/ReportsSidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                     
                    <%--<%@include file="adduser_form.jsp" %>--%>
                    ${ClassReg}
                    ${ClassNotReg}
                    <p class="page-header text-primary text-center">Department Report</p>

                    <form class="form-horizontal" role="form" id="classform" action="${pageContext.request.contextPath}/ClassServlet">
                        <div class="form-group col-lg-6">
                            <label for="locationname" class="col-lg-4 col-sm-2 control-label">Department</label>
                            <div class="col-lg-6 col-sm-10">
                                <!--<span class="input-group-addon">Department</span>-->
                                        <select class="form-control" id="department" name="department" required="required">
                                            <option value="-1">-select department-</option>
                                            <%
                                                try {
//                                                  
                                                    String qury = "select * from lu_dep";

                                                    ResultSet rs_program = stmt.executeQuery(qury);

                                            %>
                                            //                                                                        
                                            <%    while (rs_program.next()) {
                                                    String id = rs_program.getString("dep_name");
                                                    //cid;
                                            %>
                                            <option><%=id%></option>
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
                        <div class="form-group col-lg-6">
                            <label for="blockname"  class="col-lg-4 col-sm-2 control-label">Admission Type</label>
                            <div class="col-lg-6 col-sm-10">
                               <select class="form-control" id="status" name="status" required="requiered">
                                              <option value="-1">-select type</option>
                                            <option value="Reguar">Reguar</option>
                                            <option value="Extension">Extension</option>
                                            <option value="Distance">Distance</option>
                                        </select>
                            </div>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="classname" class="col-lg-4 col-sm-2 control-label">Academic Year</label>
                            <div class="col-lg-6 col-sm-10">
                                <select class="form-control" id="status" name="status" required="requiered">
                                            <option value="2006/2007">2006/2007</option>
                                            <option value="2007/2008">2007/2008</option>
                                            <option value="2007/2008">2008/2009</option>
                                        </select>
<!--                                <input type="text" class="form-control" id="classname"  name="classname" 
                                       placeholder="Enter Class Name">-->
                            </div>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="classdate" class="col-lg-4 col-sm-2 control-label" >Term</label>
                            <div class="col-lg-6 col-sm-10">
                               <select class="form-control" id="status" name="status" required="requiered">
                                              <option value="-1">-select term</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            
                                        </select>
                            </div>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="classdate" class="col-lg-4 col-sm-2 control-label" >Gender</label>
                            <div class="col-lg-6 col-sm-10">
                                <select class="form-control" id="status" name="status" required="requiered">
                                              <option value="-1">-select gender</option>
                                            <option value="male">male</option>
                                            <option value="female">female</option>
                                            
                                        </select>
<!--                                <input type="text" class="form-control" id="classdate"  name="classdate" 
                                       placeholder="Enter class date">-->
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary glyphicon glyphicon-zoom-in">
<!--                                    <span class="fa fa-save"> -->
                                        Show
                                        <!--</span>-->
                                   </button>
                            </div>
                        </div>
                    </form>
                    <%    request.getSession().setAttribute("ClassReg", null);
                        request.getSession().setAttribute("ClassNotReg", null);
                    %>
                </div>  <!--body end-->
            </div>
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
        <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

        <script type="text/javascript">
                    $("#classdate").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: 'yy-mm-dd'

                    });
        </script>    </body>
</html>


