/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.CourseAssignmentModel;
import Model.CourseManagement;
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
@WebServlet(name = "CourseAssignment", urlPatterns = {"/CourseAssignment"})
public class CourseAssignmentServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        /// String instid="-100";
        String selectinstr = request.getParameter("selectinstr"),
                course = request.getParameter("course"),
                dateassigned = request.getParameter("dateassigned"),
               round = request.getParameter("round"),
                totalH = request.getParameter("totalH"),
                durationFrom = request.getParameter("durationFrom"),
               durationTo = request.getParameter("durationTo"),
                 instid = round.concat("-100"),
                 courseid = round.concat("-01");
                  
        //  instid=subject.concat("instid");
//        PrintWriter out=response.getWriter();
//        out.println("Entered inputs "+term+" "+courseName);
// creating object of entity class
        CourseAssignmentModel instreg = new CourseAssignmentModel();
        int is_registered = instreg.courseAssignment(instid,courseid, dateassigned, round, totalH, durationFrom, durationTo);
        if (is_registered > 0) {
            request.getSession().setAttribute("instructorAssigned", "<strong><span class='alert alert-success text-center'>Instructor Assigned successfully</span></strong>");
            response.sendRedirect("Department/StaffRegistration.jsp");
            //out.println("course successfully registred");
        } else {
            request.getSession().setAttribute("instructorNotAssigned", "<strong><span class='alert alert-success text-center'>Instructor not assigned</span></strong>");
            response.sendRedirect("Department/StaffRegistration.jsp");
            //  out.println("course not registred");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CourseAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CourseAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
