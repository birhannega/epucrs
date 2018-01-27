/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class CourseManagement {

    connectionManager connection = new connectionManager();

    public int registerCourse(String id, String department, String program,  String name, String date, String creditHr, String prerequest, String coursetype) throws SQLException, ClassNotFoundException {
        int action = 0;

        PreparedStatement ps_register = connection.getconnection().prepareStatement("INSERT INTO TBL_COURSE_REGISTRATION (COURSE_CODE,Dep_id,PROGRAM_id, COURSE_NAME, ADDED_DATE,CREDIT_HOURS, PRE_REQUEST,COURSE_TYPE) VALUES(?,?,?,?,?,?,?,?)");
        ps_register.setString(1, id);
        ps_register.setString(2, department);
        ps_register.setString(3, program);
     
        ps_register.setString(4, name);
        ps_register.setString(5, date);
        ps_register.setString(6, creditHr);
        ps_register.setString(7, prerequest);
        ps_register.setString(8, coursetype);

        action = ps_register.executeUpdate();

        return action;

    }

    public int coursebreakdown(String department, String program, String course, String term) throws ClassNotFoundException, ClassNotFoundException, SQLException {
        int breakdown = 0;
        PreparedStatement ps_course_breakdown;
        ps_course_breakdown = connection.getconnection().prepareStatement("insert into TBL_COURSE_BREAKDOWN(DEP_ID,PROGRAM_ID,COURSE_ID,TERM_ID) values(?,?,?,?)");

        //
        ps_course_breakdown.setString(1, department);
        ps_course_breakdown.setString(2, program);
        ps_course_breakdown.setString(3, course);
        ps_course_breakdown.setString(4, term);

        breakdown = ps_course_breakdown.executeUpdate();
        return breakdown;
    }

    public int AddPrerequest(String course_code, String prerequestname) throws SQLException, ClassNotFoundException {
        int action = 0;

        PreparedStatement ps_register = connection.getconnection().prepareStatement("INSERT INTO TBL_PREREQUEST (COURSE_CODE,PRE_REQUEST_NAME,SEQNO_PREREQUEST) VALUES(?,?,SEQ_PREREQUEST.NEXTVAL)");
        ps_register.setString(1, course_code);
        ps_register.setString(2, prerequestname);
//              ps_register.setString(3, program);

        action = ps_register.executeUpdate();

        return action;

    }

    public int updateCreditHour(String edit_creditcrscode, String edit_credittheory, String edit_creditpractice, String edit_crdt_SEQNO) throws SQLException, ClassNotFoundException {
        int action = 0;

        connectionManager cm = new connectionManager();

        PreparedStatement ps_edit = connection.getconnection().prepareStatement("UPDATE TBL_CREDIT SET COURSE_CODE=? "
                + " ,THEORY_CREDIT=? ,PRACTICE_CREDIT=? WHERE  SEQNO_CREDITHOUR='" + edit_crdt_SEQNO + "'");
        ps_edit.setString(1, edit_creditcrscode);
        ps_edit.setString(2, edit_credittheory);
        ps_edit.setString(3, edit_creditpractice);
//         ps_edit.setString(4, edit_crdt_SEQNO);

        action = ps_edit.executeUpdate();
        return action;

    }

    public int AddCreditHour(String creditcrscode, String thrycredithour, String prctcredithour) throws SQLException, ClassNotFoundException {
        int action = 0;

        PreparedStatement ps_register = connection.getconnection().prepareStatement("INSERT INTO TBL_CREDIT (COURSE_CODE,THEORY_CREDIT,PRACTICE_CREDIT,SEQNO_CREDITHOUR) VALUES(?,?,?,SEQ_CREDITHOUR.NEXTVAL)");
        ps_register.setString(1, creditcrscode);
        ps_register.setString(2, thrycredithour);
        ps_register.setString(3, prctcredithour);

        action = ps_register.executeUpdate();

        return action;

    }

    public int updatePrerequest(String edit_precoursecode, String edited_prerequestname, String edit_PRECOURSE_SEQNO) throws SQLException, ClassNotFoundException {
        int action = 0;
        //Statement st_update = con.createStatement();

//        PreparedStatement ps_edit =con.prepareStatement("UPDATE TBL_COURSE_REGISTRATION SET DEPARTMENT='?', PROGRAM='?' ,TERM= '?' ,COURSE_NAME='?', ADDED_DATE='?' "
//                + " ,CREDIT_HOURS='?',PRE_REQUEST='?' WHERE  COURSE_CODE='"+course_code+"'");
        PreparedStatement ps_edit = connection.getconnection().prepareStatement("UPDATE TBL_PREREQUEST SET COURSE_CODE=? "
                + " ,PRE_REQUEST_NAME=?  WHERE  SEQNO_PREREQUEST='" + edit_PRECOURSE_SEQNO + "'");
        ps_edit.setString(1, edit_precoursecode);
        ps_edit.setString(2, edited_prerequestname);
//        ps_edit.setString(3, edit_PRECOURSE_SEQNO);

        action = ps_edit.executeUpdate();
        return action;

    }

    public String getcoursname(String id) throws SQLException, ClassNotFoundException {
        String name = null;
        PreparedStatement ps_name = connection.getconnection().prepareStatement("select COURSE_NAME from TBL_COURSE_REGISTRATION where course_code=?");
        ps_name.setString(1, id);
        ResultSet rs_name = ps_name.executeQuery();
        if (rs_name.next()) {
            name = rs_name.getString(1);
        } else {
            name = "undefined course name";
        }
        return name;

    }
        public String getcourcredit(String id) throws SQLException, ClassNotFoundException {
        String name = null;
        PreparedStatement ps_name = connection.getconnection().prepareStatement("select CREDIT_HOURS from TBL_COURSE_REGISTRATION where course_code=?");
        ps_name.setString(1, id);
        ResultSet rs_name = ps_name.executeQuery();
        if (rs_name.next()) {
            name = rs_name.getString(1);
        } else {
            name = "undefined course name";
        }
        return name;

    }
}
