package Model;

import dbconnection.connectionManager;
import java.sql.*;
//import java.util.Date;

public class Events {

    connectionManager dbcon = new connectionManager();
    Connection con;
    Statement statement;
    PreparedStatement ps;
    ResultSet rs;

    public Events() throws ClassNotFoundException, SQLException {
        con = dbcon.getconnection();
        statement = con.createStatement();

    }

    public int addschedule(String title, String name, java.sql.Date startdate, java.sql.Date enddate, int scheduleid, String year) throws SQLException {
        ps = con.prepareStatement("insert into TBL_schedule(title,event_name,Start_date,end_date,schedule_id,AcademicYear) values(?,?,?,?,?,?)");
        ps.setString(1, title);
        ps.setString(2, name);
        ps.setDate(3,  startdate);
        ps.setDate(4,  enddate);
        ps.setInt(5, scheduleid);
        ps.setString(6, year);
        int event_saved = ps.executeUpdate();
        return event_saved;
    }
    public int getLastID() throws SQLException {
        int scheduleid = 0;
        rs = statement.executeQuery("Select count(SCHEDULE_ID) from tbl_schedule");
        if (rs.next()) {
            scheduleid = Integer.valueOf(rs.getString(1));
        }
        return scheduleid;
    }
    public int Editeventschedule(String edited_title, String edited_name, Date edited_start_date, Date edited_end_date, int id) throws SQLException {
        int edited_value;
        PreparedStatement ps_edit = con.prepareStatement("update tbl_schedule set title=?,event_name=?,Start_date=?,end_date=? where schedule_id=? ");
        ps_edit.setString(1, edited_title);
        ps_edit.setString(2, edited_name);
        ps_edit.setDate(3, edited_start_date);
        ps_edit.setDate(4, edited_end_date);
        ps_edit.setInt(5, id);
        edited_value = ps_edit.executeUpdate();
        return edited_value;
    }
     public String getActiveyear() throws SQLException {
        String activeyear = null;
        rs = statement.executeQuery("Select  ACADAMIC_YEAR from tbl_setup where CURRENT_STATUS='active'");
        if (rs.next()) {
            activeyear = rs.getString(1);
        }
        return activeyear;
     }
}
