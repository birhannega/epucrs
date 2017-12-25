package Controller;

import dbconnection.connectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListPlayersServlet", urlPatterns = {"/listplayers"})
public class ListPlayersServlet extends HttpServlet {
    @Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
connectionManager con=new connectionManager();
PreparedStatement ps = con.getconnection().prepareStatement("select * from TBL_ACADEMIC_STAFF_REG");
            ResultSet rs = ps.executeQuery();
            out.println("<h3>Students</h3>");
            while ( rs.next()) {
                  out.println("<h3>" + rs.getString("ACADEMIC_STAFF_ID") + "</h3>");
                    out.println("<img width='100' height='50' src=displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
            }
           
        }
        catch(ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
