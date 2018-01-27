
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String bach=request.getParameter("bach");  
  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from tbl_Mark,TBL_STUDENT_PROFILE where ACADEMICYEAR='"+bach+"' and TBL_STUDENT_PROFILE.stud_id=tbl_mark.stud_id"); 
 out.print("<table class='table table-bordered'>"
         + "<thead> "
         + "<th>Student ID</th>"
         + "<th>First Name</th>"
         + "<th>Last Name</th>"
         + "<th>Mark(100)</th>"
         + "<tbody>");

   while(rs.next())
           {
       String id=rs.getString("Stud_id");
       String mark40=rs.getString("STUD_FIRST_NAME");
       String mark60=rs.getString("STUD_MIDDLE_NAME");
       String total=rs.getString("total");
      out.println("<tr>"
              + "<td>"+id+"</td>"
              + "<td>"+mark40+"</td>"
              + "<td>"+mark60+"</td>"
              + "<td>"+total+"</td>"
              
              + "</tr>");
   } 
%>
    

    <%
 
 out.println("</tbody></table>");
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
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