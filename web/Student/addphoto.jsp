<%-- 
    Document   : addphoto
    Created on : Dec 6, 2017, 11:24:01 AM
    Author     : luv2codeit
--%>

<%@page import="dbconnection.connectionManager"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 <%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

            connectionManager dbcon=new connectionManager();
                    
            Connection conn = dbcon.getconnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
         
            FileInputStream fis = null;
            try {
                
                //File image = new File("C:/Users/luv2codeit/Desktop/debrezeit.jpg");
                Part imgs=request.getPart("picture");
                String id=request.getParameter("studid");
                pstmt = conn.prepareStatement("insert into TBL_PICTURES(stud_id, photo) " + "values(?,?)");
                pstmt.setString(1, id);
            
              
               // fis = new FileInputStream(image);
                InputStream picstream=imgs.getInputStream();
                pstmt.setBinaryStream(2, picstream);
 
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    System.out.println("The image has been inserted successfully");
                } else {
                    System.out.println("The image did not insert successfully");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                        rs = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
 
        %>
  
