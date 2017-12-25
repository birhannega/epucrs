/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dbconnection.connectionManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "ImageRetrieve", urlPatterns = {"/ImageRetrieve"})
@MultipartConfig(maxFileSize = 16177215)
//@MultipartConfig(FilSizeThreshold = 1024 * 1024 * 2,)
public class ImageRetrieve extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        

		try{			
			 connectionManager dbconnection = new connectionManager();
                                 Statement stmt = dbconnection.getconnection().createStatement();
//                                 PreparedStatement ps=stmt.executeLargeUpdate("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");
			
			ResultSet rs1 = stmt.executeQuery("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");
			
                        String imgLen="";
                                 
			if(rs1.next()){
				imgLen = rs1.getString(1);
				System.out.println(imgLen.length());
			}	
			rs1 = stmt.executeQuery("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");
			if(rs1.next()){
				int len = imgLen.length();
				byte [] rb = new byte[len];
				InputStream readImg = rs1.getBinaryStream(1);
				int index=readImg.read(rb, 0, len);	
				System.out.println("index"+index);
				stmt.close();
				response.reset();
				response.setContentType("image/jpg");
				response.getOutputStream().write(rb,0,len);
				response.getOutputStream().flush();				
			}
		}
		catch (Exception e){
			e.printStackTrace();
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
        
        try{  
   connectionManager dbconnection = new connectionManager();
   Statement stmt = dbconnection.getconnection().createStatement();
  ResultSet rs1 = stmt.executeQuery("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");
  String imgLen="";
  if(rs1.next()){
  imgLen = rs1.getBlob(1).toString();
  System.out.println(imgLen.length());
  }  
  rs1 = stmt.executeQuery
  ("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");
  if(rs1.next()){
  int len = imgLen.length();
  byte [] rb = new byte[len];
  InputStream readImg = rs1.getBinaryStream(1);
  int index=readImg.read(rb, 0, len);  
  System.out.println("index"+index);
  stmt.close();
  response.reset();
  response.setContentType("image/jpg");
  response.getOutputStream().write(rb,0,len);
  response.getOutputStream().flush();  
  }
  }
  catch (Exception e){
  e.printStackTrace();
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
            Logger.getLogger(ImageRetrieve.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ImageRetrieve.class.getName()).log(Level.SEVERE, null, ex);
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
