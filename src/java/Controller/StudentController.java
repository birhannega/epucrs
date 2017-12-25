/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.StudentManagement;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * @author user
 */
@WebServlet(name = "StudentController", urlPatterns = {"/StudentController"})
public class StudentController extends HttpServlet {

    connectionManager dbconnection = new connectionManager();
    Connection connection;

    public StudentController() throws ClassNotFoundException, SQLException {
        this.connection = dbconnection.getconnection();
    }

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
            /* TODO output your page here. You may use following sample code. */
            
  
            String STUD_ID = null,
                    program = request.getParameter("program"),
                    department = request.getParameter("department"),
                    STUD_FIRST_NAME = request.getParameter("studentfirstname"),
                    STUD_LAST_NAME = request.getParameter("studlastname"),
                    STUD_MIDDLE_NAME = request.getParameter("studmiddlename"),
                    STUD_BIRTHDATE = request.getParameter("studbdate"),
                    STUD_TITLE = null,
                    STUD_BIRTH_REGION = request.getParameter("studbirthregion"),
                    STUD_BIRTH_ZONE = request.getParameter("studBirthzone"),
                    STUD_BIRTH_WEREDA = request.getParameter("StudBirthwereda"),
                    STUD_BIRTH_KEBELE = request.getParameter("studBirthkebele"),
                    STUD_CONTACT_PERSON_ADRESS = request.getParameter("studcpaddress"),
                    STUD_CONTACT_PERSON_PHONE = request.getParameter("studcpmobile"),
                    STUD_CONTACT_PERSON_NAME = request.getParameter("studcpname"),
                    STUD_CONTACT_PERSON_PRELATION = request.getParameter("studcprelation"),
                    STUD_CONTACT_PERSON_RELIGION = request.getParameter(""),
                    STUD_CONTACT_PERSON_TEL = request.getParameter("studcptel"),
                    STUD_GENDER = request.getParameter("studgender"),
                    STUD_HOME_REGION = request.getParameter("StudHomeRegion"),
                    STUD_HOME_TOWN = request.getParameter("studHomekebele"),
                    STUD_HOME_WEREDA = request.getParameter("studHomewereda"),
                    STUD_HOME_ZONE = request.getParameter("studHomezone"),
                    STUD_NATIONALITY = request.getParameter("studnationality"),
                    STUD_POLICE_COMMISION_SECTOR = request.getParameter("studpcSector"),
                    STUD_POLICE_COMMISION_NUMBER = request.getParameter("studpcMobile"),
                    Step=request.getParameter("step"),
                    STUD_TYPE = request.getParameter("studtype");
            HttpSession session = request.getSession();
            // getting student iterator
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("Y");
            String year = sdf.format(date);
            String yrsub = year.substring(0, 4);
            out.println(year);
            out.println(program);
            String stud_iterator = null;
            connectionManager dbconn = new connectionManager();
            Statement idstatement = dbconn.getconnection().createStatement();
            

            ResultSet rs_ci_counter = idstatement.executeQuery("select NUMBER_OF_STUDENTS from TBL_COUNTER where ACADAMIC_YEAR='" + year + "' and PROGRAM_ID='" + program + "'");
  if (rs_ci_counter.next()) {
                stud_iterator = rs_ci_counter.getString(1);
                switch (stud_iterator.length()) {
                    case 1:
                        stud_iterator = "00".concat(stud_iterator);
                        break;
                    case 2:
                        stud_iterator = "0".concat(stud_iterator);
                        break;
                    default:
                        stud_iterator = stud_iterator;
                        break;
                }
            } else {
                session.setAttribute("error", "Error occured ");
            }

            STUD_ID = program+"/".concat(stud_iterator) + "/" + yrsub;

            session.setAttribute("studentId", STUD_ID);
             session.setAttribute("step1", Step);
            session.setAttribute("fullname", STUD_FIRST_NAME + " " + STUD_MIDDLE_NAME + " " + STUD_LAST_NAME);
            //out.println(STUD_LAST_NAME);
            //creat object of StudentManagement entity class
            StudentManagement registration = new StudentManagement();
              int registered = registration.registerStudent(STUD_ID,
                                                            STUD_FIRST_NAME,
                                                            STUD_LAST_NAME,
                                                            STUD_MIDDLE_NAME,
                                                            STUD_BIRTHDATE,
                                                            STUD_TITLE,
                                                            STUD_BIRTH_REGION,
                                                            STUD_BIRTH_ZONE,
                                                            STUD_BIRTH_WEREDA,
                                                            STUD_BIRTH_KEBELE,
                                                            STUD_CONTACT_PERSON_ADRESS,
                                                            STUD_CONTACT_PERSON_PHONE,
                                                            STUD_CONTACT_PERSON_NAME,
                                                            STUD_CONTACT_PERSON_PRELATION,
                                                            STUD_CONTACT_PERSON_RELIGION,
                                                            STUD_CONTACT_PERSON_TEL,
                                                            STUD_GENDER,
                                                            STUD_HOME_REGION,
                                                            STUD_HOME_TOWN,
                                                            STUD_HOME_WEREDA,
                                                            STUD_HOME_ZONE,
                                                            STUD_NATIONALITY,
                                                            STUD_POLICE_COMMISION_SECTOR,
                                                            STUD_POLICE_COMMISION_NUMBER,
                                                            STUD_TYPE);
            if (registered > 0) {
                Statement update_iterator = connection.createStatement();
                ResultSet update_rs = update_iterator.executeQuery("update TBL_COUNTER set NUMBER_OF_STUDENTS=NUMBER_OF_STUDENTS+1 where PROGRAM_ID='" + program + "'");
                if (update_rs.next()) {
                    request.getSession().setAttribute("studentRegistered", "<strong><span class='alert alert-success text-center'>Student successfully registred</span></strong>");
                   response.sendRedirect("Student/familyinfo.jsp");
                } else {
                    request.getSession().setAttribute("idcountnotupdated", "<strong><span class='alert alert- text-center'>Student counter not updated</span></strong>");
                    out.print("error");
                }
            } else {
                
                request.getSession().setAttribute("studentnotRegistered", "<strong><span class='alert alert-success text-center'>Student not registred</span></strong>");
                out.println("error s");
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
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
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
