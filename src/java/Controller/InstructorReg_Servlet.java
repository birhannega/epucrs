/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.InstructorRegModel;
import dbconnection.connectionManager;
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
@WebServlet(name = "InstructorReg_Servlet", urlPatterns = {"/InstructorReg_Servlet"})
public class InstructorReg_Servlet extends HttpServlet {

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
        String instid = request.getParameter("instid"), ImageFile = request.getParameter("ImageFile"),
                insttitle = request.getParameter("insttitle"), firsname = request.getParameter("firsname"),
                middlename = request.getParameter("middlename"), lastname = request.getParameter("lastname"),
                phoneno = request.getParameter("phoneno"),
                email = request.getParameter("email"), department = request.getParameter("department"),
                salary = request.getParameter("salary"),
                status = request.getParameter("status"), insttype = request.getParameter("insttype"),
                responsibility = request.getParameter("responsibility"),
                 hireddate = request.getParameter("hireddate"),
                description = request.getParameter("description");

        InstructorRegModel instreg = new InstructorRegModel();
        int is_registered = instreg.instructor_registration(instid, ImageFile, insttitle, firsname, middlename, lastname, phoneno,
                email, department, salary, status, insttype, responsibility,hireddate, description);
        if (is_registered > 0) {
            request.getSession().setAttribute("instreg", "<strong><span class='alert alert-success text-center'>Instructor successfully registred</span></strong>");

            response.sendRedirect("Department/InstructorRegistration.jsp");
            //out.println("course successfully registred");
        } else {

            out.println("Instructor not registred");
        }

//                               courseName=request.getParameter("coursename");
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
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
