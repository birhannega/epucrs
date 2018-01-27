<%@page import="java.sql.Connection"%>
    <head>
        <link href="../assets/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
<link href="../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    
        <%@include file="../common/imports.jsp" %>
        <link href="../resources/DataTables-1.10.15/css/responsive.bootstrap.min..css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTables-1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTables-1.10.15/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/DataTables-1.10.15/js/jquery-1.12.4.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/responsive.bootstrap.min.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/dataTables.responsive.min.js" type="text/javascript"></script>
       <script src="../resources/DataTables-1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
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
    

    <%
 
 out.println("</tbody></table>");
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 <div class="nopint col-lg-offset-10">
					<button id="printpagebutton" type="button" class="btn btn-primary "
						onclick="printpage()">
						<span class="glyphicon glyphicon-print"> <strong>Print
								Report</strong>
						</span>
					</button>
				</div>
<script type="text/javascript">
		function printpage() {
		    //Get the print button and put it into a variable
		    var printButton = document.getElementById("printpagebutton");
		    //Set the print button visibility to 'hidden' 
		    printButton.style.visibility = 'hidden';
                    program.style.visibility='hidden';
		    //Print the page content
		    window.print()
		    //Set the print button to 'visible' again 
		    //[Delete this line if you want it to stay hidden after printing]
		    printButton.style.visibility = 'visible';
		}


		</script>
 <style type="text/css">
     @media print {
  @page { margin: 0; }
  body { margin: 1.6cm; }
}
 </style>
                  </tbody>
                  </table>
   </div>
                           
       
            
<script type="text/javascript">
$(document).ready(function() {
    $('#table').DataTable();
} );
    </script> 