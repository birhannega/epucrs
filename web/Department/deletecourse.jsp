<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>

<%
    if (request.getParameter("delete_id").trim() != null || request.getParameter("delete_id").length() > 0) {
        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
        Statement st_delete = con.createStatement();
           HttpSession session1=request.getSession();
        String msg=null;
        ResultSet rs_delete = st_delete.executeQuery("delete from TBL_COURSE_REGISTRATION where COURSE_CODE='" + request.getParameter("delete_id") + "'");
        if (rs_delete.next()) {
   msg="<span class='alert alet-success text-center'>course successfully deleted</span>";
            session1.setAttribute("del", msg);
           response.sendRedirect("CourseRegistration.jsp");
            } else {
             session1.setAttribute("del", msg);
              msg="<span class='alert alet-danger text-center'>course not deleted</span>";
              response.sendRedirect("CourseRegistration.jsp");
          
        }

    }
%>