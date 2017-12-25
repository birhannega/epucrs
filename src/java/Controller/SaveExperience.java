/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.StudentManagement;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luv2codeit
 */
@WebServlet(name = "SaveExperience", urlPatterns = {"/SaveExperience"})
public class SaveExperience extends HttpServlet {

    connectionManager connection = new connectionManager();
    Connection con;

    public SaveExperience() throws ClassNotFoundException, SQLException {
        this.con = connection.getconnection();
    }

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nameofemp = request.getParameter("employer"),
                    studid = request.getParameter("studid"),
                    address = request.getParameter("address"),
                    employertel = request.getParameter("employertel"),
                    title = request.getParameter("title"),
                    salary = request.getParameter("salary"),
                    dateofemployment = request.getParameter("dateofemployment"),
                    totalexp = request.getParameter("totalexp");

            StudentManagement experienceregistration = new StudentManagement();
            String message = null;
            HttpSession session = request.getSession();
            Statement statment = con.createStatement();
            ResultSet rs_check = statment.executeQuery("Select * from TBL_STUD_EXPERIENCE where stud_id='" + studid + "'");
            if (rs_check.next()) {
                 session.setAttribute("experience", "Experience already saved continue to your Eslce");
              response.sendRedirect("Student/eslce.jsp");
            } else {
                int expreg = experienceregistration.StudentExperience(studid, nameofemp, address, employertel, title, salary, dateofemployment, totalexp);
                if (expreg >= 1) {
                
                    session.setAttribute("experience", "Experience successfully saved");
                    response.sendRedirect("Student/eslce.jsp");
                }
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SaveExperience.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SaveExperience.class.getName()).log(Level.SEVERE, null, ex);
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
