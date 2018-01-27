package Controller;
import Model.StudentManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "addPhoto", urlPatterns = {"/uploadprofilepic"})
@MultipartConfig
public class uploadprofile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
        
            String studid = request.getParameter("studid");
          
            
            Part photo =  request.getPart("picture");
                        
              StudentManagement photo1=new StudentManagement();
               photo1.uploadPhoto(studid,photo);
              String message= "Added Player Successfully";
              HttpSession session=request.getSession();
          session.setAttribute("message", message);
          response.sendRedirect("Student/index.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(uploadprofile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}