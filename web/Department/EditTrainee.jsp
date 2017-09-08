<%@page import="dbconnection.connectionManager"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>

<br><br>
<div class="col-lg-10 col-sm-9 col-xs-8">

    <table class="table table-condensed ">
        <thead>
        <th>Birth Date</th>
            <th>Department</th>
            <th>End Date</th>
                <th>First Name</th>
                    <th>LAST_NAME</th>
                    <th>MIDDLE_NAME</th>
                     <th>START_DATE</th>
                     <th>Term</th>
                     <th>Title</th>
                     <th>Action</th>
        </thead>

<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try {

connectionManager conn = new connectionManager();
String query = "select * from TBL_TRAINEE  where PHONE='"+no+"'";
Statement st = conn.getconnection().createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<form method="post" action="updateTrainee.jsp">
    <td><input type="text" name="bdate" value="<%=rs.getString("BIRTH_DATE")%>" class="form-control"></td>
    <td><input type="text" name="department" value="<%=rs.getString("DEPARTENT")%>" class="form-control"></td>
    <td><input type="text" name="enddate" value="<%=rs.getString("END_DATE")%>" class="form-control"></td>
    <td><input type="text" name="firstname" value="<%=rs.getString("FIRST_NAME")%>" class="form-control"></td>
    <td><input type="text" name="lastname" value="<%=rs.getString("LAST_NAME")%>" class="form-control"></td>
    <td><input type="text" name="middlename" value="<%=rs.getString("MIDDLE_NAME")%>" class="form-control"></td>
   <td><input type="text" name="startdate" value="<%=rs.getString("START_DATE")%>" class="form-control"></td>
    <td><input type="text" name="term" value="<%=rs.getString("TERM")%>" class="form-control"></td>
    <td><input type="text" name="title" value="<%=rs.getString("TITLE")%>" class="form-control"></td>
<td><input type="hidden" name="phone" value="<%=rs.getString(7)%>"></td>
<td><input type="submit" name="Submit" value="Update" class="btn btn-primary"style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</tr>
    </form>

</tr>
<%
}
}
catch(Exception e){}
%>
</table>
<script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
$(document).ready(function() {
    $('#table_view').DataTable();
} );
    </script>  