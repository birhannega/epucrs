/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.ClearanceModel;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
/**
 *
 * @author user
 */
@WebServlet(name = "ClearanceServlet", urlPatterns = {"/ClearanceServlet"})
@MultipartConfig(maxFileSize = 16177215)
public class ClearanceServlet extends HttpServlet {
    

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
     String fullname=request.getParameter("fullname"),
             directorate=request.getParameter("directorate"),
             dpstartdate=request.getParameter("dpstartdate"),
             departmentlearn=request.getParameter("departmentlearn"),
             enddate=request.getParameter("enddate"),
             reason=request.getParameter("reason");
        String clrid=reason.concat("-100");
        String studid=fullname.concat("-100");
        Part filePart = request.getPart("ImageFile");
        ClearanceModel clrmodel=new ClearanceModel();
     int accept_clrform=clrmodel.clerancemodel(clrid,fullname,directorate,dpstartdate,departmentlearn,enddate,reason,studid,filePart);
     
     if(accept_clrform > 0)
     {
      request.getSession().setAttribute("ClearaceRegistered", "<strong><span class='alert alert-success text-left'>Clearace successfully registred</span></strong>");
            response.sendRedirect("Registrar/Clearance.jsp");   
     }
     else
     {
       request.getSession().setAttribute("ClearacepNotRegistered", "<strong><span class='alert alert-success text-center'>Clearace not registred</span></strong>");
            response.sendRedirect("Registrar/Clearance.jsp");   
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
            Logger.getLogger(ClearanceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClearanceServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClearanceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClearanceServlet.class.getName()).log(Level.SEVERE, null, ex);
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
