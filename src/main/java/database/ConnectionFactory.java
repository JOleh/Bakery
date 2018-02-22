package database;

import java.sql.*;

public class ConnectionFactory {
    final private static String URL = "jdbc:postgresql://localhost:5432/bakery";
    final private static String USER = "postgres";
    final private static String PASSWORD = "postgres";

    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(URL,USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Connection Failed!");
        }catch (SQLException e){
            e.printStackTrace();
        }
        return connection;
    }
}
