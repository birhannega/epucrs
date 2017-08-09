
<html>
    <body>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%
connectionManager dbcon=new connectionManager();
Statement statement=dbcon.getconnection().createStatement();
String dept=request.getParameter("department");

if(dept.length()>=0 || dept.trim()!=null)

{
    
	//$query ="SELECT * FROM states WHERE countryID = '" . $_POST["country_id"] . "'";
    String query="select * from TBL_program where Dep_id='%>
    <script>
        document.getElementById("department");
    </script><% '";
    
    ResultSet res_prog=statement.executeQuery(query);
    
	//$results = $db_handle->runQuery($query);
        while(res_prog.next())
        {
         //   /*String*/ [] valur=res_prog.getArray(1);
        }
        
    }

    %>
    
    </body>
</html>    