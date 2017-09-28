/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import dbconnection.connectionManager;
import java.sql.Connection;
import java.sql.*;

/**
 *
 * @author user
 */
public class ClearanceModel implements Serializable {

    connectionManager conmngr = new connectionManager();

    //Connection conn=conmngr.getconnection();
    public int clerancemodel(String clrid, String fullname, String directorate, String dpstartdate, String departmentlearn, String enddate, String reason, String studid) throws SQLException, ClassNotFoundException {
        PreparedStatement ps_clear = conmngr.getconnection().prepareStatement("insert into tbl_clearance(CLEARANCE_ID,FULL_NAME , DIRECTORATE ,STARTED_DATE ,DEPARTMENT ,END_DATE ,REASON ,STUD_ID) values(?,?,?,?,?,?,?,?)");

        int clrmodel = 0;
        ps_clear.setString(1, clrid);
        ps_clear.setString(2, fullname);
        ps_clear.setString(3, directorate);
        ps_clear.setString(4, dpstartdate);
        ps_clear.setString(5, departmentlearn);
        ps_clear.setString(6, enddate);
        ps_clear.setString(7, reason);
        ps_clear.setString(8, studid);
        clrmodel = ps_clear.executeUpdate();
        return clrmodel;
    }

    //clearance approval method
    public int cleranceApproval(String clrid,String studid, String fpmname, String dateprgmgr, String pmremark, String sddname, String datesdd, String sddremark, String fdmname, String datefdm, String fdmremark, String sdmname, String datesdm, String sdmremark,
            String lmname, String datelm, String lmremark, String gsmname, String dategsm, String gsmremark, String ptname, String datepolicetct, String ptremark, String rmname, String daterm, String rmremark) throws SQLException, ClassNotFoundException {
        PreparedStatement ps_clear = conmngr.getconnection().prepareStatement("insert into TBL_CLEARANCE_APPROVALALL(CLEARANCE_ID,STUD_ID,PROGRAM_MANAGER_NAME,PROGRAM_MANAGER_DATE , PROGRAM_MANAGER_REMARK  ,STORE_DEP_NAME ,STORE_DEP_DATE,STORE_DEP_REMARK " +
",FINANCE_DIV_MNGRNAME ,FINANCE_DIV_MNGRDATE  ,FINANCE_DIV_MNGRREMARK   ,STATIONARY_DEP_MNGRNAME ,STATIONARY_DEP_MNGRDATE   " +
",STATIONARY_DEP_MNGRREMARK ,LIBRARY_MNGRNAME ,LIBRARY_MNGRDATE  ,LIBRARY_MNGRREMARK  " +
",GENARALSTOR_MNGRNAME,GENARALSTOR_MNGRDATE ,GENARALSTOR_MNGRREMARK  ,POLICE_TACTC_MNGRNAME,POLICE_TACTC_MNGRDATE " +
",POLICE_TACTC_MNGRREMARK,REGISTRAR_MNGRNAME  ,REGISTRAR_MNGRDATE  ,REGISTRAR_MNGRREMARK ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

        int clrmodel = 0;
        ps_clear.setString(1, clrid);
        ps_clear.setString(2, studid);
        ps_clear.setString(3, fpmname);
        ps_clear.setString(4, dateprgmgr);
        ps_clear.setString(5, pmremark);
        ps_clear.setString(6, sddname);
        ps_clear.setString(7, datesdd);
        ps_clear.setString(8, sddremark);
        ps_clear.setString(9, fdmname);
        ps_clear.setString(10, datefdm);
        ps_clear.setString(11, fdmremark);
        ps_clear.setString(12, sdmname);
        ps_clear.setString(13, datesdm);
        ps_clear.setString(14, sdmremark);
        ps_clear.setString(15, lmname);
        ps_clear.setString(16, datelm);
        ps_clear.setString(17, lmremark);

        ps_clear.setString(18, gsmname);
        ps_clear.setString(19, dategsm);
        ps_clear.setString(20, gsmremark);
        ps_clear.setString(21, ptname);
        ps_clear.setString(22, datepolicetct);
        ps_clear.setString(23, ptremark);
        ps_clear.setString(24, rmname);
        ps_clear.setString(25, daterm);
        ps_clear.setString(26, rmremark);
        
        clrmodel = ps_clear.executeUpdate();
        return clrmodel;
    }
}
