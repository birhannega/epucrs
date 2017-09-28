/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class InstructorRegModel {
     connectionManager connection=new connectionManager();
     
     public int instructor_registration(String nstid,String insttitle,String  firsname,String middlename,String lastname,String phoneno, String email,String department,
            String salary,String status,String insttype,String responsibility,String hireddate,String description) throws SQLException, ClassNotFoundException {
         int result=0;
         PreparedStatement prestm=connection.getconnection().prepareStatement("Insert into TBL_ACADEMIC_STAFF_REG( Staff_Id ,Title , First_Name  ,"+ 
         " Middle_Name ,Last_Name,Phone , E_Mail ,Departement ," +
         " SALARY,Status ,STAFF_TYPE ,RESPONSIBILITY,HIRED_DATE, DESCRIPTION) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

         prestm.setString(1, nstid);
              prestm.setString(2, insttitle);
              prestm.setString(3, firsname);
              prestm.setString(4, middlename);
              prestm.setString(5, lastname);
               prestm.setString(6, phoneno);
              prestm.setString(7, email);
               prestm.setString(8, department);
              prestm.setString(9, salary);
              prestm.setString(10, status);
               prestm.setString(11, insttype);
              prestm.setString(12, responsibility);
              prestm.setString(13, hireddate);
              prestm.setString(14, description);
//              prestm.setBlob(2, inputstram);
//              prestm.setString(3, insttitle);
//              prestm.setString(4, firsname);
//              prestm.setString(5, middlename);
//              prestm.setString(6, lastname);
//               prestm.setString(7, phoneno);
//              prestm.setString(8, email);
//               prestm.setString(9, department);
//              prestm.setString(10, salary);
//              prestm.setString(11, status);
//               prestm.setString(12, insttype);
//              prestm.setString(13, responsibility);
//              prestm.setString(14, hireddate);
//              prestm.setString(15, description);
              result=prestm.executeUpdate();
          
         return result;
        
    }
     //add expriance
     public int instructor_exp_reg(String expid,String expctgry,String exptype,String orgname,String  totalexp,String datefrom_exp_from,String datefrom_exp_to) throws SQLException, ClassNotFoundException {
         int result=0;
         PreparedStatement prestm=connection.getconnection().prepareStatement("Insert into TBL_INST_EXPERTISE( INSTEXP_ID ,AREA_EXPERTISE ,ORG_TYPE, ORG_NAME  ,"+ 
         " TOTAL_EXPERTISE ,DATE_FROM,DATE_TO) values(?,?,?,?,?,?,?)");

         prestm.setString(1, expid);
              prestm.setString(2, expctgry);
              prestm.setString(3, exptype);
              prestm.setString(4, orgname);
              prestm.setString(5, totalexp);
               prestm.setString(6, datefrom_exp_from);
              prestm.setString(7, datefrom_exp_to);
              
              result=prestm.executeUpdate();
          
         return result;
        
    }
    
}
