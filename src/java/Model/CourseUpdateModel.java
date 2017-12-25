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

    public int updateCourse(String course_code, String department, String program, String term, String name, String added_date, String creditHr, String prerequest, String edit_coursetype, String edit_academicyear, String edit_courseapproach,String edit_COURSE_SEQNO) throws SQLException, ClassNotFoundException {
        int action = 0;

        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
        //Statement st_update = con.createStatement();

//        PreparedStatement ps_edit =con.prepareStatement("UPDATE TBL_COURSE_REGISTRATION SET DEPARTMENT='?', PROGRAM='?' ,TERM= '?' ,COURSE_NAME='?', ADDED_DATE='?' "
//                + " ,CREDIT_HOURS='?',PRE_REQUEST='?' WHERE  COURSE_CODE='"+course_code+"'");
        PreparedStatement ps_edit = con.prepareStatement("UPDATE TBL_COURSE_REGISTRATION SET COURSE_CODE=?,DEPARTMENT=?, PROGRAM=? ,TERM= ? ,COURSE_NAME=?, ADDED_DATE=? "
                + " ,CREDIT_HOURS=?,PRE_REQUEST=? ,COURSE_TYPE =? ,ACADEMIC_YEAR =? ,COURSE_APPROACH =?  WHERE  COURSE_SEQNO='" + edit_COURSE_SEQNO + "'");
        ps_edit.setString(1, course_code);
        ps_edit.setString(2, department);
        ps_edit.setString(3, program);
        ps_edit.setString(4, term);
        ps_edit.setString(5, name);
        ps_edit.setString(6, added_date);
        ps_edit.setString(7, creditHr);
        ps_edit.setString(8, prerequest);
        ps_edit.setString(9, edit_coursetype);
        ps_edit.setString(10, edit_academicyear);
        ps_edit.setString(11, edit_courseapproach);

        action = ps_edit.executeUpdate();
        return action;

    }

}
