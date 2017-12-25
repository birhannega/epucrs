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
 * @author seid
 */
public class Mark_submit {
    
   connectionManager dbcon=new connectionManager();
    public int Mark(String mark,String stud_id,String teacher_id,String subject_id,
            String section,String term,String test_type,String academicyear,
            String department,String program) throws ClassNotFoundException, SQLException{
        
         PreparedStatement ps_mark=dbcon.getconnection().prepareStatement("insert into TBL_TEST values(?,?,?,?,?,?,?,?,?,?)");
         ps_mark.setString(1, mark);
         ps_mark.setString(2, stud_id);
         ps_mark.setString(3, teacher_id);
           ps_mark.setString(4, term);
    
    
         ps_mark.setString(5, test_type);
           
         ps_mark.setString(6, subject_id);
            
            ps_mark.setString(7, academicyear);
        ps_mark.setString(8, section);
   
           ps_mark.setString(9, department);
            ps_mark.setString(10, program);
         
         
      int mark_inserted=ps_mark.executeUpdate();
        
        
    return mark_inserted;
       
}

   
}
