/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ClearanceModel;
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
@WebServlet(name = "ClearanceApprovalServlet", urlPatterns = {"/ClearanceApprovalServlet"})
public class ClearanceApprovalServlet extends HttpServlet {

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
        String pmname = request.getParameter("pmname"),
                dateprgmgr = request.getParameter("dateprgmgr"),
                pmremark = request.getParameter("pmremark"),
                sddname = request.getParameter("sddname"),
                datesdd = request.getParameter("datesdd"),
                sddremark = request.getParameter("sddremark"),
                fdmname = request.getParameter("fdmname"),
                datefdm = request.getParameter("datefdm"),
                fdmremark = request.getParameter("fdmremark"),
                sdmname = request.getParameter("sdmname"),
                datesdm = request.getParameter("datesdm"),
                sdmremark = request.getParameter("sdmremark"),
                lmname = request.getParameter("lmname"),
                datelm = request.getParameter("datelm"),
                lmremark = request.getParameter("lmremark"),
                gsmname = request.getParameter("gsmname"),
                dategsm = request.getParameter("dategsm"),
                gsmremark = request.getParameter("gsmremark"),
                ptname = request.getParameter("ptname"),
                datepolicetct = request.getParameter("datepolicetct"),
                ptremark = request.getParameter("ptremark"),
                rmname = request.getParameter("rmname"),
                daterm = request.getParameter("daterm"),
                rmremark = request.getParameter("rmremark");

        String clrid = pmname.concat("-100");
        String studid = pmname.concat("-1");
        ClearanceModel clrmodel = new ClearanceModel();
        int accept_clrform = clrmodel.cleranceApproval(clrid, studid, pmname, dateprgmgr, pmremark, sddname, datesdd, sddremark, fdmname, datefdm, fdmremark, sdmname, datesdm,
                sdmremark, lmname, datelm, lmremark, gsmname, dategsm, gsmremark, ptname, datepolicetct, ptremark, rmname, daterm, rmremark);

        if (accept_clrform > 0) {
            request.getSession().setAttribute("ClearaceAllRegistered", "<strong><span class='alert alert-success text-center'>Clearace successfully registred</span></strong>");
            response.sendRedirect("Incoder/Clearance.jsp");
        } else {
            request.getSession().setAttribute("ClearaceAllNotRegistered", "<strong><span class='alert alert-success text-center'>Clearace not registred</span></strong>");
            response.sendRedirect("Incoder/Clearance.jsp");
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
            Logger.getLogger(ClearanceApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClearanceApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClearanceApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClearanceApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
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
