<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<%
connectionManager dbcon=new connectionManager();
Statement statement=dbcon.getconnection().createStatement();
String sql="select * from tbl_users where user_id='admin'";
ResultSet rs=statement.executeQuery(sql);
String string="admin";
if(rs.next())
{
String user=rs.getString("user_id");

out.println(user.length());
out.println(string.length());
}

%>