<%
if(session.getAttribute("director")==null)
{
    response.sendRedirect("../index.jsp");
}else{
 
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <title>view schedule</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTable/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
          
            <!--Side Menu -->
            <div class="side-menu">
                <%@include file="sidemenu.jsp" %>
            </div>
            <!-- Main Content -->
            <div class="side-body">
                <div class="container-fluid">
                    <table class="table table-responsive table-striped" id="tbl_schedule">
                        <thead>
                        <th colspan="6">
                            <h4 class="text text-info"> Academic schedule of Ethiopian Federal Police commission </h4>
                        </th>
                        </thead>
                        <tr>
                            <td><strong>No.</strong></td>
                            <td><strong> Title</strong></td>
                            <td><strong> Name </strong></td>
                            <td><strong>Start Date</strong></td>
                            <td><strong>End Date</strong></td>
                        </tr>
                        <%
                            connectionManager schcon = new connectionManager();
                            Connection connection = schcon.getconnection();
                            Statement statement = connection.createStatement();

                            Date date = new Date();
                            SimpleDateFormat sdf = new SimpleDateFormat("Y");
                            String currentyear = sdf.format(date);

                            String sql = "select * from TBL_SCHEDULE where ACADEMICYEAR='" +currentyear+ "' order by Schedule_id ";
                            ResultSet resultSet = statement.executeQuery(sql);
                            int counter = 0;
                            while (resultSet.next()) {
                                counter = counter + 1;
                        %>
                        <tr>
                            <td><%=counter%></td>
                            <td><%=resultSet.getString("title")%></td>
                            <td><%=resultSet.getString("EVENT_NAME")%></td>
                            <td><%=resultSet.getString("START_DATE")%></td>
                            <td><%=resultSet.getString("END_DATE")%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../resources/DataTable/js/jquery.dataTables.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
                   
                });
                $("#tbl_schedule").datatable();
            });
        </script>
    </body>
</html>
<%
}
%>
