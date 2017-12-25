
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String varname=request.getParameter("instructorname");  
//out.print(varname);
// String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("select CLASSASSIGN_ID, CLASS_ID ,ASSIGN_DATE , TIME_FROM ,TIME_TO  from TBL_CLASS_ASSIGN where ACADEMIC_STAFF_ID='"+varname+"' "); 

 out.print("<table  class='table table-striped table-bordered table-hover'>"
      +"<thead>"
         +"<th>ClassAssignID</th>"
          +"<th>Class id</th>"
          +"<th>Assign Date</th>"
           +"<th>Time  From</th>"
           +" <th>Time  To</th>"
               +" </thead><tbody>"
       
 );
 
 
   while(rs.next()){
       String clsAssid=rs.getString("CLASSASSIGN_ID");
        String clsid=rs.getString("CLASS_ID");
         String assdate=rs.getString("ASSIGN_DATE");
          String timefrom=rs.getString("TIME_FROM");
           String timeto=rs.getString("TIME_TO");
       
 out.println("<tr>"
         + "<td>"+clsAssid+"</td> "
         + "<td>"+clsid+"</td> "
         + "<td>"+assdate+"</td> "
         + "<td>"+timefrom+"</td> "
         + "<td>"+timeto+"</td> "
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