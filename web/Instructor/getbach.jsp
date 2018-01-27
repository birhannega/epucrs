
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String bach=request.getParameter("bach");  
  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from tbl_Mark where ACADEMICYEAR='"+bach+"'"); 
 out.print("<table class='table table-bordered'>"
         + "<thead> "
         + "<th>Student ID</th>"
         + "<th>Mark(40)</th>"
         + "<th>Mark(60)</th>"
         + "<th>Mark(100)</th>"
         + "<tbody>");

   while(rs.next())
           {
       String id=rs.getString("Stud_id");
       String mark40=rs.getString("mark_40");
       String mark60=rs.getString("mark_60");
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