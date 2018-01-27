<%-- 
    Document   : LUterm
    Created on : 16-Sep-2017, 06:09:37
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Add-user</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
 
            <div class="side-menu">

                   
                        <%@include file="sidemenu.jsp" %>
                    
            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">

                    <%--<%@include file="adduser_form.jsp" %>--%>
                   
                    <p class="page-header text-primary text-center">Term Registration</p>
                     ${TermReg}
                    ${TermNotReg}

                    <form class="form-horizontal" role="form" id="classform" action="${pageContext.request.contextPath}//TermRegServlet">
                        <div class="form-group col-lg-10">
                            <label for="programname"  class="col-lg-4 col-sm-2 control-label">Program Name</label>
                            <div class="col-lg-6 col-sm-10">
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
                            </div>
                        </div>
                        <div class="form-group col-lg-10">
                            <label for="termname" class="col-lg-4 col-sm-2 control-label">Term Name</label>
                            <div class="col-lg-6 col-sm-10">
                                <input type="text" class="form-control" id="termname"  name="termname" 
                                       placeholder="Enter Term Name">
                            </div>
                        </div>
                        <div class="form-group col-lg-10">
                            <label for="termdate" class="col-lg-4 col-sm-2 control-label" >Date</label>
                            <div class="col-lg-6 col-sm-10">
                                <input type="text" class="form-control" id="termdate"  name="termdate"  placeholder="Enter class date">
<!--                                <input id="demo" name="date" class="form-control">

                                <script>
                                    function myFunction() {
                                        document.getElementById('demo').value = Date();
                                    }
                                </script>-->
                            </div>
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
        </script>    </body>
</html>
