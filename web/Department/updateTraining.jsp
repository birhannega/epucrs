<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>

<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String name=request.getParameter("name");
String TITLE=request.getParameter("address");
String PRE_REQUEST=request.getParameter("contact");
String pre_request=request.getParameter("pre_request");
String course=request.getParameter("coursetype");
try{
connectionManager conn = new connectionManager();

Statement st=null;
st=conn.getconnection().createStatement();
st.executeUpdate("update TBL_TRAINING set COURSE_CODE='"+name+"',COURSE_NAME='"+TITLE+"',TITLE='"+PRE_REQUEST+"',PRE_REQUEST='"+pre_request+"',COURSE_TYPE='"+course+"' where CREDIT_HOUR='"+num+"' ");
response.sendRedirect("../Department/TrainingView.jsp");
}
catch(Exception e){
System.out.println(e);
    }
%>