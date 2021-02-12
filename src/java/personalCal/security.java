/*  Document            : SQL injection for databases for security. Querys structures
and prepared statement utilized.
    Date Created        : April 5, 2018
Author                  : Zoe Gray
*/

package personalCal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class security {

    private Connection conn = null;
    private String testValue;
    private String usernameAttempt;
    private boolean stringUsed;
    private boolean inUse;
    private String username;
    private String password;
    private String eventTitle;
    private String eventDay;
    private String eventMonth;
    private String eventYear;
    private String eventNote;
    private String eventTime;
    private String noteTitle;
    private String noteContent;
    private String newAccount;

    public security() {
        usernameAttempt = "";
        testValue = "";
        stringUsed = false;
        username = "";
        password = "";
        eventTitle = "";
        eventDay = "";
        eventMonth = "";
        eventYear = "";
        eventNote = "";
        eventTime = "";
        noteTitle = "";
        noteContent = "";
        newAccount = "";
    }

    public security(String usernameAttempt, String testValue, String username, String password, String eventTitle, String eventDay, String eventMonth, String eventYear, String eventNote, String eventColor, String noteTitle, String noteContent, String newAccount, boolean stringUsed, boolean inUse) {
        this.usernameAttempt = usernameAttempt;
        this.stringUsed = stringUsed;
        this.inUse = inUse;
        this.username = username;
        this.password = password;
        this.eventTitle = eventTitle;
        this.eventDay = eventDay;
        this.eventMonth = eventMonth;
        this.eventYear = eventYear;
        this.eventNote = eventNote;
        this.eventTime = eventColor;
        this.noteTitle = noteTitle;
        this.noteContent = noteContent;
        this.newAccount = newAccount;
    }

    public void setTestValue(String testValue) {
        this.testValue = testValue;
    }

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

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventDay() {
        return eventDay;
    }

    public void setEventDay(String eventDay) {
        this.eventDay = eventDay;
    }

    public String getEventMonth() {
        return eventMonth;
    }

    public void setEventMonth(String eventMonth) {
        this.eventMonth = eventMonth;
    }

    public String getEventYear() {
        return eventYear;
    }

    public void setEventYear(String eventYear) {
        this.eventYear = eventYear;
    }

    public String getEventNote() {
        return eventNote;
    }

    public void setEventNote(String eventNote) {
        this.eventNote = eventNote;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getNoteTitle() {
        return noteTitle;
    }

    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle;
    }

    public String getNoteContent() {
        return noteContent;
    }

    public void setNoteContent(String noteContent) {
        this.noteContent = noteContent;
    }

    public String getUsernameAttempt() {
        return usernameAttempt;
    }

    public void setUsernameAttempt(String usernameAttempt) {
        this.usernameAttempt = usernameAttempt;
    }

    public boolean isInUse() {
        countRows();
        return inUse;
    }

    public void setInUse(boolean inUse) {
        this.inUse = inUse;
    }

    public void connectDb() {
        String connectURL = "jdbc:mysql://localhost:3306/PersonalManagementDB";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectURL, "root", "mysql1");
            System.out.println(conn);
        } catch (Exception err) {
            System.out.println("Connection error");
            err.printStackTrace(System.err);
            System.exit(0);
        }
    }

    public void closeDb() {
        try {
            conn.close();
        } catch (Exception err) {
            System.out.println("Closing Connection Error"); //delete later
            err.printStackTrace(System.err);
            System.exit(0);
        }
    }

    //create account
    public void insertPrepared(String dbQuery, String value1, String value2) {

        System.out.println("Inserting: \n" + dbQuery);
        connectDb();
        try {
            PreparedStatement s = conn.prepareStatement(dbQuery); //HERE THIS ERROR HERE xxx
            s.setString(1, value1);
            s.setString(2, value2);
            int status = s.executeUpdate();
            System.out.println("Status " + status);
            if (status == 1) {
                System.out.println("Inserted into table.");
            } else {
                System.out.println("Error");
            }
        } catch (Exception err) {
            err.printStackTrace(System.err);
            System.exit(0);
        }
    }

    public void insertPrepared(String dbQuery, String value1, String value2, String value3, String value4, String value5, String value6, String value7) {
        String nameDB = "PersonalManagementDB";
        System.out.println("Inserting: \n" + dbQuery);
        connectDb();
        try {
            PreparedStatement s = conn.prepareStatement(dbQuery);
            s.setString(1, value1);
            s.setString(2, value2);
            int status = s.executeUpdate();
            System.out.println("Status " + status);
            if (status == 1) {
                System.out.println("Inserted into table.");
            } else {
                System.out.println("Error");
            }
        } catch (Exception err) {
            err.printStackTrace(System.err);
            System.exit(0);
        }
        closeDb();
    }

    public void insertPrepared(String dbQuery, String value1, String value2, String value3) {
        String nameDB = "PersonalManagementDB";
        System.out.println("Inserting: \n" + dbQuery);
        connectDb();
        try {
            PreparedStatement s = conn.prepareStatement(dbQuery);
            s.setString(1, value1);
            s.setString(2, value2);
            int status = s.executeUpdate();
            System.out.println("Status " + status);
            if (status == 1) {
                System.out.println("Inserted into table.");
            } else {
                System.out.println("Error");
            }
        } catch (Exception err) {
            err.printStackTrace(System.err);
            System.exit(0);
        }
        closeDb();
    }

    public static void main(String[] args) {
        security sObject = new security();
        String nameDB = "PersonalManagementDB";
        String userInputOne = "Sheogorath";
        String userInputTwo = "cheese";
        boolean hi;
        //   sObject.getNewAccount(userInputOne, userInputTwo);
        sObject.setTestValue(null);
        hi = sObject.getStringUsed();
        System.out.println(hi);
    }

    public String getNewAccount() {
        security sObject = new security();
        System.out.println("2.1");
        String query = "INSERT INTO users (username, password) VALUES (?,?);";
        sObject.insertPrepared(query, username, password); //changed from iv
        System.out.println("2.2");

        return newAccount;
    }

    public void newEvent(String v1, String v2, String v3, String v4, String v5, String v6, String v7) {
        security sObject = new security();
        String query = "INSERT INTO events (username, eventTitle, dayEvent, monthEvent, yearEvent, note, color VALUES (?,?,?,?,?,?,?);";

        sObject.insertPrepared(query, username, eventTitle, eventDay, eventMonth, eventYear, eventNote, eventTime);
    }

    public void newNote(String v1, String v2, String v3) {
        security sObject = new security();
        String query = "INSERT INTO notes (username, noteTitle, noteContent VALUES(?,?,?);";
        sObject.insertPrepared(query, username, noteTitle, noteContent);
    }

    public boolean getStringUsed() {
        stringUsed = true;
        if ((testValue == null) || (testValue.equals(""))) {
            stringUsed = false;
        }
        testValue = "";
        return stringUsed;
    }

    public boolean countRows() {
        ResultSet rs = null;
        
        inUse=false;
        
        String queryStmt = "SELECT * FROM users WHERE username= ?";
        int rowsUsed = 0;
        connectDb();
        try {
            PreparedStatement s = conn.prepareStatement(queryStmt);
            s.setString(1, usernameAttempt);
            rs = s.executeQuery();
            inUse = rs.next();
                        rs.close();

//            while (rs.next()) {
//                rowsUsed = rs.getInt("rowCounter");
            
        } catch (Exception e) {
            System.err.println("SQL counting error");
            e.printStackTrace(System.err);
            System.exit(0);
        }
        closeDb();
        System.out.println(rowsUsed);
//
//        if (rowsUsed > 0) {
//            inUse = true;
//        } else {
//            inUse = false;
//        }

        return inUse;
    }
}
