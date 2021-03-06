/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.InstructorRegModel;
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
@WebServlet(name = "AcademicExperianceServlet", urlPatterns = {"/AcademicExperianceServlet"})
public class AcademicExperianceServlet extends HttpServlet {

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
          //String expid=request.getParameter("expid");
          String qualification=request.getParameter("qualification");
              String  expctgry=request.getParameter("expctgry"),  
                 exptype=request.getParameter("officetype"), 
                  orgname=request.getParameter("orgname"), 
                  totalexp=request.getParameter("totalexp"), 
                  datefrom_exp_from=request.getParameter("datefrom_exp_from"),  
                 datefrom_exp_to=request.getParameter("datefrom_exp_to") ;
           
          String  expid = expctgry.concat("-100");
           String  staffid = expctgry.concat("-100");
//        PrintWriter out=response.getWriter();
//        out.println("Entered inputs "+term+" "+courseName);
// creating object of entity class
        InstructorRegModel instreg = new InstructorRegModel();
        int is_registered = instreg.instructor_exp_reg(staffid,expid,expctgry, exptype, orgname, totalexp, datefrom_exp_from, datefrom_exp_to,qualification);
        if (is_registered > 0) {
            request.getSession().setAttribute("academicexpRegistered", "<strong><span class='alert alert-success text-center'>Instructor expriance successfully registred</span></strong>");

            response.sendRedirect("Registrar/StaffRegistration.jsp");
            //out.println("course successfully registred");
        } else {
             request.getSession().setAttribute("academicexpNotRegistered", "<strong><span class='alert alert-success text-center'>Instructor expriance not registred</span></strong>");
            response.sendRedirect("Registrar/StaffRegistration.jsp");
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
            Logger.getLogger(AcademicExperianceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AcademicExperianceServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AcademicExperianceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AcademicExperianceServlet.class.getName()).log(Level.SEVERE, null, ex);
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
