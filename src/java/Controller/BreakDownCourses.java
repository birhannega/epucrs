/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.CourseManagement;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luv2codeit
 */
@WebServlet(name = "BreakDownCourses", urlPatterns = {"/breakDownCourses"})
public class BreakDownCourses extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String department = request.getParameter("department"),
                    program = request.getParameter("program"),
                    course = request.getParameter("course"),
                    term = request.getParameter("term");
            CourseManagement course_breakdown = new CourseManagement();
            String message=null;
            HttpSession session=request.getSession();
            
            connectionManager connectmgr=new connectionManager();
          Statement st_check=connectmgr.getconnection().createStatement();
          ResultSet rs_check=st_check.executeQuery("select * from TBL_COURSE_BREAKDOWN where COURSE_ID='"+course+"'");
          if(rs_check.next())
          {
              message="<div class='alert alert-warning'>breakdown already done</div>";
                session.setAttribute("message", message);
              response.sendRedirect("Registrar/courseBreakdown.jsp");
          }
          else
          {
            
            int breakdown=course_breakdown.coursebreakdown(department, program, course, term);
            if(breakdown>=1)
            {
                 message="<div class='alert alert-success'>course breakdown  successfully saved</div>";
                   session.setAttribute("message", message);
              response.sendRedirect("Registrar/courseBreakdown.jsp");
            }else
            {
                message="<div class='alert alert-warning'>course breakdown not successfull</div>";
                session.setAttribute("message", message);
                  response.sendRedirect("Registrar/courseBreakdown.jsp");

            }
            
          }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BreakDownCourses.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(BreakDownCourses.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "course offering servlet";
    }// </editor-fold>

}
