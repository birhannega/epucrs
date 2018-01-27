<%@page import="java.sql.Connection"%>
    <head>
     <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    
           </head>
   <div class="col-lg-12">
                  <table id="table" class="table table-striped table-bordered dt-responsive nowrap" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Room</th>
                <th>Grade</th>
                <th>Course</th>
                 </tr>
        </thead>
        <tbody>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String program=request.getParameter("program");  
  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select distinct stud_id,room,grade,course_code from tbl_Mark where PROGRAM_id='"+program+"'"); 

%>
   
<%
   while(rs.next())
           {
       String id=rs.getString("Stud_id");
       String mark40=rs.getString("room");
       String mark60=rs.getString("grade");
       String total=rs.getString("course_code");
%><tr>
    <td><%=id%></td>
        <td><%=mark40%></td>
            <td><%=mark60%></td>
                <td><%=total%></td>
</tr>

            <%
   } 
%>
        </tbody>
                  </table>

    <%
 

 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
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
              
   </div>
                           
       
