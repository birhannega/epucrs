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
public class RegistrarApproval_model {
    public int Approval(int status,String name,String id) throws ClassNotFoundException, SQLException{
        int i=0;
        connectionManager con=new connectionManager();
     PreparedStatement ps_approval=con.getconnection().prepareStatement("update TBL_MARK set STATUS=?,REGISTRATION_OFFICER_NAME=? where Stud_id=?");
     ps_approval.setInt(1, status);
     ps_approval.setString(2, name);
     ps_approval.setString(3, id);
     i=ps_approval.executeUpdate();
        return i;
    }
    
}
