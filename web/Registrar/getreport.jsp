
<%@page import="java.sql.Connection"%>
<script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>
  
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
 <table id="report" class="table table-striped table-bordered" width="100%" cellspacing="0">
     <thead><th>Student Id </th>

 <th>Mark40</th>
 <th>mark_60 </th>
   <th> Total</th></thead>
 <%
String term=request.getParameter("term");  
  try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("SELECT  * FROM tbl_mark WHERE   term='"+term+"'" );
while(rs.next())
           {
       String id=rs.getString("Stud_id");
       String mark40=rs.getString("mark_40");
       String mark60=rs.getString("mark_60");
       String total=rs.getString("total");%>
  <tbody><tr><td><%=id%></td>
  <td><%=mark40%></td>
  <td><%=mark60%></td>
  <td><%=total%></td></tr></tbody>
 <%  } 

%>
    

    <%
 
 out.println("</tbody></table>");
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
</table>
 <script type="text/javascript">
   $(document).ready(function (){
    $("report").DataTable();
    alert("seid");
   });
     </script>
   <html>
   <head>
   
   
   </head>
   
   <body>
      
      <form>
          <button id="printpagebutton" type="button" class="btn btn-primary pull-right "
           onclick="window.print()">
	<span class="glyphicon glyphicon-print"> <strong>Print Report</strong>
						</span>
					</button>
         </form>
   
   </body>
<html>

 <style type="text/css">
     @media print {
  @page { margin: 0; }
  body { margin: 1.6cm; }
}
 </style>