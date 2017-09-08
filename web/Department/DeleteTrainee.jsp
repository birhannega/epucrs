<%@page import="dbconnection.connectionManager"%>
<%@ page import="java.sql.*" %> 
<%
int id = Integer.parseInt(request.getParameter("id"));
try{
         
           connectionManager con = new connectionManager();
                  Statement st=con.getconnection().createStatement();
           int i=st.executeUpdate("delete from TBL_TRAINEE where Phone='"+id+"'");
           request.getSession().setAttribute("sucessful","sucessfuly deleted");
           response.sendRedirect("Viewtrainee.jsp");
}
catch (Exception e){
System.out.println(e);
}
%>