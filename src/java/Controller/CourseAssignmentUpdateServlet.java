/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.CourseAssignmentModel;
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
@WebServlet(name = "CourseAssignmentUpdateServlet", urlPatterns = {"/CourseAssignmentUpdateServlet"})
public class CourseAssignmentUpdateServlet extends HttpServlet {

    CourseAssignmentModel crsassmodel=new CourseAssignmentModel();
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
 
        String   
               instnameupdate=request.getParameter("instnameupdate"),
             crsnameupdate=request.getParameter("crsnameupdate"),
             dateassignedupdate=request.getParameter("dateassignedupdate"),
             roundupdate=request.getParameter("roundupdate"),
             totalHupdate=request.getParameter("totalHupdate"),
             durationFromupdate=request.getParameter("durationFromupdate"),
             durationToupdate=request.getParameter("durationToupdate"),
                crsseqno=request.getParameter("crsseqno");

     int save_class=crsassmodel.CourseAssign_Update(instnameupdate,crsnameupdate,dateassignedupdate,roundupdate, totalHupdate,durationFromupdate,durationToupdate,crsseqno);
       if (save_class > 0) {
            request.getSession().setAttribute("CrsAssUpdate", "<strong><span class='alert alert-success text-center'>Course Assignment successfully Updated</span></strong>");

            response.sendRedirect("Department/CourseAssigntoInstructor.jsp");
            //out.println("course successfully registred");
        } else {
             request.getSession().setAttribute("CrsAssNotUpdate", "<strong><span class='alert alert-success text-center'>Course Assignment Not successfully Updated</span></strong>");
            response.sendRedirect("Department/CourseAssigntoInstructor.jsp");
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
            Logger.getLogger(CourseAssignmentUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseAssignmentUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CourseAssignmentUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CourseAssignmentUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
