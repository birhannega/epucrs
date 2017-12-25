
<%@page import="java.sql.Connection"%>
<script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>
  
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
 <table id="report" class="table table-striped table-bordered" width="100%" cellspacing="0">
     <thead><th>Student Id </th>
  <th>Student Name </th>
 <th>Mark40</th>
 <th>mark_60 </th></thead>

<%
String term=request.getParameter("term");  
  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from tbl_Mark where term='"+term+"'"); %>



  <% while(rs.next())
           {
       String id=rs.getString("Stud_id");
       String mark40=rs.getString("mark_40");
       String mark60=rs.getString("mark_60");
       String total=rs.getString("total");%>
  <tbody><tr><td><%=id%></td>
  <td><%=mark40%></td>
  <td><%=mark60%></td>
  <td><%=total%></td></tr></tbody>
 <%  } 

%>
    

    <%
 
 out.println("</tbody></table>");
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
 
</table>
 <script type="text/javascript">
   $(document).ready(function (){
    $('#report').DataTable();  
   });
     </script>
 <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
 <div class="nopint col-lg-offset-10">
					<button id="printpagebutton" type="button" class="btn btn-primary "
						onclick="printpage()">
						<span class="glyphicon glyphicon-print"> <strong>print
								reports</strong>
						</span>
					</button>
				</div>
<script type="text/javascript">
		function printpage() {
		    //Get the print button and put it into a variable
		    var printButton = document.getElementById("printpagebutton");
		    //Set the print button visibility to 'hidden' 
		    printButton.style.visibility = 'hidden';
		    //Print the page content
		    window.print()
		    //Set the print button to 'visible' again 
		    //[Delete this line if you want it to stay hidden after printing]
		    printButton.style.visibility = 'visible';
		}


		</script>