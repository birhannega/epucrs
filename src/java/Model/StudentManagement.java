/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.io.IOException;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
public class StudentManagement {

    connectionManager dbconnection = new connectionManager();

    public int registerStudent(
            String Stud_id,
            String Stud_First_Name,
            String Stud_Last_Name,
            String Stud_Middle_Name,
            String Stud_Birthdate,
            String Stud_Title,
            String Stud_Birth_Region,
            String Stud_Birth_Zone,
            String Stud_Birth_Wereda,
            String Stud_Birth_Kebele,
            String Stud_Contact_Person_Adress,
            String Stud_Contact_Person_Phone,
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
            String Stud_Police_Commision_Number,
            String STUD_TYPE,
           String dep_id,
           String program_id) throws ClassNotFoundException, SQLException {

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
                + ", DEP_ID"
                + ", PROGRAM_ID"
                + ")"
                + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

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
       ps_register.setString(26, dep_id);
       ps_register.setString(27, program_id);
        int registrationcheker = ps_register.executeUpdate();
        //  registrationcheker=res_reg.next();
        return registrationcheker;
    }

    public int StudentExperience(String STUD_ID,
            String employeer,
            String employeeAddress,
            String telephone,
            String titleofcurrentpost,
            String salary,
            String dateofemployment,
            String totalyear) throws ClassNotFoundException, SQLException {
        PreparedStatement ps_experience = dbconnection.getconnection().prepareStatement(""
                + "insert into TBL_STUD_EXPERIENCE("
                + "STUD_ID,"
                + "EMPLOYEER,"
                + "EMPLOYEER_ADDRESS,"
                + "TELEPHONE,"
                + "TITLE_OF_POST,"
                + "SALARY,"
                + "DATE_OF_EMPLOYMENT, "
                + "TOTAL_YEAR_OF_EXPERIENCE)"
                + "values(?,?,?,?,?,?,?,?)");

        ps_experience.setString(1, STUD_ID);
        ps_experience.setString(2, employeer);
        ps_experience.setString(3, employeeAddress);
        ps_experience.setString(4, telephone);
        ps_experience.setString(5, titleofcurrentpost);
        ps_experience.setString(6, salary);
        ps_experience.setString(7, dateofemployment);
        ps_experience.setString(8, totalyear);
        int experience = ps_experience.executeUpdate();
        return experience;
    }

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
            String NAME_OF_INSTITUTION,
            String PROGRAM_ATENDED,
            String STUD_ID,
            String field,
            String start_date,
            String end_date,
            String cgpa)
            throws ClassNotFoundException, SQLException {

        PreparedStatement ps_register = dbconnection.getconnection().prepareStatement("Insert into "
                + "TBL_PSEI(NAME_OF_INSTITUTION,PROGRAM_ATENDEd,STUD_ID,PSEI_FIELD,START_DATE,END_DATE,cgpa)"
                + "VALUES(?,?,?,?,?,?,?)");

        ps_register.setString(1, NAME_OF_INSTITUTION);
        ps_register.setString(2, PROGRAM_ATENDED);
        ps_register.setString(3, STUD_ID);
        ps_register.setString(4, field);
        ps_register.setString(5, start_date);
        ps_register.setString(6, end_date);
        ps_register.setString(7, cgpa);
        int registrationcheker = ps_register.executeUpdate();

        //  registrationcheker=res_reg.next();
        return registrationcheker;
    }

    public int STUD_ESLCE(String STUD_ID, String GRADE, String subject, String GRADE_OBTAINED, String YEAR_TAKEN)
            throws ClassNotFoundException, SQLException {

        PreparedStatement ps_register = dbconnection.getconnection().prepareStatement("Insert into TBL_ESLCE("
                + "  STUD_ID"
                + ", EXAM"
                + ", SUBJECT"
                + ", GRADE_OBTAINED"
                + ", YEAR_TAKEN"
                + ")"
                + "VALUES(?,?,?,?,?)");
        ps_register.setString(1, STUD_ID);
        ps_register.setString(2, GRADE);
        ps_register.setString(3, subject);
        ps_register.setString(4, GRADE_OBTAINED);
        ps_register.setString(5, YEAR_TAKEN);

        int registrationcheker = ps_register.executeUpdate();
        //  registrationcheker=res_reg.next();
        return registrationcheker;

    }

    public int EditStudentInfo(String studentID) {
        return 0;
    }

    public int createAccount(String username, String Password, String studid, String status, Date date_created) throws ClassNotFoundException, SQLException {
        PreparedStatement create_user;
        create_user = dbconnection.getconnection().prepareStatement(""
                + " insert into STUD_ACCOUNT"
                + "(USERNAME,PASSWORD,STUD_ID,CURRENT_STATUS,DATE_CREATED)"
                + "values(?,?,?,?,?)");
        create_user.setString(1, username);
        create_user.setString(2, Password);
        create_user.setString(3, studid);
        create_user.setString(4, status);
        create_user.setDate(5, date_created);
        int account_is_created = create_user.executeUpdate();
        return account_is_created;
    }

    public int withdrawStudent(String studentID) {
        return 0;
    }

    public int readmit(String studentID) {
        return 0;
    }
 public int updateherby(String herby,String studentID) {
     int action = 0;
        try {
                  

            PreparedStatement ps_herby=dbconnection.getconnection().prepareStatement("update TBL_STUDENT_PROFILE Set herby=? where stud_id=?");
               ps_herby.setString(1, herby);
               ps_herby.setString(2,studentID);
        action=ps_herby.executeUpdate();
         
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(StudentManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return action;
    }
    public int savestudprogram(String studentID, String program, String department) throws ClassNotFoundException, SQLException {

        PreparedStatement ps_savedepartment = dbconnection.getconnection().prepareStatement("insert into TBL_STUD_DEP(Stud_id,Dep_id,Program_id) values(?,?,?) ");
        ps_savedepartment.setString(1, studentID);
        ps_savedepartment.setString(2, program);
        ps_savedepartment.setString(3, department);
        int checkup = ps_savedepartment.executeUpdate();
        return checkup;
    }

    public int SaveEducationalBackground(String grade, String school, String startdate, String enddate, String Studid) throws ClassNotFoundException {
        int saved = 0;
        try {
            PreparedStatement ps_edubg = dbconnection.getconnection().prepareStatement("insert into TBL_EDUCATIONAL_BACKGROUND(GRADE,SCHOOL,START_DATE, END_DATE,STUD_ID)"
                    + " values(?,?,?,?,?)");
            ps_edubg.setString(1, grade);
            ps_edubg.setString(2, school);
            ps_edubg.setString(3, startdate);
            ps_edubg.setString(4, enddate);
            ps_edubg.setString(5, Studid);
            saved = ps_edubg.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saved;
    }
    /// upload photo start
    
     public int uploadPhoto(String studid, Part inputStream) throws ClassNotFoundException, IOException {
        int saved = 0;
        try {
             String sql = "insert INTO TBL_PICTURES (STUD_ID,photo) values (?,?)";
            PreparedStatement ps_photo = dbconnection.getconnection().prepareStatement(sql);
                 
            ps_photo.setString(1, studid);
            ps_photo.setBinaryStream(2, inputStream.getInputStream(),(int) inputStream.getSize());
       
            saved = ps_photo.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saved;
    }
    //upload photo end
    
    
    public String getSudentprofile(String studentid) throws ClassNotFoundException
    {
        String profileexists=null;
        List profile=null;
        try {
            Statement st_profile=dbconnection.getconnection().createStatement();
            ResultSet rs_profile=st_profile.executeQuery("select * from TBL_STUDENT_profile where stud_id='"+studentid+"'");
            if(rs_profile.next())
            {
               profile.add(rs_profile.getString(1));
               //profileexists=rs_profile.getString(1);
            }
            
           return  profileexists;
             
        } catch (SQLException ex) {
            Logger.getLogger(StudentManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return profileexists;
    }

}
