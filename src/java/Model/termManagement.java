/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author luv2codeit
 */
public class termManagement {

    connectionManager dbcon = new connectionManager();
    Connection connection;

    public termManagement() throws ClassNotFoundException, SQLException {
        this.connection = dbcon.getconnection();
    }

    public String getAtiveTerm(String year) throws SQLException {
        String activeterm = null;
        PreparedStatement ps_term = connection.prepareStatement("select * from LU_TERM where term_status='Active' and acadamic_year=?");

        ps_term.setString(1, year);
        ResultSet rs_term = ps_term.executeQuery();
        if (rs_term.next()) {
            activeterm = rs_term.getString("term_name");
        }

        return activeterm;
    }

    public boolean applyterm(String Studid, java.sql.Date admission_date, String term, String year) throws SQLException {
        PreparedStatement ps_apply = connection.prepareStatement("insert into TBL_admission(STUD_ID,term,Date_of_admission,ACADAMIC_YEAR) values(?,?,?,?)");
        ps_apply.setString(1, Studid);
        ps_apply.setString(2, term);
        ps_apply.setDate(3, (Date) admission_date);
        ps_apply.setString(4, year);
        boolean isdatainserted = ps_apply.execute();
        return isdatainserted;
        
    }

}
