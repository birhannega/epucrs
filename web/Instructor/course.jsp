
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String program=request.getParameter("programname");  
 String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement(); 

 ResultSet rs = stmt.executeQuery("Select course_code from TBL_COURSE_REGISTRATION ");  
   while(rs.next()){
       
   buffer=buffer+"<option value='"+rs.getString("course_code")+"'>"+rs.getString("course_code")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>