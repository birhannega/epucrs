/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.InstructorRegModel;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
@WebServlet(name = "InstructorReg_Servlet", urlPatterns = {"/InstructorReg_Servlet"})
@MultipartConfig(maxFileSize = 16177215)

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
         InputStream inputStram=null;       
        PrintWriter out = response.getWriter();
        
        connectionManager con = new connectionManager();
        Connection connection = con.getconnection();
        Statement statement = connection.createStatement();
        String instid = request.getParameter("instid"),
           insttitle = request.getParameter("insttitle"), 
                   firstname = request.getParameter("firstname"),
                middlename = request.getParameter("middlename"), lastname = request.getParameter("lastname"),
                phoneno = request.getParameter("phoneno"),
                email = request.getParameter("email"), department = request.getParameter("department"),
                status = request.getParameter("status"), insttype = request.getParameter("insttype"),
                responsibility = request.getParameter("responsibility"),
                hireddate = request.getParameter("hireddate"),
                policemngmt = request.getParameter("policemngmt"),
                description = request.getParameter("description");
               Part filePart = request.getPart("ImageFile"); // Retrieves <input type="file" name="file">

            // creating object of model class
        InstructorRegModel instreg = new InstructorRegModel();
         // check if this id is already registered
        boolean idexists=instreg.checkIfIDExists(instid);
        if(idexists)
        {
             request.getSession().setAttribute("instreg", "<strong><div class='alert alert-warning text-center'>Instructor already registred</div></strong>");
            response.sendRedirect("Registrar/Staffregistration.jsp");
        }
        else
        {
        
        int is_registered = instreg.instructor_registration(instid, filePart,insttitle, firstname, middlename, lastname, phoneno,
                email, department, status, insttype, responsibility, hireddate, policemngmt, description);
        if (is_registered > 0) {
            request.getSession().setAttribute("instreg", "<strong><div class='alert alert-success text-center'>Instructor successfully registred</div></strong>");
            response.sendRedirect("Registrar/Staffregistration.jsp");
            //out.println("course successfully registred");
        } else {
            request.getSession().setAttribute("instid", "<strong><div class='alert alert-success text-center' style='color: red'>Instructor not registred</div></strong>");
            response.sendRedirect("Registrar/Staffregistration.jsp");
            // out.println("Instructor not registred");
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
            } catch (SQLException | ClassNotFoundException ex) {
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
        } catch (SQLException | ClassNotFoundException ex) {
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
