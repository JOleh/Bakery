package Database;

import java.sql.*;
import java.time.LocalDateTime;

public class DatabaseManager {

    static public ResultSet lodOnUser(Connection connection, String login, String password) {
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE password=? AND (phonenumber=? OR email=?);");
            statement.setString(1, password);
            statement.setString(2, login);
            statement.setString(3, login);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getProductsOnScreen(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT name , price FROM product;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getProjectInfo(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM projectinfo ORDER BY recording_date DESC LIMIT 1;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public boolean isPhoneUsed(Connection connection, String tel){
        boolean f = false;
        try {
            System.out.println("in try phone");
            PreparedStatement statement = connection.prepareStatement("SELECT phonenumber FROM users WHERE phonenumber=?;");
            statement.setString(1, tel);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                f = true;
            }
            System.out.println(f);
            System.out.println("end try mail");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    static public boolean isEmailUsed(Connection connection, String email){
        boolean flag = false;
        try {
            System.out.println("in try mail");
            PreparedStatement statement = connection.prepareStatement("SELECT email FROM users WHERE email=?;");
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                flag = true;
            }
            System.out.println(flag);
            System.out.println("end try mail");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    static public boolean registrateUser(Connection connection , String name, String surname, String phone, String email, String password, int level){
        boolean flag = false;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users(name, surname, phonenumber, email, password , level)" +
                    "values(?, ? ,? ,? ,?, ?);");
            statement.setString(1, name);
            statement.setString(2, surname);
            statement.setString(3, phone);
            statement.setString(4, email);
            statement.setString(5, password);
            statement.setInt(6, level);
            int num = statement.executeUpdate();
            if(num==1)  flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    static public boolean setProjectInfo(Connection connection, String nameP, String phoneP, String emailP){
        boolean flag = false;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT budget FROM projectinfo ORDER BY recording_date LIMIT 1;");
            double bdg = 0;
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                bdg = resultSet.getDouble("budget");
            }
            
            PreparedStatement statement1 = connection.prepareStatement("INSERT INTO projectinfo(name, phonenumber, email, budget, recording_date) values(?,?,?,?,?)");
            statement1.setString(1, nameP);
            statement1.setString(2, phoneP);
            statement1.setString(3, emailP);
            statement1.setDouble(4, bdg);
            statement1.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            statement1.execute();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(flag);
        return flag;
    }

    static public ResultSet getUsersInfo(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public boolean deleteUserById(Connection connection , int id){
        boolean flag = false;
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM users WHERE id=?;");
            statement.setInt(1, id);
            statement.execute();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }


}
