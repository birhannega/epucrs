/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class CourseManagement {
    connectionManager connection=new connectionManager();
    public int registerCourse(String id,String term,String name,String date,String subject,String creditHr,String prerequest) throws SQLException, ClassNotFoundException
    {
        int action=0;
       
            PreparedStatement ps_register=connection.getconnection().prepareStatement("INSERT INTO TBL_COURSE_REGISTRATION (COURSE_CODE,TERM, COURSE_NAME, ADDED_DATE,COURSE_TYPE,CREDIT_HOURS, PRE_REQUEST) VALUES(?,?,?,?,?,?,?)");
              ps_register.setString(1, id);
               ps_register.setString(2, term);
              ps_register.setString(3, name);
              ps_register.setString(4, date);
              ps_register.setString(5, subject);
              ps_register.setString(6, creditHr);
               ps_register.setString(7, prerequest);
             action=ps_register.executeUpdate();
          
              return action;
     
    }
    
}
