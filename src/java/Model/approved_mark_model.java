/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class approved_mark_model {
    connectionManager connection=new connectionManager();
       public int approvalmark(float mark_40,float mark_60,String approvalname,String teacherid,String currentyear,String academicyer,
           String modulecode,float mark_100,String program,String studid,String grade,
            String term,int status,String registrar,String section) throws ClassNotFoundException, SQLException
    {               int approved;
                    PreparedStatement ps_mark_approval=connection.getconnection().prepareStatement("insert into TBL_MARK values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps_mark_approval.setFloat(1, mark_40);
                    ps_mark_approval.setFloat(2, mark_60);
                    ps_mark_approval.setString(3, approvalname);
                    ps_mark_approval.setString(4, teacherid);
                    ps_mark_approval.setString(5, currentyear);
                    ps_mark_approval.setString(6, academicyer);
                    ps_mark_approval.setString(7, modulecode);
                    ps_mark_approval.setFloat(8, mark_100);
                    ps_mark_approval.setString(9, program);
                    ps_mark_approval.setString(10, studid);
                    ps_mark_approval.setString(11, grade);
                    ps_mark_approval.setString(12, term);
                    ps_mark_approval.setInt(13, status);
                    ps_mark_approval.setString(14, registrar);
                    ps_mark_approval.setString(15, section);
                    approved=ps_mark_approval.executeUpdate();
                    
                    

      return approved; 
    }
       // resubmit 
       public int resubmit(float mark_40,float mark_60,float mark_100,String stud_id,String grade,int status ) throws ClassNotFoundException, SQLException{
           PreparedStatement ps_resubmit=connection.getconnection().prepareStatement("update tbl_mark set mark_40=?,mark_60=?,TOTAL=?,grade=?,status=? where stud_id=?");
          ps_resubmit.setFloat(1, mark_40);
          ps_resubmit.setFloat(2, mark_60);
          ps_resubmit.setFloat(3, mark_100);
          ps_resubmit.setString(4, grade);
          ps_resubmit.setInt(5, status);
             ps_resubmit.setString(6, stud_id);
          ps_resubmit.executeUpdate();
           return 0;
       }
    
}
