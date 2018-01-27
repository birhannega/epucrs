
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String program=request.getParameter("program");  
 String buffer=""
         + "<select name='course' >"
         + "<option value='-1'>Select course"
         + "</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from tbl_course_registration where PROGRAM_ID='"+program+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString("course_code")+"'>"+rs.getString("course_NAME")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>