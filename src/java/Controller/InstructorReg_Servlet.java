/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.InstructorRegModel;
import dbconnection.connectionManager;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
@WebServlet(name = "InstructorReg_Servlet", urlPatterns = {"/InstructorReg_Servlet"})
//@MultipartConfig(maxFileSize=16177215L)
@MultipartConfig(maxFileSize = 16177215)

public class InstructorReg_Servlet extends HttpServlet {

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
         InputStream inputStram=null;
         
//              Part  filepart = request.getPart("ImageFile"); 
//              Scanner scn=new Scanner(filepart.getInputStream());
//               File file = new File("image.jpg");
//           InputStream in = new FileInputStream(file);
//           preparedStatment.setBinaryStream(1, in, 1000000);
//             if(filepart!=null)
//             {
//                 System.out.println(filepart.getName());
//                 System.out.println(filepart.getSize());
//                 System.out.println(filepart.getContentType());
//                inputStram=filepart.getInputStream();
//             }
             
        PrintWriter out = response.getWriter();
        connectionManager con = new connectionManager();
        Connection connection = con.getconnection();
        Statement statement = connection.createStatement();
        String query = "Select INSTRUCTOR_COUNTER From Tbl_SETUP";
        ResultSet res = statement.executeQuery(query);
        String inst_counter = null;
        if (res.next()) {

            inst_counter = res.getString("INSTRUCTOR_COUNTER");
            if (inst_counter.length() == 1) {
                inst_counter = inst_counter.concat("00");
            } else if (inst_counter.length() == 2) {
                inst_counter = inst_counter.concat("0");
            } else if (inst_counter.length() == 3) {
                inst_counter = inst_counter + 1;
            }

        } else {
            out.println("no data");
        }

        //String instid = request.getParameter("instid");
        
        String insttitle = request.getParameter("insttitle"), 
                   firstname = request.getParameter("firstname"),
                middlename = request.getParameter("middlename"), lastname = request.getParameter("lastname"),
                phoneno = request.getParameter("phoneno"),
                email = request.getParameter("email"), department = request.getParameter("department"),
                status = request.getParameter("status"), insttype = request.getParameter("insttype"),
                responsibility = request.getParameter("responsibility"),
                hireddate = request.getParameter("hireddate"),
                policemngmt = request.getParameter("policemngmt"),
                description = request.getParameter("description");
         String instid = firstname.concat("-100");

     Part filePart = request.getPart("ImageFile"); // Retrieves <input type="file" name="file">

        InstructorRegModel instreg = new InstructorRegModel();
        
        int is_registered = instreg.instructor_registration(instid, filePart,insttitle, firstname, middlename, lastname, phoneno,
                email, department, status, insttype, responsibility, hireddate, policemngmt, description);
        if (is_registered > 0) {
            request.getSession().setAttribute("instreg", "<strong><span class='alert alert-success text-center'>Instructor successfully registred</span></strong>");
            response.sendRedirect("Department/StaffRegistration.jsp");
            //out.println("course successfully registred");
        } else {
            request.getSession().setAttribute("instNotreg", "<strong><span class='alert alert-success text-center' style='color: red'>Instructor not registred</span></strong>");
            response.sendRedirect("Department/StaffRegistration.jsp");
            // out.println("Instructor not registred");
        }

//                               courseName=request.getParameter("coursename");
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
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstructorReg_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
