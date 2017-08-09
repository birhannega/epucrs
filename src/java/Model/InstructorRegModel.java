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
 * @author user
 */
public class InstructorRegModel {
     connectionManager connection=new connectionManager();
     public int instructor_registration(String nstid,String ImageFile,String insttitle,String  firsname,String middlename,String lastname,String phoneno, String email,String department,
            String salary,String status,String insttype,String responsibility,String hireddate,String description) throws SQLException, ClassNotFoundException {
         int result=0;
         PreparedStatement prestm=connection.getconnection().prepareStatement("Insert into TBL_ACADEMIC_STAFF_REG( Staff_Id , Image ,  Title , First_Name  ,"+ 
         " Middle_Name ,Last_Name,Phone , E_Mail ,Departement ," +
         " SALARY,Status ,STAFF_TYPE ,RESPONSIBILITY,HIRED_DATE, DESCRIPTION) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

         prestm.setString(1, nstid);
               prestm.setString(2, ImageFile);
              prestm.setString(3, insttitle);
              prestm.setString(4, firsname);
              prestm.setString(5, middlename);
              prestm.setString(6, lastname);
               prestm.setString(7, phoneno);
              prestm.setString(8, email);
               prestm.setString(9, department);
              prestm.setString(10, salary);
              prestm.setString(11, status);
               prestm.setString(12, insttype);
              prestm.setString(13, responsibility);
              prestm.setString(14, hireddate);
              prestm.setString(15, description);
              result=prestm.executeUpdate();
          
         return result;
        
    }
    
}
