/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class ClassModel {
connectionManager connmgt=new connectionManager();
//Connection conn = connmgt.getconnection();
 
public int class_reg(String classid,String blockname,String classname, String regdate) throws SQLException, ClassNotFoundException
{
    int regclc=0;
   // PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("insert into tbl_class(class_id,block_name,class_name,reg_date) values(?,?,?,?)");
    PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("INSERT INTO TBL_CLASS (CLASS_ID,BLOCK_NAME,CLASS_NAME,REG_DATE) VALUES(?,?,?,?)");
    pr_stmt.setString(1, classid);
    pr_stmt.setString(2, blockname);
    pr_stmt.setString(3, classname);
    pr_stmt.setString(4, regdate);
    regclc=pr_stmt.executeUpdate();
    return regclc;
}
    
}
