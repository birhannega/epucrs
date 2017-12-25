<%-- 
    Document   : CourseSelection
    Created on : 26-Oct-2017, 04:35:31
    Author     : efrem
--%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String varcrsassignment=request.getParameter("selectinstr");  
//out.print(varname);
// String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("select ACADEMIC_STAFF_ID, COURSE_CODE  from TBL_COURSEASSIGNMENT where ACADEMIC_STAFF_ID='"+varcrsassignment+"' "); 

 out.print("<table  class='table table-striped table-bordered table-hover'>"
      +"<thead>"
          +"<th>STAFF ID</th>"
           +"<th>COURSE_CODE</th>"
           +" </thead><tbody>"
       
 );
 
 
   while(rs.next()){
       String Acdstfid=rs.getString("ACADEMIC_STAFF_ID");
        String crsid=rs.getString("COURSE_CODE");
       
       
 out.println("<tr>"
         + "<td>"+Acdstfid+"</td> "
         + "<td>"+crsid+"</td> "
        +"</tr>"
                                           );
   }
   out.print("</tbody></table>");
// buffer=buffer+"</select>";  
// response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>