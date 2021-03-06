/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ClassModel;
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
@WebServlet(name = "ClassAssignUpdateServlet", urlPatterns = {"/ClassAssignUpdateServlet"})
public class ClassAssignUpdateServlet extends HttpServlet {
 ClassModel classAss=new ClassModel();
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
       String   acdstaffID=request.getParameter("acdstaffID"),courseID=request.getParameter("courseID"),
             classID=request.getParameter("classID"),assigndate=request.getParameter("assigndate"),
             timeFrom=request.getParameter("timeFrom"),timeTo=request.getParameter("timeTo"),
               classassignID=request.getParameter("classassignID");
        
     int saveclassAss=classAss.classAssign_Update(acdstaffID,courseID,classID,assigndate,timeFrom,timeTo,classassignID);
       if (saveclassAss > 0) {
            request.getSession().setAttribute("ClassAssign", "<strong><span class='alert alert-success text-center'>Class assign successfully updated</span></strong>");

            response.sendRedirect("Department/ClassAssignment.jsp");
            //out.println("course successfully registred");
        } else {
             request.getSession().setAttribute("ClassNotAssign", "<strong><span class='alert alert-success text-center'>Class assign not updated</span></strong>");
            response.sendRedirect("Department/ClassAssignment.jsp");
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
            Logger.getLogger(ClassAssignUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClassAssignUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClassAssignUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClassAssignUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
