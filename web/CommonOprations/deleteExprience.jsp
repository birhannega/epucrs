<%-- 
    Document   : deleteExprience
    Created on : 20-Oct-2017, 12:18:17
    Author     : Efrem
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html ">
<%
    connectionManager connnmgr = new connectionManager();
    Connection con = connnmgr.getconnection();
    Statement getdept = con.createStatement();

    if (request.getParameter("action") != null && request.getParameter("id") != null) {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (action.equalsIgnoreCase("delete")) {
            //Alert="";
            ResultSet rs_delete = getdept.executeQuery("delete from TBL_ACADEMIC_EXPERTISE where ACADEMIC_EXPERTIES_SEQNO='" + id + "'");
          while (rs_delete.next()) {
              request.getSession().setAttribute("academicexpRegistered", "<strong><span class='alert alert-success text-center'> Expriance deleted successfully </span></strong>");

            response.sendRedirect("Department/AcademicStaffRegistration.jsp"); 
          
          }
           request.getSession().setAttribute("academicexpNotRegistered", "<strong><span class='alert alert-success text-center'>Expriance not deleted</span></strong>");
            response.sendRedirect("Department/AcademicStaffRegistration.jsp");
        }
    }

%>