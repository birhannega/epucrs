/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.StudentManagement;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author user
 */
public class StudentController extends HttpServlet {

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
           STUD_POLICE_COMMISION_NUMBER = request.getParameter("studpcMobile");
           
            // getting student iterator
            Date date=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("y");
            String year=sdf.format(date);
            
            String stud_iterator=null;
            connectionManager dbconn=new connectionManager();
            Statement idstatement=dbconn.getconnection().createStatement();
            ResultSet rs_id=idstatement.executeQuery("select REGULAR_STUDENT_COUNTER from TBL_Setup where ACADAMIC_YEAR='"+year+"' ");
            if(rs_id.next())
            {
             stud_iterator=rs_id.getString(1);
            }else
            {
            out.println("");
            }
           STUD_ID="R/".concat(stud_iterator)+"/"+year ;
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
                    STUD_POLICE_COMMISION_NUMBER);
            if(registered>0){
                request.getSession().setAttribute("studentRegistered", "<strong><span class='alert alert-success text-center'>Student successfully registred</span></strong>");
                response.sendRedirect("Incoder/studentregistration.jsp");
                
            }
            else{
                out.println("registration not done");
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
