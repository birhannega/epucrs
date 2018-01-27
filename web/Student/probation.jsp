
<%
if(session.getAttribute("student")==null)
{
    response.sendRedirect("../index.jsp");
}
else
{
%>


<%@page import="Model.UserManagement"%>
<%@page import="Model.StudentInfo"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            
            <div class="side-menu">
                <%@include file="studentsidemenu.jsp" %>


            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <h3>Distinctive Probation application form</h3>
                    <pre> Probation application form</pre>
                    <form action="${pageContext.request.contextPath}/ProbationServlet" method="post" name="probation" id="probation">
                        <%!
                            DateFormat year = new SimpleDateFormat("yyyy-MM-E");
                            String now = year.format(new Date());

                          
                        %> 
                        <%
                            
                        UserManagement fetchid = new UserManagement();
                        String user = fetchid.getstudentUserID(session.getAttribute("student").toString());
                        
                        
                         StudentInfo getfullname=new StudentInfo();
                         String fullname=getfullname.getfullname(user);
                         String department=getfullname.getDepartment(user);
                        %>

                        <input type="hidden"value="<%=now%>"name="date">
                       
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <div class="form-group col-lg-6">
                                Student full Name<input tyup="text" value="<%=fullname%>" readonly="" name="trainer_name" id="trainer_name"  class="form-control">
                            </div>
                            <div class="form-group col-lg-6">
                                Department<input type="text" name="department" readonly="" value="<%=department%>" id="department" class="form-control">
                            </div>
                            <div class="form-group col-lg-6">
                                Pervious Result<input type="text" class="form-control" name="pervious_result" id="pervious_result">
                            </div>
                            <div class="form-group col-lg-6">
                                Student Status<select name="current_status" id="current_status" class="form-control">
                                    <option value=""> Select Student Status </option>
                                    <option>Farewell </option>
                                    <option>Farewell Reception</option></select>
                            </div>
                            <div class="form-group col-lg-6">
                                Expected Result<input type="text" name="expected_result" id="expected_result" class="form-control">
                            </div>
                            <div class="form-group col-lg-6">
                                Department Manager name<input type="text" name="Manager_name" id="Manager_name" class="form-control">
                            </div>
                            <div class="form-group col-lg-6">
                                Registrar Manager name<input type="text" name="Registrar_manager_name" id="Registrar_manager_name" class="form-control">
                            </div>
                            <div class="form-group col-lg-6 pull-right">
                                <input type="submit" value="submit" class="btn btn-primary btn-block">
                            </div>
                        </div>
                    </form>


                </div>
            </div>
        </div>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
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
<%}%>