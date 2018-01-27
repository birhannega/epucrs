/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.approved_mark_model;
import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
@WebServlet(name = "ApprovalController", urlPatterns = {"/ApprovalController"})
public class ApprovalController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

PrintWriter out = response.getWriter();
 try {
            approved_mark_model inserted=new approved_mark_model();
       //connectionManager con=new connectionManager();
     String action=request.getParameter("action");
     int i=0;
         if("submit".equalsIgnoreCase(action))
     {
       
       float sixty=0,fourty=0,hundred=0;
           String mark_40 []=request.getParameterValues("mark_40");
     String mark_60 []=request.getParameterValues("mark_60");
  
          String approvalname=request.getParameter("approvalname");
               String teacherid=request.getParameter("teacherid");
                String date=request.getParameter("date");
     
     String academicyear=request.getParameter("academicyear");
     String course2=request.getParameter("course");
             String mark_100 []=request.getParameterValues("mark_100");

     String program=request.getParameter("program");
     String []studid=request.getParameterValues("studid");
    String grade=null;
    
   // out.println(mark_40);
     for(int j=0;j<studid.length;j++){
            sixty=Float.valueOf(mark_60[j]);
            fourty=Float.valueOf(mark_40[j]);
            hundred=Float.valueOf(mark_100[j]);
            if(hundred>90)
    {
        grade="A";
        
    }
    else if(hundred>80) {
        grade="B";
    }
    else if(hundred>70){
        grade="C";
        
    }
    else if(hundred>60)
    {
        grade="D";
        
    }
    else if(hundred>50){
        grade="F";
    }
    else {
        grade="FX";
    }
              String term=request.getParameter("term");
              int status=1;
             String Registrar_office_name=request.getParameter("Registrar_office_name");
     String room=request.getParameter("room");

//       Statement st_con=con.getconnection().createStatement();
//       ResultSet rs_con=st_con.executeQuery("select * from tbl_mark where stud_id='"+studid[j]+"'and academicyear='"+academicyear+"' and term='"+term+"'");
//       if(rs_con.next()){
//           String id=rs_con.getString("stud_id");
//           out.println(id);
//           out.println("student data inserted befor this time");
//           
//       }
//       else{
              inserted.approvalmark(fourty,sixty,approvalname,teacherid,date,academicyear,course2,hundred,
        program,studid[j],grade,term,status,Registrar_office_name,room);
               }}
         
         else if("ReSubmit".equalsIgnoreCase(action)){
             float sixty=0,fourty=0,hundred=0;
     
                   String mark_40 []=request.getParameterValues("mark_40");
     String mark_60 []=request.getParameterValues("mark_60");
    String mark_100 []=request.getParameterValues("mark_100");
          String []studid=request.getParameterValues("studid");
          String grade=null;
          for(int k=0;k<studid.length;k++){
              sixty=Float.valueOf(mark_60[k]);
            fourty=Float.valueOf(mark_40[k]);
            hundred=Float.valueOf(mark_100[k]);
            if(hundred>90)
    {
        grade="A";
        
    }
    else if(hundred>80) {
        grade="B";
    }
    else if(hundred>70){
        grade="C";
        
    }
    else if(hundred>60)
    {
        grade="D";
        
    }
    else if(hundred>50){
        grade="F";
    }
    else {
        grade="FX";
    }
            int status=1;
            
            inserted.resubmit(fourty, sixty, hundred, studid[k], grade, status);
          }
         }
          if(i>0){
              request.getSession().setAttribute("inserted", " student mark sucessfuly inserted");
              response.sendRedirect("Instructor/Submit.jsp");
          }
          else{
              request.getSession().setAttribute("not","student mark not inserted");
              response.sendRedirect("Instructor/Submit.jsp");
          }
            } finally {
           
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
            Logger.getLogger(ApprovalController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ApprovalController.class.getName()).log(Level.SEVERE, null, ex);
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
