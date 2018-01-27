/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.CourseManagement;
import Model.CourseUpdateModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "CourseUpdateServlet", urlPatterns = {"/CourseUpdateServlet"})
public class CourseUpdateServlet extends HttpServlet {

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
       String edited_department = request.getParameter("edited_department"),
                edited_program = request.getParameter("edited_program"),
//                edited_term = request.getParameter("edited_term"),
                edited_coursename = request.getParameter("edited_coursename"),
//                edited_crsofferingyear = request.getParameter("edited_crsofferingyear"),
                edited_credit_hour = request.getParameter("edited_credit_hour"),
                edited_prerequest = request.getParameter("edited_prerequest"),
               edit_coursetype = request.getParameter("edit_coursetype"),
               edit_academicyear=request.getParameter("edit_academicyear"), 
              edit_courseapproach=request.getParameter("edit_courseapproach"),
                 coursecode = request.getParameter("edit_coursecode"),
               
        edit_COURSE_SEQNO = request.getParameter("edit_COURSE_SEQNO");
        //String course_code = courseName.concat("-200");
//        PrintWriter out=response.getWriter();
//        out.println("Entered inputs "+term+" "+courseName);
// creating object of entity class
        CourseUpdateModel  courseupdate = new CourseUpdateModel();
        int is_registered = courseupdate.updateCourse(coursecode,edited_department, edited_program, edited_coursename,  edited_credit_hour, edited_prerequest,edit_coursetype,edit_academicyear,edit_courseapproach,edit_COURSE_SEQNO);
        if (is_registered > 0) {
            request.getSession().setAttribute("courseUpdate", "<strong><span class='alert alert-success text-center'>Course successfully Updated</span></strong>");

            response.sendRedirect("Registrar/CourseRegistration.jsp");
            //out.println("course successfully registred");
        } else {
             request.getSession().setAttribute("courseNotUpdate", "<strong><span class='alert alert-warning text-center'>Course not Updated</span></strong>");
            response.sendRedirect("Registrar/CourseRegistration.jsp");
//             out.println("course not registred");
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
            Logger.getLogger(CourseUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(CourseUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
