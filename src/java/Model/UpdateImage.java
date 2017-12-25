/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dbconnection.connectionManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.Part;
import javax.servlet.http.Part;
import javax.websocket.Encoder.BinaryStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author user
 */
public class UpdateImage {
     connectionManager connection=new connectionManager();

    public int UpdateImageProfile(String displayimageid,Part Imageupdate) throws SQLException, ClassNotFoundException, IOException
    {
        int action=0;
       
          connectionManager cm = new connectionManager();
        Connection con = cm.getconnection();
      
  PreparedStatement ps_edit =con.prepareStatement("UPDATE TBL_ACADEMIC_STAFF_REG SET IMAGE=?  WHERE  ACADEMIC_STAFF_ID=?");
// PreparedStatement ps_edit =con.prepareStatement("Insert into TBL_ACADEMIC_STAFF_REG( ACADEMIC_STAFF_ID ,IMAGE)  values(?,?)");
               ps_edit.setString(1, displayimageid);
                ps_edit.setBinaryStream(2, Imageupdate.getInputStream(),(int) Imageupdate.getSize());
//                ps_edit.setBinaryStream(2, Imageupdate.getInputStream(),(int) Imageupdate.getSize());
//               ps_edit.setString(2, Imageupdate);
      

             action=ps_edit.executeUpdate();
              return action;
     
    }
    
}
