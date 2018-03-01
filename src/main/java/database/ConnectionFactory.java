package database;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;

public class ConnectionFactory {
    /*final private static String URL = "";
    final private static String USER = "";
    final private static String PASSWORD = "";

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
    }*/

    public static Connection getConnection() throws URISyntaxException, SQLException {
        URI dbUri = new URI(System.getenv("DATABASE_URL"));

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

        return DriverManager.getConnection(dbUrl, username, password);
    }
}
