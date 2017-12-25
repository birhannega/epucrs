<%-- 
    Document   : imageretrieve
    Created on : 01-Dec-2017, 05:14:36
    Author     : user
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                try {
    //  Class.forName("com.mysql.jdbc.Driver").newInstance();
    //  con=DriverManager.getConnection(connectionURL,"root","root");  
    //  Statement st1=con.createStatement();
                    connectionManager dbconnection = new connectionManager();
                    Statement stmt = dbconnection.getconnection().createStatement();
                    ResultSet rs1 = stmt.executeQuery("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");

                    String imgLen = "";
                    if (rs1.next()) {
                        imgLen = rs1.getString(1);
                        System.out.println(imgLen.length());
                    }
                    rs1 = stmt.executeQuery("select IMAGE from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID='alemu-100'");

                    if (rs1.next()) {
                        int len = imgLen.length();
                        byte[] rb = new byte[len];
                        InputStream readImg = rs1.getBinaryStream(1);
                        int index = readImg.read(rb, 0, len);
                        System.out.println("index" + index);
                        stmt.close();
                        response.reset();
                        response.setContentType("image/jpg");
                        response.getOutputStream().write(rb, 0, len);
                        response.getOutputStream().flush();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
       
        %>
    </body>
</html>
