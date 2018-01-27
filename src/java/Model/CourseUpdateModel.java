/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class CourseUpdateModel {

    connectionManager connection = new connectionManager();

    public int updateCourse(String course_code, String department, String program, String name, String creditHr, String prerequest, String edit_coursetype, String edit_academicyear, String edit_courseapproach,String edit_COURSE_SEQNO) throws SQLException, ClassNotFoundException {
        int action = 0;

        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
   
        PreparedStatement ps_edit = con.prepareStatement("UPDATE TBL_COURSE_REGISTRATION SET COURSE_CODE=?,DEP_ID=?, PROGRAM_ID=? ,COURSE_NAME=? "
                + " ,CREDIT_HOURS=?,PRE_REQUEST=? ,COURSE_TYPE =? ,REGISTRATION_YEAR =? ,COURSE_APPROACH =?  WHERE  COURSE_SEQNO='" + edit_COURSE_SEQNO + "'");
        ps_edit.setString(1, course_code);
        ps_edit.setString(2, department);
        ps_edit.setString(3, program);
//        ps_edit.setString(4, term);
        ps_edit.setString(4, name);
//        ps_edit.setString(6, crsofferingyear);
        ps_edit.setString(5, creditHr);
        ps_edit.setString(6, prerequest);
        ps_edit.setString(7, edit_coursetype);
        ps_edit.setString(8, edit_academicyear);
        ps_edit.setString(9, edit_courseapproach);

        action = ps_edit.executeUpdate();
        return action;

    }

}
