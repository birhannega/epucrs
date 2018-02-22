package Model;
import dbconnection.connectionManager;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sun.misc.BASE64Encoder;

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

    public String getfatherFullName(String studentID) throws SQLException {
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

    public String getmotherFullNeme(String studentID) throws SQLException {
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
            data = familyinfo.getString("Grade") + ", " + familyinfo.getString("School") + ", " + familyinfo.getString("START_DATE") + "-" + familyinfo.getString("END_DATE");
        }
        return data;
    }

    public String getDepartment(String studentID) throws SQLException {
        String department = null;
        PreparedStatement ps_depid = connection.prepareStatement("select dep_id from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_depid.setString(1, studentID);
        ResultSet depid = ps_depid.executeQuery();
        if (depid.next()) {
            String dep_id = depid.getString(1);
            PreparedStatement ps_depname = connection.prepareStatement("select DEP_NAME from TBL_DEPARTMENT where dep_id=?");
            ps_depname.setString(1, dep_id);
            ResultSet depname = ps_depname.executeQuery();
            if (depname.next()) {
                department = depname.getString(1);
            }
        }

        return department;
    }
    //Get program studied by students
    public String getProgram(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_depid = connection.prepareStatement("select program_id from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_depid.setString(1, studentID);
        ResultSet depid = ps_depid.executeQuery();
        if (depid.next()) {
            String dep_id = depid.getString(1);
            PreparedStatement ps_depname = connection.prepareStatement("select program_name from TBL_academic_program where program_id=?");
            ps_depname.setString(1, dep_id);
            ResultSet depname = ps_depname.executeQuery();
            if (depname.next()) {
                data = depname.getString(1);
            }

        }
        return data;
    }
    
    //get program ID of student so you can simply find its name
    public String getProgramID(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_proid = connection.prepareStatement("select program_id from TBL_STUDENT_PROFILE where Stud_id=?");
        ps_proid.setString(1, studentID);
        ResultSet proid = ps_proid.executeQuery();
        if (proid.next()) {
            data = proid.getString(1);
        }
        return data;
    }
    //Getfather's job
    public String getfatherJOb(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_mother_job = connection.prepareStatement("select FATHER_OCCUPATION from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_mother_job.setString(1, studentID);
        ResultSet motherJob = ps_mother_job.executeQuery();
        if (motherJob.next()) {
            data = motherJob.getString(1);
        }
        return data;
    }
    //get mothers job

    public String getMotherJOb(String studentID) throws SQLException {
        String data = null;
        PreparedStatement ps_father_job = connection.prepareStatement("select MOTHER_OCCUPATION from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_father_job.setString(1, studentID);
        ResultSet fatherJob = ps_father_job.executeQuery();
        if (fatherJob.next()) {
            data = fatherJob.getString(1);
        }
        return data;
    }
    //Get Mother address

    public String getMotherAddress(String studentID) throws SQLException {
        String motheraddress = null;
        PreparedStatement ps_father_add = connection.prepareStatement("select * from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_father_add.setString(1, studentID);
        ResultSet fatherAddress = ps_father_add.executeQuery();
        if (fatherAddress.next()) {
            motheraddress = fatherAddress.getString("MOTHER_REGIONAL_ADDRESS") + " region  "
                    + fatherAddress.getString("MOTHER_ZONAL_ADDRESS") + "  Zone:  "
                    + fatherAddress.getString("MOTHER_WOREDA_ADDRESS") + " wereda:  "
                    + fatherAddress.getString("MOTHER_KEBELE_ADDRESS") + " kebele:  "
                    + " House no.  " + fatherAddress.getString("MoTHER_HOUSE_NUM_ADDRESS");
        }
        return motheraddress;
    }
    //Get father address

    public String getfatherAddress(String studentID) throws SQLException {
        String fatheraddress = null;
        PreparedStatement ps_father_add = connection.prepareStatement("select * from TBL_FAMILY_BACKGROUND where Stud_id=?");
        ps_father_add.setString(1, studentID);
        ResultSet fatherAddress = ps_father_add.executeQuery();
        if (fatherAddress.next()) {
            fatheraddress = fatherAddress.getString("FATHER_REGIONAL_ADDRESS") + " region  "
                    + fatherAddress.getString("FATHER_ZONAL_ADDRESS") + "  Zone:  "
                    + fatherAddress.getString("FATHER_WOREDA_ADDRESS") + " wereda:  "
                    + fatherAddress.getString("FATHER_KEBELE_ADDRESS") + " kebele:  "
                    + " House no.  " + fatherAddress.getString("FATHER_HOUSE_NUM_ADDRESS");
        }
        return fatheraddress;
    }
    //Get student experience
     public String GetStudentExperience(String studentID) throws SQLException {
        String experience = null;
        PreparedStatement ps_experience = connection.prepareStatement("select * from TBL_STUD_EXPERIENCE where Stud_id=?");
        ps_experience.setString(1, studentID);
        ResultSet rsexperience = ps_experience.executeQuery();
        if (rsexperience.next()) {
            experience ="<p> Employeer  "
                    + rsexperience.getString("EMPLOYEER")
                    +"</p>"
                    + "<p>Employe Address:  "
                    + rsexperience.getString("EMPLOYEER_ADDRESS")+
                    "</p><p>Date of Employment:"
                    + rsexperience.getString("DATE_OF_EMPLOYMENT") 
                    + " </p> <p> total year of Experience: "
                    + rsexperience.getString("TOTAL_YEAR_OF_EXPERIENCE") 
                    + " </p> <p >  "
                    + " TEl: " + rsexperience.getString("TELEPHONE");
        }
        return experience;
    }
                     // Get post Graduate data (if any)
         public String GetPSeiInfo(String studentID) throws SQLException {
        String experience = null;
        PreparedStatement ps_experience = connection.prepareStatement("select * from TBL_PSEI where Stud_id=?");
        ps_experience.setString(1, studentID);
        ResultSet rsexperience = ps_experience.executeQuery();
        if (rsexperience.next()) {
            experience =
                    "<tr>"
                    + "<td>"
                    + "1"
                    + "</td>"
                    + "<td>"
                    + rsexperience.getString("NAME_OF_INSTITUTION")+
                    "</td>"
                    + "<td>"+
                    rsexperience.getString("PROGRAM_ATENDED")+""
                    + "</td>"
                    + "<td>"
                    + rsexperience.getString("PSEI_FIELD") 
                    + " </td>"
                    + " <td>"
                    + rsexperience.getString("START_DATE") 
                    + " </td>"
                    + " <td >"
                    + rsexperience.getString("END_DATE") 
                    + " </td>"
                    + "<td >"
                    + rsexperience.getString("CGPA")
                    +"</td>"
                    + "</tr>";
        }
        return experience;
    }
         public Blob getProfilePic(String Studid) throws SQLException{
          Blob imagedata=null;
              String photosql = "select PHOTO from TBL_PICTURES where Stud_id='"+Studid+"'";
             PreparedStatement ps_pc = connection.prepareStatement(photosql);
             //ps_pc.setString(1, Studid);
           ResultSet rs_pic=ps_pc.executeQuery();
           if(rs_pic.next())
           {
                 imagedata=rs_pic.getBlob(1);
           }
         return imagedata;
         }
         public ResultSet getinfo(String studid) throws SQLException
         {
              String edusql = "select * from TBL_EDUCATIONAL_BACKGROUND where Stud_id='"+studid+"' order by Grade";
             PreparedStatement psedu = connection.prepareStatement(edusql);
             ResultSet rs=psedu.executeQuery();
             return rs;
         }
}
