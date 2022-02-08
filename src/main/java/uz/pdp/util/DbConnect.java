package uz.pdp.util;

//Asliddin Kenjaev 2/4/2022 11:25 AM

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static uz.pdp.util.Constants.*;

public class DbConnect {
    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
