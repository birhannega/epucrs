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
public class Criteria_management {

    public PreparedStatement ps;
    public Connection connection;
    public ResultSet rs;
    String sql;
    connectionManager dbcon = new connectionManager();

    public Criteria_management() throws SQLException, ClassNotFoundException {
        connection = dbcon.getconnection();
        ps = connection.prepareStatement(sql);
        rs = ps.executeQuery();

    }

    public int Add_pass_fail_scale(String program, Double mingpa, Date date_inserted, String inserted_by) throws SQLException {
        int return_data = 0;
        sql = "insert into TBL_PASS_FAIL_SCALE(PROGRAM_ID,SCALE,DATE_CREATED,CREATEDBY) values(?,?,?,?)";
        ps = connection.prepareStatement(sql);
        ps.setString(1, program);
        ps.setDouble(2, mingpa);
        ps.setDate(3, date_inserted);
        ps.setString(4, inserted_by);
        return_data = ps.executeUpdate();
        return return_data;
    }

}
