<%-- 
    Document   : coursecheckbox
    Created on : 09-Nov-2017, 06:16:56
    Author     : user
--%>

<%@page import="dbconnection.connectionManager"%>
<%--<%@page import="java.lang.System.out"%>--%>
<%--<%@page import="java.lang.System.out"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE">
<%@page import="java.sql.*"%>
<%--<%@page import="java.sql.*"%>--%>
<%

String crsname[]=request.getParameterValues("crsname");
String acdstaffid=request.getParameter("acdstaffid");

  

        try{
        connectionManager dbconnection = new connectionManager();
        Statement st_course = dbconnection.getconnection().createStatement();
//        Statement st=con.createStatement();
int j=0;
for(int i=0;i<crsname.length;i++){
         j=st_course.executeUpdate("insert into TBL_COURSE_LIST(ACADEMIC_STAFF_ID,COURSE_CODE) values('"+acdstaffid+"','"+crsname[i]+"')");
//        out.println("Data is successfully inserted.");
}
         if (j> 0) {
            request.getSession().setAttribute("instreg", "<strong><span class='alert alert-success text-center'>Course List successfully registred</span></strong>");
            response.sendRedirect("CourseListInstructor.jsp");
            //out.println("course successfully registred");
        } else {
            request.getSession().setAttribute("instNotreg", "<strong><span class='alert alert-success text-center' style='color: red'>Course List  not registred</span></strong>");
            response.sendRedirect("CourseListInstructor.jsp");
            // out.println("Instructor not registred");
        }      
        }
        catch(Exception e){
        System.out.println(e);
        
       } %>