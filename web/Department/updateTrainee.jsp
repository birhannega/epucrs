<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>

<%
String ide=request.getParameter("phone");
int num=Integer.parseInt(ide);
String bdate=request.getParameter("bdate");
String department=request.getParameter("department");
String enddate=request.getParameter("enddate");
String firstnem=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String middlename=request.getParameter("middlename");
String startdate=request.getParameter("startdate");
String term=request.getParameter("term");
String title=request.getParameter("title");
try{
connectionManager conn = new connectionManager();

Statement st=null;
st=conn.getconnection().createStatement();
st.executeUpdate("update TBL_TRAINEE set BIRTH_DATE='"+bdate+"',DEPARTENT='"+department+"',END_DATE='"+enddate+"',"
        + "FIRST_NAME='"+firstnem+"',LAST_NAME='"+lastname+"',MIDDLE_NAME='"+middlename+"',"
        + "START_DATE='"+startdate+"',TERM='"+term+"',title='"+title+"' where PHONE='"+num+"'");
response.sendRedirect("../Department/Viewtrainee.jsp");
}
catch(Exception e){
System.out.println(e);
    }
%>