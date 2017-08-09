/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.sql.*;
import dbconnection.connectionManager;

/**
 *
 * @author user
 */
public class UserManagement {
     connectionManager dbconnection=new connectionManager();
     Connection connection;
     int result=0;

    public UserManagement() throws ClassNotFoundException, SQLException {
        this.connection = dbconnection.getconnection();
    }
    public int authenticateuser(String username,String status,String password) throws SQLException{
        
       PreparedStatement ps_login_check=connection.prepareStatement("select * from TBL_user where user_id=? and status=? and password=?");
       ps_login_check.setString(1, username);
       ps_login_check.setString(2, status);
       ps_login_check.setString(3, password);
       result=ps_login_check.executeUpdate();
       
        return result;
    }
    
}
