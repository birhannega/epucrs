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
public class program_manager_model {
        int result;
 public int Approved(int Status,String program_manager,String stud_id) throws ClassNotFoundException, SQLException{
     connectionManager con=new connectionManager();
     PreparedStatement ps_approval=con.getconnection().prepareStatement("update TBL_MARK set STATUS=?,PROGRAMMANAGER_NAME=? where Stud_id=?");
     ps_approval.setInt(1, Status);
     ps_approval.setString(2, program_manager);
     ps_approval.setString(3, stud_id);
    result= ps_approval.executeUpdate();
     
     return result;
 }
    
}

   


