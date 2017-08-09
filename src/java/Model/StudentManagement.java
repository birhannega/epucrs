/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

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
            String Stud_Police_Commision_Number,String STUD_TYPE) throws ClassNotFoundException, SQLException {

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
                + ", STUD_TYPE"
                + ")"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

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
        ps_register.setString(11, Stud_Contact_Person_Adress);
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
        ps_register.setString(25, STUD_TYPE);

        int registrationcheker = ps_register.executeUpdate();
        //  registrationcheker=res_reg.next();
        return registrationcheker;
    }
//    public int Setsessinid(String STUD_ID)
//    {
//       
//        return 0;
//    }

    public int savefamilyinfo(
            String FATHER_FNAME,
            String FATHER_LAST_NAME,
            String FATHER_MIDDLE_NAME,
            String FATHER_REGIONAL_ADDRESS,
            String FATHER_ZONAL_ADDRESS,
            String FATHER_WOREDA_ADDRESS,
            String FATHER_TOWN_ADDRESS,
            String FATHER_KEBELE_ADDRESS,
            String FATHER_HOUSE_NUMBER,
            String FATHER_OCCUPATION,
            String FATHER_PLACE_OF_WORK,
            String MOTHER_FNAME,
            String MOTHER_LAST_NAME,
            String MOTHER_MIDDLE_NAME,
            String MOTHER_REGIONAL_ADDRESS,
            String MOTHER_ZONAL_ADDRESS,
            String MOTHER_WOREDA_ADDRESS,
            String MOTHER_TOWN_ADDRESS,
            String MOTHER_KEBELE_ADDRESS,
            String MOTHER_HOUSE_NUM_ADDRESS,
            String MOTHER_OCCUPATION,
            String MOTHER_PLACE_OF_WORK,
            String studid
    ) throws ClassNotFoundException, SQLException {
        PreparedStatement ps_register_family = dbconnection.getconnection().prepareStatement("Insert into TBL_FAMILY_BACKGROUND("
                + "FATHER_FNAME"
                + ",FATHER_LAST_NAME"
                + ",FATHER_MIDDLE_NAME"
                + ",FATHER_REGIONAL_ADDRESS"
                + ",FATHER_ZONAL_ADDRESS"
                + ",FATHER_WOREDA_ADDRESS"
                + ",FATHER_TOWN_ADDRESS"
                + ",FATHER_KEBELE_ADDRESS"
                + ",FATHER_HOUSE_NUM_ADDRESS"
                + ",FATHER_OCCUPATION"
                + ",FATHER_PLACE_OF_WORK"
                + ",MOTHER_FNAME"
                + ",MOTHER_LAST_NAME"
                + ",MOTHER_MIDDLE_NAME"
                + ",MOTHER_REGIONAL_ADDRESS"
                + ",MOTHER_ZONAL_ADDRESS"
                + ",MOTHER_WOREDA_ADDRESS"
                + ",MOTHER_TOWN_ADDRESS"
                + ",MOTHER_KEBELE_ADDRESS"
                + ",MOTHER_HOUSE_NUM_ADDRESS"
                + ",MOTHER_OCCUPATION"
                + ",MOTHER_PLACE_OF_WORK"
                       + ",STUD_ID"
                + ")"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        ps_register_family.setString(1, FATHER_FNAME);
        ps_register_family.setString(2, FATHER_LAST_NAME);
        ps_register_family.setString(3, FATHER_MIDDLE_NAME);
        ps_register_family.setString(4, FATHER_REGIONAL_ADDRESS);
        ps_register_family.setString(5, FATHER_ZONAL_ADDRESS);
        ps_register_family.setString(6, FATHER_WOREDA_ADDRESS);
        ps_register_family.setString(7, FATHER_TOWN_ADDRESS);
        ps_register_family.setString(8, FATHER_KEBELE_ADDRESS);
        ps_register_family.setString(9, FATHER_HOUSE_NUMBER);
        ps_register_family.setString(10, FATHER_OCCUPATION);
        ps_register_family.setString(11, FATHER_PLACE_OF_WORK);
        ps_register_family.setString(12, MOTHER_FNAME);
        ps_register_family.setString(13, MOTHER_LAST_NAME);
        ps_register_family.setString(14, MOTHER_MIDDLE_NAME);
        ps_register_family.setString(15, MOTHER_REGIONAL_ADDRESS);
        ps_register_family.setString(16, MOTHER_ZONAL_ADDRESS);
        ps_register_family.setString(17, MOTHER_WOREDA_ADDRESS);
        ps_register_family.setString(18, MOTHER_TOWN_ADDRESS);
        ps_register_family.setString(19, MOTHER_KEBELE_ADDRESS);
        ps_register_family.setString(20, MOTHER_HOUSE_NUM_ADDRESS);
        ps_register_family.setString(21, MOTHER_OCCUPATION);
        ps_register_family.setString(22, MOTHER_PLACE_OF_WORK);
         ps_register_family.setString(23, studid);
        int registrationcheker = ps_register_family.executeUpdate();

        return registrationcheker;
    }

    public int STUD_PSEI(
        String DATE_PSEI,
        String NAME_OF_INSTITUTION,
        String PROGRAM_ATENDED,
        String STUD_ID)
            throws ClassNotFoundException, SQLException {

        PreparedStatement ps_register = dbconnection.getconnection().prepareStatement("Insert into TBL_PSEI("
                + "  DATE_PSEI"
                + ", NAME_OF_INSTITUTION"
                + ", PROGRAM_ATENDED"
               + ", STUD_ID"
                + ")"
                + "VALUES(?,?,?,?)");

        ps_register.setString(1, DATE_PSEI);
        ps_register.setString(2, NAME_OF_INSTITUTION);
        ps_register.setString(3, PROGRAM_ATENDED);
        ps_register.setString(4, STUD_ID);
      
        int registrationcheker = ps_register.executeUpdate();
        //  registrationcheker=res_reg.next();
        return registrationcheker;
    
}
 public int STUD_ESLCE(String EXAM,String GRADE,String GRADE_OBTAINED,String YEAR_TAKEN,String STUD_ID)
            throws ClassNotFoundException, SQLException {

        PreparedStatement ps_register = dbconnection.getconnection().prepareStatement("Insert into TBL_ESLCE("
                + "  EXAM"
                + ", GRADE"
                + ", GRADE_OBTAINED"
                + ", YEAR_TAKEN"
               + ", STUD_ID"
                + ")"
                + "VALUES(?,?,?,?,?)");

        ps_register.setString(1, EXAM);
        ps_register.setString(2, GRADE);
        ps_register.setString(3, GRADE_OBTAINED);
        ps_register.setString(4, YEAR_TAKEN);
        ps_register.setString(5, STUD_ID);
        int registrationcheker = ps_register.executeUpdate();
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
     public int savestudprogram(String studentID, String program, String department) throws ClassNotFoundException, SQLException {
         
         PreparedStatement ps_savedepartment=dbconnection.getconnection().prepareStatement("insert into TBL_STUD_DEP(Stud_id,Dep_id,Program_id) values(?,?,?) ");
         ps_savedepartment.setString(1, studentID);
         ps_savedepartment.setString(2, program);
         ps_savedepartment.setString(3, department);
        int checkup= ps_savedepartment.executeUpdate();
        return checkup;
    }
}
