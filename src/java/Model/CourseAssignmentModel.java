/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author user
 */

public class CourseAssignmentModel {
    connectionManager connmngr=new connectionManager();
    public int courseAssignment(String instid,String courseid,String dateassigned,String round,String totalH,String durationFrom,String  durationTo) throws ClassNotFoundException, SQLException{
       
  
        int action=0;
       
            PreparedStatement ps_register=connmngr.getconnection().prepareStatement("INSERT INTO TBL_COURSEASSIGNMENT(ACADEMIC_STAFF_ID,COURSE_CODE, ASSIGN_DATE,ROUND, " +
"TOTAL_HOUR,DURATION_FROM, DURATION_TO,COURSEASSIGNMENT_SEQNO) VALUES(?,?,?,?,?,?,?,SEQNO_COURSEASSIGNMENT.nextval)");
            
             ps_register.setString(1, instid);
            ps_register.setString(2, courseid); 
//            ps_register.setString(3, selectinstr);
//               ps_register.setString(4, course);
              ps_register.setString(3, dateassigned);
              ps_register.setString(4, round);
              ps_register.setString(5, totalH);
               ps_register.setString(6, durationFrom);
                ps_register.setString(7, durationTo);
                action=ps_register.executeUpdate();
          
              return action;
        }
    //update course assignment
      public int CourseAssign_Update(String instnameupdate,String crsnameupdate, String dateassignedupdate,
        String roundupdate,String totalHupdate,String durationFromupdate,String durationToupdate,String crsseqno) throws SQLException, ClassNotFoundException
{
    int regclc=0;
    Statement _stmt=connmngr.getconnection().createStatement();
//      PreparedStatement pr_stmt=connmngr.getconnection().prepareStatement("UPDATE  TBL_COURSEASSIGNMENT set ( " +
//"     ACADEMIC_STAFF_ID,COURSE_CODE,INSTRUCTOR_NAME ,COURSE_NAME, ASSIGNED_DATE," +
//"    ROUND , TOTAL_HOUR ,DURATION_FROM,DURATION_TO) VALUES(?,?,?,?,?,?,?) WHERE COURSEASSIGNMENT_SEQNO ='"+crsseqno+"' ");
   
     regclc=_stmt.executeUpdate("UPDATE  TBL_COURSEASSIGNMENT set  ACADEMIC_STAFF_ID='"+instnameupdate+"' ,"
            + " COURSE_CODE='"+crsnameupdate+"' , ASSIGN_DATE='"+dateassignedupdate+"' ,ROUND='"+roundupdate+"' ,TOTAL_HOUR='"+totalHupdate+"', DURATION_FROM='"+durationToupdate+"', DURATION_TO='"+durationToupdate+"'  WHERE COURSEASSIGNMENT_SEQNO ='"+crsseqno+"' " );
//
//    pr_stmt.setString(1, instnameupdate);
//    pr_stmt.setString(2, crsnameupdate);
//    pr_stmt.setString(3, dateassignedupdate);
//    pr_stmt.setString(4, roundupdate);
//    pr_stmt.setString(5, totalHupdate);
//    pr_stmt.setString(6, durationFromupdate); 
//    pr_stmt.setString(7, durationToupdate); 
//    pr_stmt.setString(8, crsseqno); 
//    regclc=_stmt.executeUpdate("UPDATE  TBL_CLASS_ASSIGN set ACADEMIC_STAFF_ID='"+acdstaffID+"' ,COURSE_CODE='"+courseID+"', CLASS_ID='"+classID+"' ,"
//            + " ASSIGN_DATE='"+assigndate+"' , TIME_FROM='"+timeFrom+"' ,TIME_TO='"+timeTo+"'  WHERE CLASSASSIGN_ID ='"+classassignID+"' " );
    return regclc;
}
      
      public int courseassign(String acdstaffid,String crsname,String dateassigned,String round,String totalH,String durationFrom,String durationTo) throws ClassNotFoundException, SQLException
//      public int courseassign(String crsname) throws ClassNotFoundException, SQLException

      {
//          Statement _stmt=connmngr.getconnection().createStatement();
//           String crsname[]=request.getParameterValues("crsname");
              
//          int j=0;
//   for(int i=0;i<crsname.length;i++){    
  
        int action=0;
       
            PreparedStatement ps_register=connmngr.getconnection().prepareStatement("INSERT INTO TBL_COURSEASSIGNMENT values(?,?,?,?,?,?,?,SEQNO_COURSEASSIGNMENT.nextval)");
//             PreparedStatement ps_register=connmngr.getconnection().prepareStatement("INSERT INTO TBL_COURSEASSIGNMENT values(?,COURSEASSIGNMENT_SEQNO.nextval)");
            
//             ps_register.setString(1, crsname);
             ps_register.setString(1, acdstaffid);
            ps_register.setString(2, crsname); 
            ps_register.setString(3, dateassigned);
               ps_register.setString(4, round);
              ps_register.setString(5, totalH);
              ps_register.setString(6, durationFrom);
                ps_register.setString(7, durationTo);
 
                action=ps_register.executeUpdate();
          
              return action;
//            }
//        return 0;
       }
}
