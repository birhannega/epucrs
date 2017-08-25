/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class TrainingCorseManagement {
   connectionManager dbcon=new connectionManager();
   public int TrainingCorseRegistration(String credithour,String course_type,String coursename,
            String title,String pre_request,String Course_code) throws ClassNotFoundException, SQLException{
      PreparedStatement ps_trainingcourse_reg=dbcon.getconnection().prepareStatement("insert into TBL_TRAINING values(?,?,?,?,?,?)");
            ps_trainingcourse_reg.setString(1, credithour);
            ps_trainingcourse_reg.setString(2, course_type);
                    ps_trainingcourse_reg.setString(3, coursename);
                    ps_trainingcourse_reg.setString(4, title);
                            ps_trainingcourse_reg.setString(5, pre_request);
                           ps_trainingcourse_reg.setString(6, Course_code); 
                           int  course_registerd;
           course_registerd = ps_trainingcourse_reg.executeUpdate();
                               return course_registerd;
                            
        
    }
public int ediCcourse(String credit,String course_type,String course_name,
         String title,String pre_request,String course_code) throws ClassNotFoundException, SQLException{
         PreparedStatement ps_edit=dbcon.getconnection().prepareStatement("update TBL_TRAINING set credit_hour=?,"
         + "course_type=?,course_name=?,title=?,"
         + "pre_request=? where course_code=?");
         ps_edit.setString(1, credit);
         ps_edit.setString(2, course_type);
         ps_edit.setString(3, course_name);
         ps_edit.setString(4, title);
         ps_edit.setString(5, pre_request);
         ps_edit.setString(6, course_code);
         int edit=ps_edit.executeUpdate();
    return edit;
}
           public int deleteCourse(String credithour,String course_type,String course_name,
          String title,String pre_request,String course_code) throws ClassNotFoundException, SQLException
{
    PreparedStatement ps_delete=dbcon.getconnection().prepareStatement("delete * from TBL_TRAINING where course_code=?");
    ps_delete.executeUpdate();
    return 0;
}
}
