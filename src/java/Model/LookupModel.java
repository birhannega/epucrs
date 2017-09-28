/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class LookupModel implements Serializable {
connectionManager connmgt=new connectionManager();
public int lookup_dep(String depid,String depname) throws SQLException, ClassNotFoundException
{
    int regclc=0;
   // PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("insert into tbl_class(class_id,block_name,class_name,reg_date) values(?,?,?,?)");
    PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("INSERT INTO LU_DEP(DEP_ID,DEP_NAME) values(?,?)");
    pr_stmt.setString(1, depid);
    pr_stmt.setString(2, depname);
    regclc=pr_stmt.executeUpdate();
    return regclc;
}
    
}
