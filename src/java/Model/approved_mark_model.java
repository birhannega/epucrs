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
    int i=0;
    public int approvalmark(String mark_40,String mark_60,String approvalname,String teacherid,String currentyear,
           String modulecode,String credithour,String program,
            String term,String studid,String mark_100,String grade,String academicyer,int status,String registrar,String section) throws ClassNotFoundException, SQLException
    {               int approved;
                    PreparedStatement ps_mark_approval=connection.getconnection().prepareStatement("insert into TBL_MARK values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps_mark_approval.setString(1, mark_40);
                    ps_mark_approval.setString(2, mark_60);
                    ps_mark_approval.setString(3, approvalname);
                    ps_mark_approval.setString(4, teacherid);
                    ps_mark_approval.setString(5, currentyear);
                    ps_mark_approval.setString(6, modulecode);
                    ps_mark_approval.setString(7, credithour);
                    ps_mark_approval.setString(8, program);
                    ps_mark_approval.setString(9, term);
                    ps_mark_approval.setString(10, studid);
                    ps_mark_approval.setString(11, mark_100);
                    ps_mark_approval.setString(12, grade);
                    ps_mark_approval.setString(13, academicyer);
                    ps_mark_approval.setInt(14, status);
                    ps_mark_approval.setString(15, registrar);
                    ps_mark_approval.setString(16, section);
                    approved=ps_mark_approval.executeUpdate();
                    
                    

      return approved; 
    }
    
}
