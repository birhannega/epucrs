/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.CourseAssignmentModel;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author user
 */
@WebServlet(name = "CourseInstServlet", urlPatterns = {"/CourseInstServlet"})
public class CourseInstServlet extends HttpServlet {

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
        CourseAssignmentModel crsass=new CourseAssignmentModel();
        
        String crsname[]=request.getParameterValues("crsname[]");
   String acdstaffid=request.getParameter("staffid");
//   String crsname=request.getParameter("crsname");
   String dateassigned=request.getParameter("assigndate");  
String round=request.getParameter("round");  
String totalH=request.getParameter("totalhour");  
String durationFrom=request.getParameter("durationfrom");  
String durationTo=request.getParameter("durationto");  
out.print(durationTo);
out.print(crsname);
int is_registered=0;

          int j=0;
   for(int i=0;i<crsname.length;i++){  
         is_registered = crsass.courseassign(acdstaffid, crsname[i],dateassigned, round, totalH, durationFrom, durationTo);
//          is_registered = crsass.courseassign(crsname[i]);
   }   

         if (is_registered> 0) {
            request.getSession().setAttribute("instreg", "<strong><span class='alert alert-success text-center'>Course List successfully registred</span></strong>");
            response.sendRedirect("Department/CourseAssigntoInstructor.jsp");
            //out.println("course successfully registred");
        } else {
            request.getSession().setAttribute("instNotreg", "<strong><span class='alert alert-success text-center' style='color: red'>Course List  not registred</span></strong>");
            response.sendRedirect("Department/CourseAssigntoInstructor.jsp");
            // out.println("Instructor not registred");
           
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
            Logger.getLogger(CourseInstServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CourseInstServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CourseInstServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CourseInstServlet.class.getName()).log(Level.SEVERE, null, ex);
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
