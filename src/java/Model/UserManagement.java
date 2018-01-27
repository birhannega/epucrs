/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;
import dbconnection.connectionManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class UserManagement {

    connectionManager dbconnection = new connectionManager();
    Connection connection;
    int result = 0;

    public UserManagement() throws ClassNotFoundException, SQLException {
        this.connection = dbconnection.getconnection();
    }

    public int authenticateuser(String username, String password, String status) throws SQLException {

        PreparedStatement ps_login_check = connection.prepareStatement("select * from TBL_USERs where USER_ID=? and PASSWORD=? and CURRENT_STATUS=?");
        ps_login_check.setString(1, username);
        ps_login_check.setString(2, password);
        ps_login_check.setString(3, status);
        result = ps_login_check.executeUpdate();

        return result;
    }

    public int studentlogin(String username, String password, String status) throws SQLException {

        PreparedStatement ps_login_check = connection.prepareStatement("select * from STUD_ACCOUNT where USERNAME=? and PASSWORD=? and CURRENT_STATUS=?");
        ps_login_check.setString(1, username);
        ps_login_check.setString(2, password);
        ps_login_check.setString(3, status);
        result = ps_login_check.executeUpdate();

        return result;
    }

    public String getstudentUserID(String user) throws SQLException {
        String usernid = null;
        PreparedStatement ps_id = connection.prepareStatement("select Stud_id from Stud_account where username=?");
        try {
            ps_id.setString(1, user);
            ResultSet rs_stud_id = ps_id.executeQuery();
            if (rs_stud_id.next()) {
                usernid = rs_stud_id.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usernid;
    }

    public int countAccountsByID(String userid) throws SQLException {
        int count = 0;
        String accounts;
        PreparedStatement ps_check = connection.prepareStatement("Select count(academic_staff_id) from TBL_Users where academic_staff_id=?");
        ps_check.setString(1, userid);
        ResultSet rs_count = ps_check.executeQuery();
        if (rs_count.next()) {
            accounts = rs_count.getString(1);
            count = Integer.valueOf(accounts);
        } else {
            count = 0;
        }
        return count;
    }

    public int AddNewUser(String Userid, String roleid, String password, String currentstatus, Date date_opend, Date Date_closed, String academic_staff_id) throws SQLException {
       int usercretead=0;
        String addusersql = "insert into tbl_users(user_id,Role_id,Password,current_status,Date_opened,Date_closed,academic_staff_id) values(?,?,?,?,?,?,?)";
        PreparedStatement ps_addUser = connection.prepareStatement(addusersql);
        ps_addUser.setString(1, Userid);
        ps_addUser.setString(2, roleid);
        ps_addUser.setString(3, password);
        ps_addUser.setString(4, currentstatus);
        ps_addUser.setDate(5, date_opend);
        ps_addUser.setDate(6, Date_closed);
        ps_addUser.setString(7, academic_staff_id);
         usercretead = ps_addUser.executeUpdate();
         return usercretead;
    }
    public boolean BanUser(String username) throws SQLException
    {
        boolean banstatus=false;
        String banquery="update tbl_users set current_status='banned' where User_id=? ";
        PreparedStatement ps_ban=connection.prepareStatement(banquery);
        ps_ban.setString(1, username);
        ResultSet rs_ban=ps_ban.executeQuery();
        banstatus=rs_ban.next();
        return banstatus;
    }
      public boolean checkUserName(String username) throws SQLException
    {
        boolean checkname=false;
        String checkuery="select user_id from tbl_users where user_id=? ";
        PreparedStatement ps_check=connection.prepareStatement(checkuery);
        ps_check.setString(1, username);
        ResultSet rs_ban=ps_check.executeQuery();
        checkname=rs_ban.next();
        return checkname;
    }
        public boolean checkIfRoleIsGranted(String username,String role) throws SQLException
    {
        boolean checkrole=false;
        String checkuery="select * from tbl_users where user_id=? and role_id=? ";
        PreparedStatement ps_check=connection.prepareStatement(checkuery);
        ps_check.setString(1, username);
        ps_check.setString(2, role);
        ResultSet rs_chek=ps_check.executeQuery();
        if(rs_chek.next())
        {
            checkrole=true;
        }
        return checkrole;
    }

}
