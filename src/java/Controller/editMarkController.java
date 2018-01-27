/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.EditMarkModel;
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
 * @author seid
 */
@WebServlet(name = "editMark", urlPatterns = {"/editMark"})
public class editMarkController extends HttpServlet {

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
            int p=0,a=0,f=0,t=0,m=0,c=0,at=0;
            /* TODO output your page here. You may use following sample code. */
           String studid=request.getParameter("stud_id"),
                   tstudid=request.getParameter("stud_id"),
                   test1=request.getParameter("test1"),
                   pstud_id=request.getParameter("stud_id"),
                    mstud_id=request.getParameter("stud_id"),
                  project =request.getParameter("project"),
                   Attendance=request.getParameter("Attendance"),
                          activity=request.getParameter("activity"),
                      final_40=request.getParameter("final_40"),
                          conductevaluation=request.getParameter("conductevaluation"),
                   midexam=request.getParameter("midexam");
           
           EditMarkModel em=new EditMarkModel();
          a= em.activity(pstud_id, activity);
                a= em.test(tstudid, test1);
                         a= em.project(pstud_id, project);
         a= em.Attendance(studid, Attendance);
          a= em.finalexam(studid, final_40);
          a= em.conductevaluation(studid, conductevaluation);
          a= em.midexam(mstud_id, midexam);
          if(a>0){
              request.getSession().setAttribute("inserted", " student mark sucessfuly inserted");
              response.sendRedirect("Instructor/Submit.jsp");
          }
          else{
              request.getSession().setAttribute("not","student mark not inserted");
              response.sendRedirect("Instructor/Submit.jsp");
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
            Logger.getLogger(editMarkController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editMarkController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editMarkController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editMarkController.class.getName()).log(Level.SEVERE, null, ex);
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
