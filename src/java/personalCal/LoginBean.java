/**
 * Document            : stores login session to access when user is logged in
 * to access data
 * Date Created        : April 5, 2018
 * Author              : Zoe Gray
 */

package personalCal;

/**
 *
 * @author zoegray1
 */
public class LoginBean {

    private String username, password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
