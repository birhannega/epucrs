                <%@page import="dbconnection.connectionManager"%>
                <%@ page import="java.sql.*"%>

                <%@ page import="java.io.*"%>

                <% 
               Blob image = null;

                Connection con = null;

                byte[ ] imgData = null ;

                Statement stmt = null;

                ResultSet rs = null;

                try {

                connectionManager dbc=new connectionManager();

                con = dbc.getconnection();

                stmt = con.createStatement();

                rs = stmt.executeQuery("select photo from TBL_PICTURES where Stud_id = 'ADPR/018/2017'");

                if (rs.next()) {

                image = rs.getBlob(1);

                imgData = image.getBytes(1,(int)image.length());

                } else {

                out.println("Display Blob Example");

                out.println("image not found for given id>");

                return;

                }

                // display the image

                response.setContentType("image/gif");

                OutputStream o = response.getOutputStream();
                 
                o.write(imgData);

                o.flush();

                o.close();

                } catch (Exception e) {

                out.println("Unable To Display image");

                out.println("Image Display Error=" + e.getMessage());

                return;

                } finally {

                try {

                rs.close();

                stmt.close();

                con.close();

        } catch (SQLException e) {

        e.printStackTrace();

        }

        }

        %> 