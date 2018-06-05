package database;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;

public class ConnectionFactory {
   /* final private static String URL = "jdbc:postgresql://localhost:5432/bakery";
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
    }*/

  public static Connection getConnection() throws URISyntaxException, SQLException {
    URI dbUri = new URI(System.getenv("DATABASE_URL"));

    String username = dbUri.getUserInfo().split(":")[0];
    String password = dbUri.getUserInfo().split(":")[1];
    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

    return DriverManager.getConnection(dbUrl, username, password);
  }

  /*public static Connection getConnection() throws URISyntaxException, SQLException {
    *//*URI dbUri = new URI(System.getenv("DATABASE_URL"));

    String username = dbUri.getUserInfo().split(":")[0];
    String password = dbUri.getUserInfo().split(":")[1];*//*
//    String dbUrl = "jdbc:postgresql://ec2-54-243-239-66.compute-1.amazonaws.com:5432/ddhg5ibominbk5";
//    String yuerr = "jdbc:postgresql://?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    try {
      Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
      System.out.println("Bad driver");
      e.printStackTrace();
    }
    String sfd = "jdbc:postgresql://ec2-54-243-239-66.compute-1.amazonaws.com:5432/ddhg5ibominbk5?user=cagqyhhnxdkvnc&password=c9e43b0f7c19477058cd82cf01242a2d433970068f29df9ed9206b23802034cd&ssl=true";
    return DriverManager.getConnection(sfd);
  }*/
}
