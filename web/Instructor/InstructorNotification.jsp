<%-- 
    Document   : InstructorNotification
    Created on : 20-Oct-2017, 08:50:50
    Author     : Efrem
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
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
                        <%@include file="../common/depsidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">

                    <%--<%@include file="adduser_form.jsp" %>--%>
                    <nav class="navbar navbar-default" role="navigation">
<!--                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">TutorialsPoint</a>
                        </div>-->

                        <div>
                            <!--<input class="form-control" type="text" readonly="" value="<%=session.getAttribute("inst").toString()%>">-->
                            <!--Left Align-->
                            <ul class="nav navbar-nav navbar-left">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        Java 
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">jmeter</a></li>
                                        <li><a href="#">EJB</a></li>
                                        <li><a href="#">Jasper Report</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
<!--                            <form class="navbar-form navbar-left" role="search">
                                <button type="submit" class="btn btn-default">
                                    Left align-Submit Button   
                                </button>
                            </form> -->
                            <!--<p class="navbar-text navbar-left">Left align-Text</p>-->
                            <!--Right Align-->
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                       <b class="glyphicon glyphicon-comment"></b> Message <b class="badge">3</b><b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Course</a></li>
                                        <li><a href="#">Class</a></li>
                                        <li><a href="#">Jasper Report</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
<!--                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" class="btn btn-default">Submit</button>
                            </form> 
                            <p class="navbar-text navbar-right">Right align-Text</p>-->
                        </div>
                    </nav>
                    <p class="page-header text-primary text-center">Instructor Profile</p>
                    <p class="page-header text-primary text-right">Welcome:<%=session.getAttribute("inst").toString()%></p>
                    ${TermReg}
                    ${TermNotReg}

                    <form class="form-horizontal" role="form" id="classform" action="${pageContext.request.contextPath}//TermRegServlet">
                        <div class="form-group col-lg-4">
                            <label for="programname"  class="">Program Name</label>
                            <!--<div class="col-sm-10">-->
                                <select class="form-control" name="programID">
                                    <option value="-1">-select class--</option>
                                    <%
                                        try {
                                            connectionManager dbconnection = new connectionManager();
                                            Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                            String lis_inst_sql = "Select * from TBL_ACADEMIC_PROGRAM";

                                            ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                    %>
                                    //                                                                        
                                    <%    while (rs_list_inst.next()) {
                                            String progid = rs_list_inst.getString("program_id");
                                            String progname = rs_list_inst.getString("program_name");
                                            //cid;
                                    %>
                                    <option value="<%=progid%>"><%=progname%></option>
                                    <% } %>
                                    <!--</select>-->
                                    <%
                                        } catch (Exception e) {
                                            out.println("wrong selection!" + e);
                                        }
                                    %>

                                </select>
                                <!--                                <input type="text" class="form-control" id="blockname" name="termname" 
                                                                       placeholder="Enter Program Name">-->
                            <!--</div>-->
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="termname" class="">Term Name</label>
                            <!--<div class="col-lg-6 col-sm-10">-->
                                <input type="text" class="form-control" id="termname"  name="termname" 
                                       placeholder="Enter Term Name">
                            <!--</div>-->
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="termdate" class="" >Date</label>
                            <!--<div class="col-lg-6 col-sm-10">-->
                                <input type="text" class="form-control" id="termdate"  name="termdate"  placeholder="Enter class date">
                            
                            <!--</div>-->
                        </div>
                        <div class="btn-group show-on-hover col-lg-4">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                Action <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary"><span class="fa fa-save"> Save Term Info</span></button>
                            </div>
                        </div>
                    </form>
                    <%    request.getSession().setAttribute("TermReg", null);
                        request.getSession().setAttribute("TermNotReg", null);
                    %>
                </div>  <!--body end-->
            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in')
                            ;
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
            $("#termdate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd'

            });
        </script> 
<%}%>
    </body>
</html>
