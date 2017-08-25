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
    public int Mark(String stud_id,String teacher_id,String subject_id,String section,String term,String test_type,String grade, float mark) throws ClassNotFoundException, SQLException{
        
         PreparedStatement ps_mark=dbcon.getconnection().prepareStatement("insert into TBL_MARK_SUBMISSION values(?,?,?,?,?,?,?,?)");
         ps_mark.setFloat(1, mark);
         ps_mark.setString(2, stud_id);
         ps_mark.setString(3, teacher_id);
         ps_mark.setString(4, section);
         ps_mark.setString(6, grade);
             ps_mark.setString(5, test_type);
       
         ps_mark.setString(7, term);
     
         ps_mark.setString(8, subject_id);
      int mark_inserted=ps_mark.executeUpdate();
        
        
    return mark_inserted;
       
}

//   public int editMark(String subject_id,String section,String term,String TestType,String grade,float mark) throws ClassNotFoundException, SQLException{
//       connectionManager connection=new connectionManager();
//       PreparedStatement ps_editmark=connection.getconnection().prepareStatement("update TBL_TRAINING set subject_id=?,"
//               + "section=?, term=?,grade=?,mark=? where ");
//     
//   return 0;
//   }
   
}
