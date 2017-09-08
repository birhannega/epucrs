<%@page import="dbconnection.connectionManager"%>
<%@ page import="java.sql.*" %> 
<%
int id = Integer.parseInt(request.getParameter("id"));
try{
         
           connectionManager con = new connectionManager();
                  Statement st=con.getconnection().createStatement();
           int i=st.executeUpdate("delete from TBL_TRAINING where CREDIT_HOUR='"+id+"'");
           request.getSession().setAttribute("sucessful","sucessfuly deleted");
           response.sendRedirect("TrainingView.jsp");
}
catch (Exception e){
System.out.println(e);
}
%>