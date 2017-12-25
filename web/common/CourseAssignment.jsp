<%-- 
    Document   : CourseAssignment
    Created on : 25-Oct-2017, 03:52:33
    Author     : efrem
--%>


<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String department=request.getParameter("department");  
 String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from TBL_ACADEMIC_PROGRAM where Dep_id='"+department+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>