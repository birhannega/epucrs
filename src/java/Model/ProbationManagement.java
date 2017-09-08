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
public class ProbationManagement {
     public int probationRegistration(String approvalname,String currentresult,String department,
             String exepectedresult,String registrarofficename,String status,String trainername,String submissiondate) throws ClassNotFoundException, SQLException{
         connectionManager con=new connectionManager();
         PreparedStatement ps_probation=con.getconnection().prepareStatement("insert into TBL_PROBATION values(?,?,?,?,?,?,?,?)");
  
         ps_probation.setString(1, approvalname);
         ps_probation.setString(2, currentresult);
         ps_probation.setString(3, department);
         ps_probation.setString(4, exepectedresult);
         ps_probation.setString(5, registrarofficename);
         ps_probation.setString(6, status);
         ps_probation.setString(7, trainername);
         ps_probation.setString(8, submissiondate);
        int registerd=ps_probation.executeUpdate();
          return registerd; 
     }

}
