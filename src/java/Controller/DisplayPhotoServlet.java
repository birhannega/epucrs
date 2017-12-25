package Controller;

import dbconnection.connectionManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DisplayPhotoServlet", urlPatterns = {"/displayphoto"})
public class DisplayPhotoServlet extends HttpServlet {

    @Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
        connectionManager con=new connectionManager();
            PreparedStatement ps = con.getconnection().prepareStatement("select * from TBL_ACADEMIC_STAFF_REG where  ACADEMIC_STAFF_ID=? ");
            String name = request.getParameter("name");
            ps.setString(1,name );
            ResultSet rs = ps.executeQuery();
            rs.next();
            Blob b = rs.getBlob("IMAGE");
            response.setContentType("image/jpeg");
            response.setContentLength((int) b.length());
            InputStream is = b.getBinaryStream();
            
            try (
                    OutputStream os = response.getOutputStream()) {
                byte buf[] = new byte[(int) b.length(  )];
                is.read(buf);
                os.write(buf);
            }
        } catch (ClassNotFoundException | SQLException | IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
