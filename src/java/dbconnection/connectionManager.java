/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;
import java.sql.*;
/**
 *
 * @author user
 */
public class connectionManager{
    String host="localhost";   //hostname
    String user="epucrs"; //user
    String password="epucrs"; //user password
    String url="epucrs@//localhost:1521/epucrs"; // url of db connection
    
    //creating connection
     public Connection getconnection() throws ClassNotFoundException, SQLException {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:epucrs";
            String db_uname = "epucrs";
            String db_pwd = "epucrs";
            Connection conn =DriverManager.getConnection(url, db_uname, db_pwd);
            return conn;


}
     
}
