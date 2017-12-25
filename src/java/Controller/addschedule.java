/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Events;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author luv2codeit
 */
@WebServlet(name = "addschedule", urlPatterns = {"/addschedule"})
public class addschedule extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         String title=request.getParameter("eventtitle"),
                 name=request.getParameter("eventname"),
                 startdate=request.getParameter("startdate"),
                 enddate=request.getParameter("enddate");
        Events eventRegisterEvents=new Events();
        int scheduleid=eventRegisterEvents.getLastID();
       
        
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
        java.util.Date startingdate = sdf1.parse(startdate);
        java.util.Date endingdate = sdf1.parse(enddate);
          java.sql.Date sqlStartDate = new java.sql.Date(startingdate.getTime());  
            java.sql.Date sqlendDate = new java.sql.Date(endingdate.getTime()); 
            
        
       java.util.Date date;
            date = new java.util.Date();
        SimpleDateFormat sdf=new SimpleDateFormat("y");
        String year=sdf.format(date);
        int addschedule=eventRegisterEvents.addschedule(title, name,sqlStartDate ,sqlendDate ,scheduleid,year);
        if(addschedule>=1)
        {
            response.sendRedirect("Registrar/addschedule.jsp");
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
            Logger.getLogger(addschedule.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(addschedule.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException | SQLException | ParseException ex) {
            Logger.getLogger(addschedule.class.getName()).log(Level.SEVERE, null, ex);
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
