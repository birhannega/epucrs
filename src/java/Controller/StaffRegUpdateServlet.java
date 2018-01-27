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
@WebServlet(name = "StaffRegUpdateServlet", urlPatterns = {"/StaffRegUpdateServlet"})
public class StaffRegUpdateServlet extends HttpServlet {

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
       String   acdstaffid = request.getParameter("acdstaffid"),
               insttitleupdate = request.getParameter("insttitleupdate"),
                instnameupdate = request.getParameter("crsnameupdate"),
                instMiddlenameupdate = request.getParameter("instMiddlenameupdate"),
               instLastnameupdate = request.getParameter("instLastnameupdate"),
                phonenoupdate = request.getParameter("phonenoupdate"),
                emailupdate = request.getParameter("emailupdate"),
                departmentupdate = request.getParameter("departmentupdate"),
                statusupdate = request.getParameter("statusupdate"),
                staftype = request.getParameter("staftype"),
               responsibilityupdate = request.getParameter("responsibilityupdate"),
               hireddateupdate = request.getParameter("hireddateupdate"),
               polcemngmtupdate = request.getParameter("polcemngmtupdate"),
               descriptionupdate  = request.getParameter("descriptionupdate"),
                 coursecode = request.getParameter("coursecode");
        //String course_code = courseName.concat("-200");
//        PrintWriter out=response.getWriter();
//        out.println("Entered inputs "+term+" "+courseName);
// creating object of entity class
        InstructorRegModel  staffregupdate = new InstructorRegModel();
        int is_registered = staffregupdate.UpdateStaffReg(acdstaffid,insttitleupdate, instnameupdate,instMiddlenameupdate, instLastnameupdate, phonenoupdate, emailupdate, departmentupdate, statusupdate, staftype,responsibilityupdate,hireddateupdate,polcemngmtupdate,descriptionupdate);
        if (is_registered > 0) {
            request.getSession().setAttribute("staffinfoUpdate", "<strong><span class='alert alert-success text-center'>Staff Info successfully Updated</span></strong>");

            response.sendRedirect("Registrar/StaffRegistration.jsp");
            //out.println("course successfully registred");
        } else {
             request.getSession().setAttribute("staffinfoNotUpdate", "<strong><span class='alert alert-warning text-center'>Staff Info  not Updated</span></strong>");
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
            Logger.getLogger(StaffRegUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StaffRegUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(StaffRegUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StaffRegUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
