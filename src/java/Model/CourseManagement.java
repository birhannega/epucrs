/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author user
 */
public class CourseManagement {
    connectionManager connection=new connectionManager();
    public int registerCourse(String course_code,String department,String program,String term,String name, int year,String creditHr,String prerequest,String coursetype,String date,String courseapproach) throws SQLException, ClassNotFoundException
    {
        int action=0;
       
            PreparedStatement ps_register=connection.getconnection().prepareStatement("INSERT INTO TBL_COURSE_REGISTRATION (COURSE_CODE,DEPARTMENT,PROGRAM,TERM, COURSE_NAME, ADDED_DATE,CREDIT_HOURS, PRE_REQUEST,COURSE_TYPE,ACADEMIC_YEAR,COURSE_APPROACH,COURSE_SEQNO) VALUES(?,?,?,?,?,?,?,?,?,?,?,SEQ_COURSE_REGISTRATION.NEXTVAL)");
              ps_register.setString(1, course_code);
               ps_register.setString(2, department);
              ps_register.setString(3, program);
               ps_register.setString(4, term);
              ps_register.setString(5, name);
              ps_register.setInt(6, year);
              ps_register.setString(7, creditHr);
               ps_register.setString(8, prerequest);
               ps_register.setString(9, coursetype);
               ps_register.setString(10, date);
               ps_register.setString(11, courseapproach);
             action=ps_register.executeUpdate();
          
              return action;
     
    }
    

    public int AddPrerequest(String course_code,String prerequestname) throws SQLException, ClassNotFoundException
    {
        int action=0;
       
            PreparedStatement ps_register=connection.getconnection().prepareStatement("INSERT INTO TBL_PREREQUEST (COURSE_CODE,PRE_REQUEST_NAME,SEQNO_PREREQUEST) VALUES(?,?,SEQ_PREREQUEST.NEXTVAL)");
              ps_register.setString(1, course_code);
               ps_register.setString(2, prerequestname);
//              ps_register.setString(3, program);
          
             action=ps_register.executeUpdate();
          
              return action;
     
    }
    public int AddCreditHour(String creditcrscode,String thrycredithour,String prctcredithour) throws SQLException, ClassNotFoundException
    {
        int action=0;
       
            PreparedStatement ps_register=connection.getconnection().prepareStatement("INSERT INTO TBL_CREDIT (COURSE_CODE,THEORY_CREDIT,PRACTICE_CREDIT,SEQNO_CREDITHOUR) VALUES(?,?,?,SEQ_CREDITHOUR.NEXTVAL)");
              ps_register.setString(1, creditcrscode);
               ps_register.setString(2, thrycredithour);
              ps_register.setString(3, prctcredithour);
          
             action=ps_register.executeUpdate();
          
              return action;
     
    }
     public int updatePrerequest(String edit_precoursecode, String edited_prerequestname,String edit_PRECOURSE_SEQNO) throws SQLException, ClassNotFoundException {
        int action = 0;

        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
        //Statement st_update = con.createStatement();

//        PreparedStatement ps_edit =con.prepareStatement("UPDATE TBL_COURSE_REGISTRATION SET DEPARTMENT='?', PROGRAM='?' ,TERM= '?' ,COURSE_NAME='?', ADDED_DATE='?' "
//                + " ,CREDIT_HOURS='?',PRE_REQUEST='?' WHERE  COURSE_CODE='"+course_code+"'");
        PreparedStatement ps_edit = con.prepareStatement("UPDATE TBL_PREREQUEST SET COURSE_CODE=? "
                + " ,PRE_REQUEST_NAME=?  WHERE  SEQNO_PREREQUEST='" + edit_PRECOURSE_SEQNO + "'");
        ps_edit.setString(1, edit_precoursecode);
        ps_edit.setString(2, edited_prerequestname);
//        ps_edit.setString(3, edit_PRECOURSE_SEQNO);
  
        action = ps_edit.executeUpdate();
        return action;

    }
     public int updateCreditHour(String edit_creditcrscode, String edit_credittheory,String edit_creditpractice,String edit_crdt_SEQNO) throws SQLException, ClassNotFoundException {
        int action = 0;
        
        connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
             PreparedStatement ps_edit = con.prepareStatement("UPDATE TBL_CREDIT SET COURSE_CODE=? "
                + " ,THEORY_CREDIT=? ,PRACTICE_CREDIT=? WHERE  SEQNO_CREDITHOUR='" + edit_crdt_SEQNO + "'");
        ps_edit.setString(1, edit_creditcrscode );
        ps_edit.setString(2, edit_credittheory);
        ps_edit.setString(3, edit_creditpractice);
//         ps_edit.setString(4, edit_crdt_SEQNO);
  
        action = ps_edit.executeUpdate();
        return action;

    }

}