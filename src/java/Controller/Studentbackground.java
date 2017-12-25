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
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "Studentbackground", urlPatterns = {"/Studentbackground"})
public class Studentbackground extends HttpServlet {

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
      
            connectionManager con_obj=new connectionManager();
            String id = request.getParameter("studid"),
                    grade9 = request.getParameter("grade9"),
                    gr9startdate = request.getParameter("startdate9"),
                    enddate9 = request.getParameter("enddate9"), 
                    school9 = request.getParameter("school9"), 
                    grade10 = request.getParameter("grade10"),
                    gr10startdate = request.getParameter("startdate10"),
                    enddate10 = request.getParameter("enddate10"), 
                    school10 = request.getParameter("school10"), 
                    grade11 = request.getParameter("grade11"), 
                    gr11startdate = request.getParameter("startdate11"),
                    enddate11 = request.getParameter("enddate11"), 
                    school11 = request.getParameter("school11"), 
                    grade12 = request.getParameter("grade12"), 
                    gr12startdate = request.getParameter("startdate12"),
                    enddate12 = request.getParameter("enddate12"), 
                    school12 = request.getParameter("school12");

            
            // String[][] schools=new String[4][4];
            // String Grades[]={grade9,grade10,grade11,grade12};
            // String schools[]={school9,school10,school11,school112};
            //   String startdates []={gr9startdate,gr10startdate, gr11startdate,gr12startdate};
            //  String enddates[]={enddate9,enddate10,enddate11,enddate12};
            List<String> schools;
            List<String> enddates;
            List<String> startdates;
            List<String> Grades;

            Grades = new ArrayList<>();
            Grades.add(grade9);
            Grades.add(grade10);
            Grades.add(grade11);
            Grades.add(grade12);

            schools = new ArrayList<>();
            schools.add(school9);
            schools.add(school10);
            schools.add(school11);
            schools.add(school12);

            startdates = new ArrayList<>();
            startdates.add(gr9startdate);
            startdates.add(gr10startdate);
            startdates.add(gr11startdate);
            startdates.add(gr12startdate);

            //end dates      
            enddates = new ArrayList<>();
            enddates.add(enddate9);
            enddates.add(enddate10);
            enddates.add(enddate11);
            enddates.add(enddate12);
            //System.out.println(schools.size());

            StudentManagement background = new StudentManagement();
            HttpSession session=request.getSession();
            Connection checkid_con=con_obj.getconnection();
            Statement st_id_check=checkid_con.createStatement();
            ResultSet rs_id=st_id_check.executeQuery("Select * from TBL_EDUCATIONAL_BACKGROUND where Stud_id='"+id+"'");
            if(rs_id.next())
            {
           
            session.setAttribute("idexists", "This Id already exists");
            response.sendRedirect("Student/educationalbg.jsp");
            }else
            {
            int datasaved=0;
            for (int insertions = 0; insertions <schools.size(); insertions++) {
                datasaved=background.SaveEducationalBackground(Grades.get(insertions), schools.get(insertions), startdates.get(insertions), enddates.get(insertions), id);
            }
             if(datasaved>=1)
            {
                
                session.setAttribute("educational","Data successfully saved");
                response.sendRedirect("Student/psei.jsp");
            }
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
            Logger.getLogger(Studentbackground.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Studentbackground.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Studentbackground.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Student background insertion ";
    }

}
