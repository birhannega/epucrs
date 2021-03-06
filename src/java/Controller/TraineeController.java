/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.TraineeManagment;
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
@WebServlet(name = "TraineeController", urlPatterns = {"/TraineeController"})
public class TraineeController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String birth_date=request.getParameter("bdate"),
                   department=request.getParameter("dpt"),
                   end_date=request.getParameter("end_date"),
                   firstname=request.getParameter("firstname"),
                   lastname=request.getParameter("lastname"),
                   middlename=request.getParameter("middlename"),
                   phone=request.getParameter("tel"),
                   title=request.getParameter("title"),
                   term=request.getParameter("term"),
                   startdate=request.getParameter("start_date");
                 TraineeManagment trainee_reg=new TraineeManagment();
            try {
                int traineeragistration=trainee_reg.Trainee_reg(birth_date, 
                        department,
                        end_date, firstname, lastname, middlename, phone,startdate,term,title);
                if(traineeragistration>0)
                    {
                request.getSession().setAttribute("TraineeRegistered", "<strong><span class='alert alert-success text-center'>Trainee successfully registred</span></strong>");
                response.sendRedirect("Department/Trainee.jsp");
                
            }
            else{
          request.getSession().setAttribute("oop", "Trainer not registered ");
          response.sendRedirect("Department/Trainee.jsp");
      
            }

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(TraineeController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(TraineeController.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
