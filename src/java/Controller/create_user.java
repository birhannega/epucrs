/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.UserManagement;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
 * @author luv2codeit
 */
@WebServlet(name = "create_user", urlPatterns = {"/adduser"})
public class create_user extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username"),
                    password = request.getParameter("password"),
                    cpass = request.getParameter("cpassword"),
                    role_id = request.getParameter("role"),
                    currentStatus = "acitve",
                    acadamic_staff = request.getParameter("userid");

            UserManagement Umanagement = new UserManagement();

            java.util.Date currentDate = new java.util.Date();

            // java.sql.Date Date_closed = new java.sql.Date(); 
            java.sql.Date Date_closed = null;

            java.sql.Date today = new java.sql.Date(currentDate.getTime());
            //out.print(today);

            // Date date_opend=new Date();
            //
            int numberofAccount = Umanagement.countAccountsByID(acadamic_staff);
            HttpSession session = request.getSession();

            String message = null;
            if (numberofAccount < 5) {

                // check if username is in use
                String sql_check = "Select user_id from tbl_users where user_id='" + username + "'";
                Boolean userexists = Umanagement.checkUserName(username);
                if (userexists) {
                    message = "<p class='alert alert-warning'>Username already in user!! try other names</p>";
                    session.setAttribute("msg", message);
                    response.sendRedirect("Registrar/Adduser.jsp");
                } else {
                    // check if user already has this role
                    boolean isroleGiven = Umanagement.checkIfRoleIsGranted(username, role_id);
                    if (isroleGiven) {
                        message = "<p class='alert alert-danger'>selected staff already has account of selected role type</p>";
                        session.setAttribute("msg", message);
                        response.sendRedirect("Registrar/Adduser.jsp");
                    } else {
                        int usercreated = Umanagement.AddNewUser(username, role_id, password, currentStatus, today, Date_closed, acadamic_staff);
                        if (usercreated >= 1) {
                            //out.println("user created successfuly" + numberofAccount);
                            message = "<p class='alert alert-success'>User account created successfully</p>";
                            session.setAttribute("msg", message);
                            response.sendRedirect("Registrar/Adduser.jsp");
                        } else {
                            message = "<p class='alert alert-success'>User account not created</p>";
                            session.setAttribute("msg", message);
                            response.sendRedirect("Registrar/Adduser.jsp");
                        }
                    }// check role ends
                }// check user name ends 
            } // if number of user accounts has been more than 5
            else {
                message = "<p class='alert alert-danger'>Maximum number of permissible accounts for one staff member is 5 <stronng>user not created</strong></p>";
                session.setAttribute("msg", message);
                response.sendRedirect("Registrar/Adduser.jsp");
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
            try {
                processRequest(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(create_user.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(create_user.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(create_user.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "create new user along with their role";
    }// </editor-fold>

}
