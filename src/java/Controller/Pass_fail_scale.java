/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Criteria_management;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "Pass_fail_scale", urlPatterns = {"/AddScale"})
public class Pass_fail_scale extends HttpServlet {
    Criteria_management criteria_management;

    public Pass_fail_scale() {
        try {
            this.criteria_management = new Criteria_management();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Pass_fail_scale.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
             String program=request.getParameter("program"),
                    insertedby=request.getParameter("insertedby"),
                    mingpa=request.getParameter("mingpa");
            
            //
            Date insertion_date = new Date();
            SimpleDateFormat df=new SimpleDateFormat("yyyy-dd-MM");
            String today=df.format(insertion_date);
            ///  
            java.util.Date date_inserted=df.parse(today);
            java.sql.Date currentdate=new  java.sql.Date(date_inserted.getTime());
            Double required_gpa=Double.valueOf(mingpa);           
          out.print(currentdate+"  "+required_gpa+" "+program+"  "+insertedby );
            try {
                int data_inserted=criteria_management.Add_pass_fail_scale(program,required_gpa,currentdate,insertedby);
                if(data_inserted>=1)
                {
                    out.println("success");
                }else
                {
                     out.println("error");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Pass_fail_scale.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(Pass_fail_scale.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(Pass_fail_scale.class.getName()).log(Level.SEVERE, null, ex);
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
