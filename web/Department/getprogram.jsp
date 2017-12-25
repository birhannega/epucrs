<link href="../assets/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.Connection"%>
<link href="../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String program=request.getParameter("program");  
  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select distinct stud_id,room,grade,course_code from tbl_Mark where PROGRAM='"+program+"'"); 
 out.print("<p>List of the selected program</p>"
         +"<table class='table table-bordered'>"
         + "<thead> "
         + "<th>Student ID</th>"
         + "<th>Room</th>"
         + "<th>Grade</th>"
         + "<th>Course</th>"
         + "<tbody>");
%>
   
<%
   while(rs.next())
           {
       String id=rs.getString("Stud_id");
       String mark40=rs.getString("room");
       String mark60=rs.getString("grade");
       String total=rs.getString("course_code");
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