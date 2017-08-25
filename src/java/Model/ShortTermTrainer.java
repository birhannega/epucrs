/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import dbconnection.connectionManager;
import java.sql.*;
public class ShortTermTrainer {
connectionManager dbconnection = new connectionManager();
public int Trainer(String birthdate,String  EXPERIENCE,String firstname,String hireddate, String lastname,
            String middlename,String tel,
            String title)throws ClassNotFoundException, SQLException {
       PreparedStatement ps_trainer_reg= dbconnection.getconnection().prepareStatement("insert into TBL_TRAINER values(?,?,?,?,?,?,?,?)");
              ps_trainer_reg.setString(1, birthdate);
       ps_trainer_reg.setString(2, EXPERIENCE);
             ps_trainer_reg.setString(3, firstname);
                 ps_trainer_reg.setString(4, hireddate); 
                     ps_trainer_reg.setString(5, lastname);
                   ps_trainer_reg.setString(6, middlename);
                     ps_trainer_reg.setString(7, tel);
                      ps_trainer_reg.setString(8, title);
                       int registerd= ps_trainer_reg.executeUpdate();
                                           return registerd;
                                          
    
        
        
    }
   
}
