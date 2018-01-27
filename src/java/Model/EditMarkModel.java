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
public class EditMarkModel {
        connectionManager con=new connectionManager();
    public int activity(String stud_id,String activity) throws ClassNotFoundException, SQLException{
 
     PreparedStatement  ps=con.getconnection().prepareStatement("update tbl_test set mark =? where stud_id=? and test_type='activity' ");
       ps.setString(1, activity);
         ps.setString(2, stud_id);
        ps.executeUpdate();
     return 0;
            }
     public int test(String studid,String test1 ) throws ClassNotFoundException, SQLException{
         PreparedStatement p1=con.getconnection().prepareStatement("update tbl_test set mark =? where stud_id=? and test_type='test1' ");
         p1.setString(1, test1);
         p1.setString(2, studid);
         p1.executeUpdate();
      return 0;
    }
     public int project(String studidp,String project ) throws ClassNotFoundException, SQLException{
         PreparedStatement p1=con.getconnection().prepareStatement("update tbl_test set mark =? where stud_id=? and test_type='project' ");
         p1.setString(1, project);
         p1.setString(2, studidp);
         p1.executeUpdate();
      return 0;
    }
    
    public int midexam(String studid,String mid) throws ClassNotFoundException, SQLException{
        PreparedStatement ps3=con.getconnection().prepareStatement("update tbl_test set mark=? where stud_id=? and test_type='mid'");
             ps3.setString(1, mid);
        ps3.setString(2, studid);
   
        ps3.executeUpdate();
        return 0;
    }
    public int finalexam(String studid,String finalexam) throws ClassNotFoundException, SQLException{
        PreparedStatement ps4=con.getconnection().prepareStatement("update tbl_test set mark=? where stud_id=? and test_type='final'");
      
        ps4.setString(1, finalexam);
          ps4.setString(2, studid);
          ps4.executeUpdate();
        return 0;
    }
      public int Attendance(String studid,String Attendance) throws ClassNotFoundException, SQLException{
        PreparedStatement ps3=con.getconnection().prepareStatement("update tbl_test set mark=? where stud_id=? and test_type='Attendance'");
        
        ps3.setString(1, Attendance);
        ps3.setString(2, studid);
        ps3.executeUpdate();
        return 0;
    }
    public int conductevaluation(String studid,String conductevaluation) throws ClassNotFoundException, SQLException{
        PreparedStatement ps4=con.getconnection().prepareStatement("update tbl_test set mark=? where stud_id=? and test_type='conductevaluation'");
        ps4.setString(1, conductevaluation);
    
        ps4.setString(2, studid);
        ps4.executeUpdate();
           return 0;
    }
}
