<%@page import="dbconnection.connectionManager"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='editTraining.jsp?id='+id;
    f.submit();
}
function deleteRecord(id){
    var f=document.form;
    
    f.method="post";
    f.action='deleteTraining.jsp?id='+id;
 
    var result=confirm("are you sure to delete?");
   
    if(result)
     
    {
    f.submit();
    }
    else
    {
        return false;
    }
  
}
</script>
</head>
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
            <span class="text-success">${sucessful}</span>
            <%request.getSession().setAttribute("sucessful",null);%>
            <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
<div class="col-lg-10 col-md-10 col-xs-8 col-sm-8">
<form method="post" name="form">
    <table id="table_view" class="display responsive nowrap" width="100%" cellspacing="0">
        <thead>
         
        <th>Course code</th>
            <th>Course Name</th>
            <th>Title</th>
                <th>Pre_request</th>
                    <th>Course Type</th>
                    <th>Edit</th>
                      <th>Update</th>
        </thead>
        
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
<%
    connectionManager con=new connectionManager();
//Connection con = null;
//String url = "jdbc:mysql://localhost:3306/";
//String db = "test";
//String driver = "com.mysql.jdbc.Driver";
//String userName ="root";
//String password="root";

int sumcount=0;

Statement st;
try{
//Class.forName(driver).newInstance();
//con = DriverManager.getConnection(url+db,userName,password);
String query = "select * from TBL_TRAINING ";
st = con.getconnection().createStatement();
ResultSet rs = st.executeQuery(query);
%>

<%
while(rs.next()){
%>
<tr>
    <td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><input type="button" name="edit" value="Edit" class="btn btn-primary"style="background-color:#49743D;font-weight:bold;color:#ffffff;" onclick="editRecord(<%=rs.getString(1)%>);" ></td>
<td><input type="button" name="delete" value="Delete"class="btn btn-warning" style="background-color:#ff0000;font-weight:bold;color:#ffffff;" onclick="deleteRecord(<%=rs.getString(1)%>);" ></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</table>
</form>
</div>
</body>
</html>
