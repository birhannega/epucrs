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
@WebServlet(name = "savePsei", urlPatterns = {"/savePsei"})
public class savePsei extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String program = request.getParameter("program_attended"),
                    institution = request.getParameter("institution"),
                    field = request.getParameter("field"),
                    start_from = request.getParameter("start_from"),
                    end_study = request.getParameter("start_end"),
                    cgpa = request.getParameter("cgpa"),
                    studentId = request.getParameter("studentId");
            HttpSession session = request.getSession();
            StudentManagement psei_registration = new StudentManagement();
            connectionManager connManager = new connectionManager();

            Connection check_con = connManager.getconnection();
            Statement st_ck = check_con.createStatement();
            ResultSet rs_ck = st_ck.executeQuery("select * from TBL_PSEI where Stud_id='" + studentId + "' and PROGRAM_ATENDEd like '" + program + "' and NAME_OF_INSTITUTION like '" + institution + "'");
            if (rs_ck.next()) {
                session.setAttribute("recorded", "This data is already recorded please add more (if any) else go next wizrd");
                response.sendRedirect("Student/experience.jsp");
            } else {
                int register = psei_registration.STUD_PSEI(institution, program, studentId, field, start_from, end_study, cgpa);

                if (register >= 1) {
                    session.setAttribute("pseisaved", "Student PSEI saved successfully");
                    response.sendRedirect("Student/experience.jsp");
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
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(savePsei.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(savePsei.class.getName()).log(Level.SEVERE, null, ex);
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
