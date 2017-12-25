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
import java.sql.Statement;

/**
 *
 * @author user
 */
public class ClassModel {
connectionManager connmgt=new connectionManager();
//Connection conn = connmgt.getconnection();
 
public int class_reg(String classid,String blockname,String classname, String regdate,String selectlocation) throws SQLException, ClassNotFoundException
{
    int regclc=0;
   // PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("insert into tbl_class(class_id,block_name,class_name,reg_date) values(?,?,?,?)");
    PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("INSERT INTO TBL_CLASS (CLASS_ID,BLOCK_NAME,CLASS_NAME,REG_DATE,LOCATION) VALUES(?,?,?,?,?)");
    pr_stmt.setString(1, classid);
    pr_stmt.setString(2, blockname);
    pr_stmt.setString(3, classname);
    pr_stmt.setString(4, regdate);
    pr_stmt.setString(5, selectlocation); 
    regclc=pr_stmt.executeUpdate();
    return regclc;
}
public int classAssign_reg(String instrID, String courseID,String classID,
        String assigndate,String timeFrom,String timeTo) throws SQLException, ClassNotFoundException
{
    int regclc=0;
   // PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("insert into tbl_class(class_id,block_name,class_name,reg_date) values(?,?,?,?)");
    PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("INSERT INTO TBL_CLASS_ASSIGN ( " +
"     ACADEMIC_STAFF_ID ,COURSE_CODE , CLASS_ID ," +
//"    ASSIGN_DATE , TIME_FROM ,TIME_TO,CLASSASSIGN_ID) VALUES(?,?,?,?,?,?,SEQNO_CLASSASSIGN.nxtval")");
 "    ASSIGN_DATE , TIME_FROM ,TIME_TO,CLASSASSIGN_ID) "
            + 
            " values (  "
                + "   ?,"
                + "    ?,"
                + "    ?,"
                + "    ?,"
                + "    ?,"
                + "    ?,"
                + // "    ?," +
                "SEQNO_CLASSASSIGN.nextval"
                + //no need when the modeltable not exit
                "  )");
    pr_stmt.setString(1, instrID);
    pr_stmt.setString(2, courseID);
    pr_stmt.setString(3, classID);
    pr_stmt.setString(4, assigndate);
    pr_stmt.setString(5, timeFrom);
    pr_stmt.setString(6, timeTo);
  
    regclc=pr_stmt.executeUpdate();
    return regclc;
}
 //update assign class
public int classAssign_Update(String acdstaffID,String courseID, String classID,
        String assigndate,String timeFrom,String timeTo,String classassignID) throws SQLException, ClassNotFoundException
{
    int regclc=0;
    Statement _stmt=connmgt.getconnection().createStatement();
//      PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("UPDATE  TBL_CLASS_ASSIGN set ( " +
//"     ACADEMIC_STAFF_ID ,COURSE_CODE, CLASS_ID ," +
//"    ASSIGN_DATE , TIME_FROM ,TIME_TO,CLASSASSIGN_ID) VALUES(?,?,?,?,?,?) WHERE CLASSASSIGN_ID ='"+classassignID+"' ");
//    PreparedStatement pr_stmt=connmgt.getconnection().prepareStatement("UPDATE  TBL_CLASS_ASSIGN set ACADEMIC_STAFF_ID='"+acdstaffID+"' ,COURSE_CODE='"+courseID+"', CLASS_ID='"+classID+"' ,"
//            + " ASSIGN_DATE='"+assigndate+"' , TIME_FROM='"+timeFrom+"' ,TIME_TO='"+timeTo+"'  WHERE CLASSASSIGN_ID ='"+classassignID+"' " );
////    pr_stmt.setString(1, acdstaffID);
//    pr_stmt.setString(2, courseID);
//    pr_stmt.setString(3, classID);
//    pr_stmt.setString(4, assigndate);
//    pr_stmt.setString(5, timeFrom);
//    pr_stmt.setString(6, timeTo);
//    pr_stmt.setString(7, classassignID); 
    regclc=_stmt.executeUpdate("UPDATE  TBL_CLASS_ASSIGN set ACADEMIC_STAFF_ID='"+acdstaffID+"' ,COURSE_CODE='"+courseID+"', CLASS_ID='"+classID+"' ,"
            + " ASSIGN_DATE='"+assigndate+"' , TIME_FROM='"+timeFrom+"' ,TIME_TO='"+timeTo+"'  WHERE CLASSASSIGN_ID ='"+classassignID+"' " );
    return regclc;
}
    
}
