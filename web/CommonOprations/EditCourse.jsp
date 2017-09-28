<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>

<%
    if (request.getParameter("edit_id").trim() != null || request.getParameter("edit_id").length() > 0) {
        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
        Statement st_delete = con.createStatement();
     
        ResultSet rs_delete = st_delete.executeQuery("UPDATE TBL_COURSE_REGISTRATION SET COURSE_CODE = '?', DEPARTMENT='?', PROGRAM='?' ,TERM= '?' ,COURSE_NAME='?', ADDED_DATE='?' ,COURSE_TYPE='?' ,CREDIT_HOURS='?',PRE_REQUEST='?' WHERE CustomerID = 1; where COURSE_CODE='" + request.getParameter("edit_id") + "'");
        if (rs_delete.next()) {
//             response.sendRedirect("Department/CourseRegistration.jsp");
            out.println("course successfully updated");
            
            
        } else {
            out.println("update failed");
        }

    }
%>