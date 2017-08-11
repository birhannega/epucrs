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
     
              PrintWriter out=response.getWriter() ;
                /// String instid="-100";
               String selectinstr=request.getParameter("selectinstr"),
                dateassigned=request.getParameter("dateassigned"),
                program=request.getParameter("program"),
                course=request.getParameter("course"),
                creditH=request.getParameter("creditH"),
                datemodified=request.getParameter("datemodified"),
               modifiedby=request.getParameter("modifiedby"),
               period=request.getParameter("period"),
               previousinstructor=request.getParameter("previousinstructor"),
               instid=course.concat("-100");
          //  instid=subject.concat("instid");
//        PrintWriter out=response.getWriter();
//        out.println("Entered inputs "+term+" "+courseName);
// creating object of entity class
 CourseAssignmentModel instreg = new CourseAssignmentModel();
int is_registered= instreg.courseAssignment(instid,selectinstr, dateassigned, program,course, creditH, datemodified,  modifiedby, period, previousinstructor);
if(is_registered>0)
{ 
                    request.getSession().setAttribute("courseRegistered", "<strong><span class='alert alert-success text-center'>Instructor Assigned successfully</span></strong>");

     response.sendRedirect("Department/CourseAssigntoInstructor.jsp");
  //out.println("course successfully registred");
}
else
{

  out.println("course not registred"); 
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
