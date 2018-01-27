<%-- 
    Document   : CoursePopulate
    Created on : 27-Dec-2017, 05:44:08
    Author     : efrem
--%>


<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String programm=request.getParameter("program");  
 String buffer="<select name='course' ><option value='-1'>Select</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from TBL_COURSE_REGISTRATION where PROGRAM_ID='"+programm+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(9)+"'>"+rs.getString(9)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>