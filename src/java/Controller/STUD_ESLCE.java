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
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "STUD_ESLCE", urlPatterns = {"/STUD_ESLCE"})
public class STUD_ESLCE extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String grade = request.getParameter("grade"),
                    english = request.getParameter("mainsub1"),
                    amharic = request.getParameter("mainsub2"),
                    sub1 = request.getParameter("mainsub1"),
                    sub2 = request.getParameter("mainsub2"),
                    sub3 = request.getParameter("mainsub3"),
                    sub4 = request.getParameter("mainsub4"),
                    sub5 = request.getParameter("mainsub5"),
                    res_eng = request.getParameter("result_eng"),
                    res_amharic = request.getParameter("result_am"),
                    res_sub1 = request.getParameter("res_subject1"),
                    res_sub2 = request.getParameter("res_subject2"),
                    res_sub3 = request.getParameter("res_subject3"),
                    res_sub4 = request.getParameter("res_subject4"),
                    res_sub5 = request.getParameter("res_subject5"),
                    year_eng = request.getParameter("Eng_year"),
                    year_am = request.getParameter("Am_year"),
                    year_sub1 = request.getParameter("sub1_year"),
                    year_sub2 = request.getParameter("sub2_year"),
                    year_sub3 = request.getParameter("sub3_year"),
                    year_sub4 = request.getParameter("sub4_year"),
                    year_sub5 = request.getParameter("sub5_year"),
                    stud_id = request.getParameter("stud_id");

            List<String> subjects;
            List<String> years_taken;
            List<String> results;

            subjects = new ArrayList<>();
            subjects.add(english);
            subjects.add(amharic);
            subjects.add(sub1);
            subjects.add(sub2);
            subjects.add(sub3);
            subjects.add(sub4);
            subjects.add(sub5);

            years_taken = new ArrayList<>();
            years_taken.add(year_eng);
            years_taken.add(year_am);
            years_taken.add(year_sub1);
            years_taken.add(year_sub2);
            years_taken.add(year_sub3);
            years_taken.add(year_sub4);
            years_taken.add(year_sub5);
            results = new ArrayList<>();
            results.add(res_eng);
            results.add(res_amharic);
            results.add(res_sub1);
            results.add(res_sub2);
            results.add(res_sub3);
            results.add(res_sub4);
            results.add(res_sub5);

            // creating object of model
            HttpSession session = request.getSession();
            StudentManagement StudESLCE = new StudentManagement();
            //  int lengthoflist=results.size();
            int isSaved = 0;
            for (int insertions = 0; insertions < results.size(); insertions++) {
                isSaved = StudESLCE.STUD_ESLCE(stud_id, grade, subjects.get(insertions), results.get(insertions), years_taken.get(insertions));
            }
            if (isSaved >= 1) {

                session.setAttribute("eslce", "Data successfully saved");
                response.sendRedirect("Student/herby.jsp");
                // response.sendRedirect("Student/herby.jsp");

            } else {

                //session.setAttribute("eslce", "<div class='alert alert-success'>Student esclce result successfully saved</div>");
//             
                out.println("error");
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
            Logger.getLogger(STUD_ESLCE.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(STUD_ESLCE.class.getName()).log(Level.SEVERE, null, ex);
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
