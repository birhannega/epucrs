package Controller;
import Model.UserManagement;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author user
 */
@WebServlet(name = "LoginAuthentication", urlPatterns = {"/LoginAuthentication"})
public class LoginAuthentication extends HttpServlet {
             connectionManager manager = new connectionManager();

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
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username"),
                    password = request.getParameter("password");
            String status = "active", role = null;
            UserManagement userlogin = new UserManagement();
              HttpSession session = request.getSession();
            int user_validity = userlogin.authenticateuser(username, password,status);
            if (user_validity >= 1) {

                Statement user_statement = manager.getconnection().createStatement();
                ResultSet rs_user = user_statement.executeQuery("select ROLE_ID from TBL_USERS where user_id='" + username + "'");
             
               if (rs_user.next()) {
//                    HttpSession session = request.getSession();
                    //session.setAttribute("loggeduser", username);
                    role = rs_user.getString(1);
                    if (role.equalsIgnoreCase("R_00")) {
                          session.setAttribute("registrar", username);
                          Cookie cookie = new Cookie("registrar","3000");
                        response.sendRedirect("Registrar/index.jsp");
                    } else if (role.equalsIgnoreCase("R_01")) {
                        response.sendRedirect("Incoder/index.jsp");
                    } else if (role.equalsIgnoreCase("R_02")) {
                        session.setAttribute("inst", username);
                        response.sendRedirect("Instructor/index.jsp");
                    } else if (role.equalsIgnoreCase("R_03")) {
                          session.setAttribute("dpt", username);
                        response.sendRedirect("Department/index.jsp");
                    } else if (role.equalsIgnoreCase("R_04")) {
                         session.setAttribute("stud", username);
                        response.sendRedirect("Student/index.jsp");
                    }
                    else if (role.equalsIgnoreCase("R_05")) {
                         session.setAttribute("president", username);
                        response.sendRedirect("President/index.jsp");
                    }
                    else if (role.equalsIgnoreCase("R_06")) {
                         session.setAttribute("report", username);
                        response.sendRedirect("Reports/index.jsp");
                    }else {
                        out.print("unknown role");
                    }
                }

            } else {
                session.setAttribute("error", "<div class='alert alert-warning'>Invalid credentials</div>");
               request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            //out.println("You entered"+ username +" "+password+"</h1>");
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
            Logger.getLogger(LoginAuthentication.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginAuthentication.class.getName()).log(Level.SEVERE, null, ex);
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
