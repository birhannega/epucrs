/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.RegistrarApproval_model;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author seid
 */
@WebServlet(name = "RegistrarApproval_controller", urlPatterns = {"/RegistrarApproval_controller"})
public class RegistrarApproval_controller extends HttpServlet {

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
            int saved=0;
            /* TODO output your page here. You may use following sample code. */
           String []name=request.getParameterValues("approvalname");
            String []id=request.getParameterValues("studid");
                    int status=3;
                    for(int j=0;j<id.length;j++)
                    {
                        connectionManager con=new connectionManager();
                        Statement st_con=con.getconnection().createStatement();
                        ResultSet rs_con=st_con.executeQuery("select * from tbl_mark where stud_id='"+id[j]+"' and status='status'");
                        if(rs_con.next()){
                          out.println("Approved Student mark");
                        }
                        else{
                    RegistrarApproval_model state=new RegistrarApproval_model();
                             saved = state.Approval(status, name[j], id[j]);
                                }
        }
                    if(saved>0){
                        request.getSession().setAttribute("updated", "Successfully Mark Approved");
                        response.sendRedirect("Department/RegistrarApproval.jsp");
                    }
                    else {
                        request.getSession().setAttribute("notupdated", "Not Approved Mark");
                        response.sendRedirect("Department/RegistrarApproval.jsp");
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
            Logger.getLogger(programmanager_approval.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(programmanager_approval.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(programmanager_approval.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(programmanager_approval.class.getName()).log(Level.SEVERE, null, ex);
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