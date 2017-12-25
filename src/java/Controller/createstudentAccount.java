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
import java.time.LocalDate;
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
@WebServlet(name = "createstudentAccount", urlPatterns = {"/createaccount"})
public class createstudentAccount extends HttpServlet {

    connectionManager dbcon = new connectionManager();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String status = "active";
            String student_id = request.getParameter("stud_id");
            java.sql.Date currentdate = java.sql.Date.valueOf(LocalDate.MAX);

            StudentManagement user_creation = new StudentManagement();
            Connection connection = dbcon.getconnection();
            Statement statement = connection.createStatement();
            int user_created = 0;
            String confirmation;
            HttpSession session = request.getSession();
            ResultSet rs_user = statement.executeQuery("Select * from STUD_ACCOUNT where stud_id='" + student_id + "'");
            if (rs_user.next()) {
                confirmation = " You already have an account";
                session.setAttribute("message", confirmation);
                 response.sendRedirect("Student/finish.jsp");

            } else {
                user_created = user_creation.createAccount(username, password, student_id, status, currentdate);
            }
            if (user_created >= 1) {
                confirmation = " User created successfully";
                session.setAttribute("message", confirmation);
                response.sendRedirect("Student/finish.jsp");
            } else {
                confirmation = " User not created";
                session.setAttribute("message", confirmation);
                response.sendRedirect("Student/finish.jsp");

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
            Logger.getLogger(createstudentAccount.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(createstudentAccount.class.getName()).log(Level.SEVERE, null, ex);
            
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
