/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class CourseAssignmentModel {
    connectionManager connmngr=new connectionManager();
    public int courseAssignment(String instid,String selectinstr,String dateassigned,String program,String course,String creditH,String datemodified,String  modifiedby,String period,String previousinstructor) throws ClassNotFoundException, SQLException{
        
  
        int action=0;
       
            PreparedStatement ps_register=connmngr.getconnection().prepareStatement("INSERT INTO TBL_COURSEASSIGNMENT(INSTRUCTOR_ID, INSTRUCTOR_NAME , ASSIGNED_DATE,PROGRAM, COURSE_NAME, " +
"CREDIT_HOUR,MODIFIED_DATE, MODIFIED_BY,PERIOD, PREV_INSTRUCTOR) VALUES(?,?,?,?,?,?,?,?,?,?)");
             ps_register.setString(1, instid);
            ps_register.setString(2, selectinstr);
               ps_register.setString(3, dateassigned);
              ps_register.setString(4, program);
              ps_register.setString(5, course);
              ps_register.setString(6, creditH);
               ps_register.setString(7, datemodified);
                ps_register.setString(8, modifiedby);
              ps_register.setString(9, period);
               ps_register.setString(10, previousinstructor);
             action=ps_register.executeUpdate();
          
              return action;
        }
    
}
