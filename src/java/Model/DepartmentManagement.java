/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author luv2codeit
 */
public class DepartmentManagement {
    connectionManager dbconnection=new connectionManager();
        PreparedStatement ps;
        Connection connection;
        ResultSet rs;
        
    public String getdepartmentname(String id) throws SQLException
    {
    String name=null;
   ps=connection.prepareStatement("select department_name from tbl_department where dep_id='?'");
   ps.setString(1, id);
   rs=ps.executeQuery();
   
   if(rs.next())
   {
   name=rs.getString(1);
   }
    return name;
    }
    
    
    
}
