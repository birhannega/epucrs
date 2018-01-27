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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "CourseServlet", urlPatterns = {"/CourseServlet"})
public class CourseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      
            connectionManager dbconnection = new connectionManager();
            Statement stmt = dbconnection.getconnection().createStatement();
       String course_code = request.getParameter("coursecode");
        ResultSet rs_edit = stmt.executeQuery("select * from TBL_COURSE_REGISTRATION  where COURSE_CODE='" + course_code + "'");
                                if (rs_edit.next()) {
           request.getSession().setAttribute("courseRegistered", "<strong><span class='alert alert-success text-center'>Course Already Registered!</span></strong>");

            response.sendRedirect("Registrar/CourseRegistration.jsp");
                                }
                                else {
        String department = request.getParameter("department"),
                program = request.getParameter("program"),
//                term = request.getParameter("term"),
                courseName = request.getParameter("coursename"),
              
                credithr = request.getParameter("creditH"),
                prerequest = request.getParameter("prerequest"),
                coursetype = request.getParameter("coursetype"),
                  reg_year = request.getParameter("reg_year"),
                courseapproach= request.getParameter("courseapproach");
//                      course_code = request.getParameter("coursecode");
//        Calendar cal=Calendar.getInstance();
//        int year=cal.get(Calendar.YEAR);

        CourseManagement registration = new CourseManagement();
        
        int is_registered = registration.registerCourse(course_code,department, program,courseName, credithr, prerequest,coursetype,courseapproach);
        if (is_registered > 0) {
            request.getSession().setAttribute("courseRegistered", "<strong><span class='alert alert-success text-center'>Course successfully registred</span></strong>");

            response.sendRedirect("Registrar/CourseRegistration.jsp");
            //out.println("course successfully registred");
        } else {
             request.getSession().setAttribute("courseNotRegistered", "<strong><span class='alert alert-success text-center'>Course not registred</span></strong>");
            response.sendRedirect("Registrar/CourseRegistration.jsp");
//             out.println("course not registred");
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
        } catch (SQLException ex) {
            Logger.getLogger(CourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            PrintWriter out = response.getWriter();
            processRequest(request, response);
            connectionManager test = new connectionManager();
            Connection conn;
            try {
                conn = test.getconnection();
                if (conn != null) {

                    // out.print("but connection established successfully");
                } else {
                    out.print("connection error ");
                }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(CourseServlet.class.getName()).log(Level.SEVERE, null, ex.getStackTrace());
            }

        } catch (SQLException ex) {
            Logger.getLogger(CourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
