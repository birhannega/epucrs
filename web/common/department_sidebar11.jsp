<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>students page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
            <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
<script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
            
    </head>
    
    <body>
<!--        <div class="container-fluid">-->
        <%@include file="../common/head_banner.jsp" %>
        <!--</div>-->
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu container" style="margin: 1">

                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <div class="brand-wrapper">
                            <!-- Hamburger -->
                            <button type="button" class="navbar-toggle">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                            <!-- Brand -->
                            <div class="brand-name-wrapper">
                                <a class="navbar-brand" href="index.jsp">
                                    EPUC/Student page
                                </a>
                            </div>

                            <!-- Search -->
                            <a data-toggle="collapse" href="#search" class="btn btn-default" id="search-trigger">
                                <span class="glyphicon glyphicon-search"></span>
                            </a>

                            <!-- Search body -->
                            <div id="search" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <form class="navbar-form" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-default "><span class="glyphicon glyphicon-ok"></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Main Menu -->
                    <div class="side-menu-container">
                        <ul class="nav navbar-nav">

                            <li><a href="CourseRegistration.jsp"><span class="glyphicon glyphicon-blackboard"></span> Course Register</a></li>
                            <li class="active"><a href="ClassRegister.jsp"><span class="glyphicon glyphicon-book"></span> Class Register</a></li>
                              <li class="active"><a href="InstructroRegistration.jsp"><span class="glyphicon glyphicon-question-sign"></span>Instructor Registration</a></li>
                               <li class="active"><a href="StaffRegistration.jsp"><span class="glyphicon glyphicon-pushpin"></span>Staff Registration</a></li>
                               <li class="active"><a href="Trainee.jsp"><span class="glyphicon glyphicon-question-sign"></span>Trainee Registration</a></li>
                               <li class="active"><a href="ClassRegistration.jsp"><span class="glyphicon glyphicon-pushpin"></span>Class Registration</a></li>
                               <li class="active"><a href="ClassRegistration.jsp"><span class="glyphicon glyphicon-pushpin"></span>Student Request Management</a></li>
                               
                            <!-- Dropdown-->history
                            <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl1">
                                    <span class="glyphicon glyphicon-user"></span> My Profile  <span class="caret"></span>
                                </a>

                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            
                                            <li><a href="profile.jsp"><span class="glyphicon glyphicon-eye-open"></span> View profile</a></li>
                                            <li><a href="changepassword.jsp"><span class="glyphicon glyphicon-retweet"></span> change Password</a></li>
                                       
                                        </ul>
                                    </div>
                                </div>
                            </li>

                            
                            
                            
                            
                            
                            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
              <span class="text-primary">  <strong>List of available courses</strong></span>

                <script type="text/javascript">
                    $('#edit_id').click(function ()
                    {
                        $("#editing_form").css('visibility', "visible");
                    });
                </script>
                <!--<span class="alert alert-success">  ${del}</span>--> 
                ${del}
                <table  class="table table-striped table-bordered table-hover "  id="tabledate" >
                    <thead>
                        <tr>
                            <th>Course Code</th>
                            <th>Department</th>
                            <th>Program</th>
                            <th>Term</th>
                            <th>Course Name</th>
                            <th>Added Date</th>
                            <th>Credit Hours</th>
                            <th>Has Pre Request</th>
                            <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                            <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                        </tr>
                    </thead>
                    <%
                        session.setAttribute("del", null);
                    %>

                    <tbody>
                        <%
                            connectionManager dbconnection = new connectionManager();
                            Statement st_list_course = dbconnection.getconnection().createStatement();
                            String course_sql = "select * from TBL_COURSE_REGISTRATION";
                            ResultSet rs_course = st_list_course.executeQuery(course_sql);
                            while (rs_course.next()) {
                                String id = rs_course.getString(1);
                        %>
                        <tr>
<!--                            <td><%=rs_course.getString(1)%></td> -->
                            <td><%=id%></td> 
                            <td><%=rs_course.getString(2)%></td> 
                            <td><%=rs_course.getString(3)%></td> 
                            <td><%=rs_course.getString(4)%></td> 
                            <td><%=rs_course.getString(5)%></td> 
                            <td><%=rs_course.getString(6)%></td> 
                            <td><%=rs_course.getString(7)%></td> 
                            <td><%=rs_course.getString(8)%></td> 
                            <td>


                                <form action="CourseUpdate.jsp" method="post">

                                    <input type="hidden" name="edit_id" value="<%=id%>"/>

                                    <button class="btn btn-warning" id="edit_id">Edit</button>
                                </form>

                            </td>

                            <td>
                                <form action="deletecourse.jsp" method="Post" >
                                    <input type="hidden" name="delete_id" value="<%=id%>"/>
                                    <button class="btn btn-danger" id="deleteid">Delete</button>
                                </form>


                            </td>
                            <!--                    <script type="text/javascript">
                                                    $('#deleteid').on('click', function () {
                                                        table
                                                                .row($(this).parents('tr'))
                                                                .remove()
                                                                .draw();
                                                    });
                                                </script>-->
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
                <strong></strong>
                <form action="" id="editing_form" method="post" style="visibility: hidden">

                    <input type="text" name="edit_id" value="<%%>"/>

                    <button class="btn btn-warning" id="edit_id">Edit</button>
                </form>

                </div>
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
    </body>
</html>
 <!--<script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>-->
        <!--<script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>-->
        <script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
$(document).ready(function() {
    $('#tabledate').DataTable();
} );
    </script>   