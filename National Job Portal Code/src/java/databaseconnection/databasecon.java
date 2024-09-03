package databaseconnection;

import java.sql.Connection;
import java.sql.*;

public class databasecon {

    static Connection con;

    public static Connection getconnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
        } catch (Exception e) {
            System.out.println("Database Error" + e);
        }
        return con;
    }

    public static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
