/**
 * 
 * Document            : checking if username and password entries are valid
 * Date Created        : April 5, 2018
 * Author              : Zoe Gray
 */

package personalCal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

    public static boolean validate(LoginBean bean) {
        Connection conn = null;
        String dbName = "PersonalManagementDB";
        String connectURL = "jdbc:mysql://localhost:3306/" + dbName;
        boolean status = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectURL, "root", "mysql1");
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT * FROM users WHERE userName=? and password=?");

            ps.setString(1, bean.getUsername());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();
            System.out.println("Status is " + status);
            conn.close();
        } catch (Exception e) {
            System.out.println("FAILED");
        }
        return status;
    }
}
