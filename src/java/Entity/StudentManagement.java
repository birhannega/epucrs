/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import dbconnection.connectionManager;
import java.sql.*;

/**
 *
 * @author user
 */
public class StudentManagement {

    connectionManager dbconnection = new connectionManager();

    public int registerStudent(String Stud_id, String Stud_First_Name, String Stud_Last_Name,
            String Stud_Middle_Name, String Stud_Birthdate,
            String Stud_Title, String Stud_Birth_Region,
            String Stud_Birth_Zone, String Stud_Birth_Wereda, String Stud_Birth_Kebele,
            String Stud_Contact_Person_Adress, String Stud_Contact_Person_Phone,
            String Stud_Contact_Person_Name,
            String Stud_Contact_Person_Prelation,
            String Stud_Contact_Person_Religion,
            String Stud_Contact_Person_Tel,
            String Stud_Gender,
            String Stud_Home_Region,
            String Stud_Home_Town,
            String Stud_Home_Wereda,
            String Stud_Home_Zone,
            String Stud_Nationality,
            String Stud_Police_Commision_Sector,
            String Stud_Police_Commision_Number) throws ClassNotFoundException, SQLException {
       
        PreparedStatement ps_register = dbconnection.getconnection().prepareStatement("Insert into TBL_STUDENT_PROFILE("
                + "  Stud_Id"
                + ", Stud_First_Name"
                + ", Stud_Last_Name"
                + ", Stud_Middle_Name"
                + ", Stud_Birthdate"
                + ", Stud_Title"
                + ", Stud_Birth_Region"
                + ", Stud_Birth_Zone"
                + ", Stud_Birth_Wereda"
                + ", Stud_Birth_Kebele"
                + ", Stud_Contact_Person_Adress"
                + ", Stud_Contact_Person_Phone"
                + ", Stud_Contact_Person_Name"
                + ", Stud_Contact_Person_Prelation"
                + ", Stud_Contact_Person_Religion"
                + ", Stud_Contact_Person_Tel"
                + ", Stud_Gender"
                + ", Stud_Home_Region"
                + ", Stud_Home_Town"
                + ", Stud_Home_Wereda"
                + ", Stud_Home_Zone"
                + ", Stud_Nationality"
                + ", Stud_Police_Commision_Sector"
                + ", Stud_Police_Commision_Number"
                + ")"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        ps_register.setString(1, Stud_id);
        ps_register.setString(2, Stud_First_Name);
        ps_register.setString(3, Stud_Last_Name);
        ps_register.setString(4, Stud_Middle_Name);
        ps_register.setString(5, Stud_Birthdate);
        ps_register.setString(6, Stud_Title);
        ps_register.setString(7, Stud_Birth_Region);
        ps_register.setString(8, Stud_Birth_Zone);
        ps_register.setString(9, Stud_Birth_Wereda);
        ps_register.setString(10, Stud_Birth_Kebele);
        ps_register.setString (11, Stud_Contact_Person_Adress);
        ps_register.setString(12, Stud_Contact_Person_Phone);
        ps_register.setString(13, Stud_Contact_Person_Name);
        ps_register.setString(14, Stud_Contact_Person_Prelation);
        ps_register.setString(15, Stud_Contact_Person_Religion);
        ps_register.setString(16, Stud_Contact_Person_Tel);
        ps_register.setString(17, Stud_Gender);
        ps_register.setString(18, Stud_Home_Region);
        ps_register.setString(19, Stud_Home_Town);
        ps_register.setString(20, Stud_Home_Wereda);
        ps_register.setString(21, Stud_Home_Zone);
        ps_register.setString(22, Stud_Nationality);
        ps_register.setString(23, Stud_Police_Commision_Sector);
        ps_register.setString(24, Stud_Police_Commision_Number);

     int  registrationcheker = ps_register.executeUpdate();
      //  registrationcheker=res_reg.next();
        return registrationcheker;
    }

    public int EditStudentInfo(String studentID) {
        return 0;
    }

    public int withdrawStudent(String studentID) {
        return 0;
    }

    public int readmit(String studentID) {
        return 0;
    }
}
