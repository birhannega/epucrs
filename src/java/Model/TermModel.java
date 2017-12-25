/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.persistence.Entity;

/**
 *
 * @author user
 */
public class TermModel  {
    
    connectionManager connmgt=new connectionManager();
//Connection conn = connmgt.getconnection();
 
public int term_reg(String programname,String termname,String termdate) throws SQLException, ClassNotFoundException
{
    int regclc=0;
   // PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("insert into tbl_class(class_id,block_name,class_name,reg_date) values(?,?,?,?)");
    PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("INSERT INTO LU_TERM (TERM_PROGRAM,TERM_NAME,REG_DATE,TERM_SEQNO) "
            + "VALUES"
            + "(?,?,?,"
            + "SEQNO_TERM.nextval)");
    
    
    pr_stmt.setString(1, programname);
    pr_stmt.setString(2, termname);
    pr_stmt.setString(3, termdate);
    regclc=pr_stmt.executeUpdate();
    return regclc;
}
   
    
}
