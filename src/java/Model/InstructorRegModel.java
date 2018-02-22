/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.Part;

/**
 *
 * @author Efrem
 */
public class InstructorRegModel {

    connectionManager connection = new connectionManager();

    public int instructor_registration(String nstid, Part ImageFile, String insttitle, String firsname, String middlename, String lastname, String phoneno, String email, String department,
            String status, String insttype, String responsibility, String hireddate, String policemngmt, String description) throws SQLException, ClassNotFoundException, IOException {
        int result = 0;
        PreparedStatement prestm = connection.getconnection().prepareStatement("Insert into TBL_ACADEMIC_STAFF_REG( ACADEMIC_STAFF_ID ,IMAGE,Title , First_Name  ,"
                + " Middle_Name ,Last_Name,Phone , E_Mail ,DEP_ID ,"
                + " Status ,STAFF_TYPE ,RESPONSIBILITY,HIRED_DATE,POLICE_MANAGEMENT, DESCRIPTION) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        prestm.setString(1, nstid);
        prestm.setBinaryStream(2, ImageFile.getInputStream(), (int) ImageFile.getSize());
        prestm.setString(3, insttitle);
        prestm.setString(4, firsname);
        prestm.setString(5, middlename);
        prestm.setString(6, lastname);
        prestm.setString(7, phoneno);
        prestm.setString(8, email);
        prestm.setString(9, department);
        prestm.setString(10, status);
        prestm.setString(11, insttype);
        prestm.setString(12, responsibility);
        prestm.setString(13, hireddate);
        prestm.setString(14, policemngmt);
        prestm.setString(15, description);
        result = prestm.executeUpdate();

        return result;

    }
    //add expriance

    public int instructor_exp_reg(String staffid, String expid, String expctgry, String exptype, String orgname, String totalexp, String datefrom_exp_from, String datefrom_exp_to, String qualification) throws SQLException, ClassNotFoundException {
        int result = 0;
        PreparedStatement prestm = connection.getconnection().prepareStatement("Insert into TBL_ACADEMIC_EXPERTISE( ACADEMIC_STAFF_ID,INSTEXP_ID ,AREA_EXPERTISE ,ORG_TYPE, ORG_NAME  ,"
                + " TOTAL_EXPERTISE ,DATE_FROM,DATE_TO,QUALIFICATION,SEQNO_ACADEMIC_EXPERTIES) values(?,?,?,?,?,?,?,?,?,SEQNO_ACADEMIC_EXPERTIES.nextval)");
        prestm.setString(1, staffid);
        prestm.setString(2, expid);
        prestm.setString(3, expctgry);
        prestm.setString(4, exptype);
        prestm.setString(5, orgname);
        prestm.setString(6, totalexp);
        prestm.setString(7, datefrom_exp_from);
        prestm.setString(8, datefrom_exp_to);
        prestm.setString(9, qualification);
        result = prestm.executeUpdate();
        return result;

    }
//    update staff profile

    public int UpdateStaffReg(String acdstaffid, String insttitleupdate, String instnameupdate, String instMiddlenameupdate, String instLastnameupdate, String phonenoupdate, String emailupdate, String departmentupdate, String statusupdate, String staftype, String responsibilityupdate, String hireddateupdate, String polcemngmtupdate, String descriptionupdate) throws SQLException, ClassNotFoundException {
        int action = 0;

        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
        PreparedStatement ps_edit = con.prepareStatement("UPDATE TBL_ACADEMIC_STAFF_REG SET ACADEMIC_STAFF_ID=?,TITLE=?,FIRST_NAME=?,MIDDLE_NAME=?,LAST_NAME=?,PHONE=?,E_MAIL=?, DEPARTMENT=? ,STATUS= ? ,STAFF_TYPE=?, RESPONSIBILITY=? "
                + " ,HIRED_DATE=?,POLICE_MANAGEMENT=? ,DESCRIPTION =?  WHERE  ACADEMIC_STAFF_ID='" + acdstaffid + "'");
        ps_edit.setString(1, acdstaffid);
        ps_edit.setString(2, insttitleupdate);
        ps_edit.setString(3, instnameupdate);
        ps_edit.setString(4, instMiddlenameupdate);
        ps_edit.setString(5, instLastnameupdate);
        ps_edit.setString(6, phonenoupdate);
        ps_edit.setString(7, emailupdate);
        ps_edit.setString(8, departmentupdate);
        ps_edit.setString(9, statusupdate);
        ps_edit.setString(10, staftype);
        ps_edit.setString(11, responsibilityupdate);
        ps_edit.setString(12, hireddateupdate);
        ps_edit.setString(13, polcemngmtupdate);
        ps_edit.setString(14, descriptionupdate);
        action = ps_edit.executeUpdate();
        return action;

    }
//     insert course list

    public int course_list(String InstName, String CourseName, String CreditHour, String TotalHour) throws SQLException, ClassNotFoundException {
        int result = 0;
        PreparedStatement prestm = connection.getconnection().prepareStatement("Insert into TBL_COURSE_LIST( ACADEMIC_STAFF_ID ,COURSE_CODE ,CREDIT_HOURS,"
                + " TOTAL_HOURS) values(?,?,?,?)");

        prestm.setString(1, InstName);
        prestm.setString(2, CourseName);
        prestm.setString(3, CreditHour);
        prestm.setString(4, TotalHour);
        result = prestm.executeUpdate();

        return result;

    }
//update expriance

    public int UpdateStaffExp(String staffid, String expid, String expctgry, String exptype, String orgname, String totalexp, String datefrom_exp_from, String datefrom_exp_to, String qualification, String seqno) throws SQLException, ClassNotFoundException {
        int action = 0;

        PreparedStatement prestm = connection.getconnection().prepareStatement("UPDATE TBL_ACADEMIC_EXPERTISE set ACADEMIC_STAFF_ID=?,INSTEXP_ID=? ,AREA_EXPERTISE=? ,ORG_TYPE=?, ORG_NAME=?  ,"
                + " TOTAL_EXPERTISE=? ,DATE_FROM=?,DATE_TO=?,QUALIFICATION=?  WHERE  SEQNO_ACADEMIC_EXPERTIES='" + seqno + "'");
        prestm.setString(1, staffid);
        prestm.setString(2, expid);
        prestm.setString(3, expctgry);
        prestm.setString(4, exptype);
        prestm.setString(5, orgname);
        prestm.setString(6, totalexp);
        prestm.setString(7, datefrom_exp_from);
        prestm.setString(8, datefrom_exp_to);
        prestm.setString(9, qualification);
        action = prestm.executeUpdate();
        return action;

    }

    public boolean checkIfIDExists(String instid) throws ClassNotFoundException, SQLException {
        boolean result = false;
        PreparedStatement ps_check = connection.getconnection().prepareStatement("select ACADEMIC_STAFF_ID from TBL_ACADEMIC_STAFF_REG where ACADEMIC_STAFF_ID=?");
        ps_check.setString(1, instid);
        ResultSet rs_id = ps_check.executeQuery();
        result = rs_id.next();
        return result;
    }
}
