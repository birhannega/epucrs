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
public class Re_grade_model {
    public int regrad(String Program_id,String academicyear,String term,String stud_id,String course_module,float changefrom,float changeto,
            String Reportdate,String reason) throws SQLException, ClassNotFoundException{
        connectionManager con=new connectionManager();
        PreparedStatement ps = con.getconnection().prepareStatement("insert into TBL_RE_GRADE values(?,?,?,?,?,?,?,?,?)");
        ps.setString(1, Program_id);
         ps.setString(2, academicyear);
        ps.setString(3, term);
           ps.setString(4, stud_id);
        ps.setString(5, course_module);
        ps.setFloat(6, changefrom);
        ps.setFloat(7, changeto);
        ps.setString(8, reason);
        ps.setString(9, Reportdate);
        int change=ps.executeUpdate();
  return change;    
}
  
}
