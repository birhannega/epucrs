/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.StudentManagement;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "registerfamilyinformation", urlPatterns = {"/registerfamilyinformation"})
public class registerfamilyinformation extends HttpServlet {

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
HttpSession session=request.getSession();
            String fathersfirstname = request.getParameter("fathersfirstname"),
                    fathermiddlename = request.getParameter("fathermiddlename"),
                    flastname = request.getParameter("flastname"),
                    fatherBRegion = request.getParameter("fatherBRegion"),
                    fatherBzone = request.getParameter("fatherBzone"),
                    fatherBwereda = request.getParameter("fatherBwereda"),
                    fatherBtown = request.getParameter("fatherBtown"),
                    fatherBkebele = request.getParameter("fatherBkebele"),
                    fatherHnumber = request.getParameter("fatherHnumber"),
                    fatherOccupation = request.getParameter("fatherOccupation"),
                    fatherworkplace = request.getParameter("fatherworkplace"),
                    motherfirstname = request.getParameter("motherfirstname"),
                    mothermiddlename = request.getParameter("mothermiddlename"),
                    motherlastname = request.getParameter("motherlastname"),
                    motherBRegion = request.getParameter("motherBRegion"),
                    motherBzone = request.getParameter("motherBzone"),
                    motherBwereda = request.getParameter("motherBwereda"),
                    motherBtown = request.getParameter("motherBtown"),
                    motherBkebele = request.getParameter("motherBkebele"),
                    motherHnumber = request.getParameter("motherHnumber"),
                    motherOccuption = request.getParameter("motherOccuption"),
                    motherPlacework = request.getParameter("motherPlacework"),
                    step = request.getParameter("step"),
                    studentid=request.getParameter("studidfamily");
                  
            
            // creating object of family registration class from model
            StudentManagement family_registration = new StudentManagement();
            int isSaved = family_registration.savefamilyinfo(fatherHnumber,
                    motherlastname,
                    fathermiddlename,
                    fatherBRegion,
                    fatherBzone,
                    fatherworkplace,
                    fatherBtown,
                    fatherBkebele,
                    fatherHnumber,
                    fatherOccupation,
                    motherPlacework,
                    motherlastname,
                    motherlastname,
                    mothermiddlename,
                    motherBRegion,
                    motherBzone,
                    motherBwereda,
                    motherBtown,
                    motherBkebele,
                    motherHnumber,
                    motherOccuption,
                    motherPlacework,
                    studentid);
            if (isSaved >= 1) {
                 session.setAttribute("stud_id", studentid);
                 session.setAttribute("step2", step);
               // response.sendRedirect("Student/STUD_PSEI.jsp");
        response.sendRedirect("Student/educationalbg.jsp");
            }else{
                out.print("not saved");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(registerfamilyinformation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(registerfamilyinformation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(registerfamilyinformation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(registerfamilyinformation.class.getName()).log(Level.SEVERE, null, ex);
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
