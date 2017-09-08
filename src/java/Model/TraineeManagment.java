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
public class TraineeManagment {
    connectionManager dbcon=new connectionManager();
    public int Trainee_reg (String birthdate,String department,String end_date,
            String firstname,String middlename,String lastname,String phone_no,String Start_date,String Title,String term) throws ClassNotFoundException, SQLException
    {
        PreparedStatement ps_trainee=dbcon.getconnection().prepareStatement("insert into TBL_TRAINEE values(?,?,?,?,?,?,?,?,?,?)");
        ps_trainee.setString(1, birthdate);
        ps_trainee.setString(2, department);
        ps_trainee.setString(3, end_date);
        ps_trainee.setString(4, firstname);
        ps_trainee.setString(6, middlename);
        ps_trainee.setString(5, lastname);
        ps_trainee.setString(7, phone_no);
        ps_trainee.setString(8, Start_date);
        ps_trainee.setString(9, Title);
        ps_trainee.setString(10, term);
        int trainee_registration=ps_trainee.executeUpdate();
        return trainee_registration;
    }
    
}
