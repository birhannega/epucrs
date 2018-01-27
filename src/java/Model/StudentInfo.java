/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author luv2codeit
 */
public class StudentInfo {

    connectionManager dbconnection = new connectionManager();
    Connection connection;

    public StudentInfo() throws ClassNotFoundException, SQLException {
        this.connection = dbconnection.getconnection();
    }

    public String getprofile(String studentID) throws SQLException {
        String data = null;
        int i = 0;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet info = ps_info.executeQuery();
        while (info.next()) {
            i++;
            data = info.getString(i);
        }
        return data;

    }

    public String getfatherinfo(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet familyinfo = ps_info.executeQuery();
        while (familyinfo.next()) {
            data = familyinfo.getString("FATHER_FNAME") + " " + familyinfo.getString("FATHER_MIDDLE_NAME") + " " + familyinfo.getString("FATHER_LAST_NAME");
        }
        return data;
    }
     public String getfullname(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet familyinfo = ps_info.executeQuery();
        while (familyinfo.next()) {
            data = familyinfo.getString("STUD_FIRST_NAME") + " " + familyinfo.getString("STUD_MIDDLE_NAME") + " " + familyinfo.getString("STUD_LAST_NAME");
        }
        return data;
    }

    public String getmotherinfo(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet familyinfo = ps_info.executeQuery();
        while (familyinfo.next()) {
            data = familyinfo.getString("mother_FNAME") + " " + familyinfo.getString("MOTHER_MIDDLE_NAME") + " " + familyinfo.getString("MOTHER_LAST_NAME");
        }
        return data;
    }
     public String gefatheraddress(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet familyinfo = ps_info.executeQuery();
        while (familyinfo.next()) {
            data = familyinfo.getString("FATHER_REGIONAL_ADDRESS") + ", " + familyinfo.getString("FATHER_ZONAL_ADDRESS") + "  zone, " + familyinfo.getString("FATHER_WOREDA_ADDRESS");
        }
        return data;
    }
     public String gemotheraddress(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet familyinfo = ps_info.executeQuery();
        while (familyinfo.next()) {
            data = familyinfo.getString("Mother_REGIONAL_ADDRESS") + ", " + familyinfo.getString("Mother_ZONAL_ADDRESS") + "  zone, " + familyinfo.getString("Mother_WOREDA_ADDRESS");
        }
        return data;
    }
      public String geteducationalBackground(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_info = connection.prepareStatement("select * from TBL_EDUCATIONAL_BACKGROUND where Stud_id=?");
        ps_info.setString(1, studentID);
        ResultSet familyinfo = ps_info.executeQuery();
        while (familyinfo.next()) {
            data = familyinfo.getString("Grade") + ", " + familyinfo.getString("School") + ", " + familyinfo.getString("START_DATE")+ "-"+familyinfo.getString("END_DATE");
        }
        return data;
    }
       public String getDepartment(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_depid= connection.prepareStatement("select dep_id from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_depid.setString(1, studentID);
        ResultSet depid = ps_depid.executeQuery();
        if (depid.next()) {
            String dep_id = depid.getString(1);
             PreparedStatement ps_depname= connection.prepareStatement("select DEP_NAME from TBL_DEPARTMENT where dep_id=?");
             ps_depname.setString(1, dep_id);
              ResultSet depname = ps_depname.executeQuery();
              if(depname.next())
              {
                  data=depname.getString(1);
              }
             
        }
            
        return data;
    }
           public String getProgram(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_depid= connection.prepareStatement("select program_id from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_depid.setString(1, studentID);
        ResultSet depid = ps_depid.executeQuery();
        if (depid.next()) {
            String dep_id = depid.getString(1);
             PreparedStatement ps_depname= connection.prepareStatement("select program_name from TBL_academic_program where program_id=?");
             ps_depname.setString(1, dep_id);
              ResultSet depname = ps_depname.executeQuery();
              if(depname.next())
              {
                  data=depname.getString(1);
              }
             
        }    
        return data;
    }
      public String getProgramID(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_depid= connection.prepareStatement("select program_id from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_depid.setString(1, studentID);
        ResultSet depid = ps_depid.executeQuery();
       if(depid.next())
       {
           data=depid.getString(1);
       }     
        return data;
    }
}
