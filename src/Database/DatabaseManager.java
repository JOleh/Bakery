package Database;

import java.sql.*;
import java.util.Map;

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
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM product;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getProductsOnScreenNoImage(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT id, name, price, info, weight, active FROM product;");
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

    static public void registrateUser(Connection connection , String name, String surname, String phone, String email, String password, int level){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users(name, surname, phonenumber, email, password , level)" +
                    "values(?, ? ,? ,? ,?, ?);");
            statement.setString(1, name);
            statement.setString(2, surname);
            statement.setString(3, phone);
            statement.setString(4, email);
            statement.setString(5, password);
            statement.setInt(6, level);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static public void setProjectInfo(Connection connection, String nameP, String phoneP, String emailP){
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static public ResultSet getUsersInfo(Connection connection){
        ResultSet resultSet = null;
        try{
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public void deleteUserById(Connection connection , int id){
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM users WHERE id=?;");
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static public ResultSet getUserByID(Connection connection, int id){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users where users.id=?;");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getOrderProductionList(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT users.id as uid,order_production.address as address, users.name as uname, users.surname as usurname, order_production.date as date, " +
                    "order_production.price as price, order_production.isdone as isdone, " +
                    "order_production.isrefused as isrefused, order_production.id_courier as idcourier , order_production.id as oid FROM order_production, users " +
                    "WHERE order_production.id_user=users.id " +
                    "ORDER BY order_production.date DESC ;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getLogs(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT log.id, log.action, log.data, log.id_user, users.name, users.surname FROM log, users WHERE log.id_user=users.id;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getBudget(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT budget, recording_date FROM projectinfo ORDER BY recording_date DESC");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getResources(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM resource");
            resultSet = statement.executeQuery();
            //statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getGlobalSupplyList(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM order_resources ORDER BY order_resources.date DESC ;");
            //", resource_for_order_resources, resource where order_resources.id=resource_for_order_resources.id_order AND resource.id=resource_for_order_resources.id_resource;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getLocalSupplyList(Connection connection, int order_id){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT resource_for_order_resources.count as count, resource.name as name, resource.price as price, resource.value as value " +
                    "FROM resource_for_order_resources, resource " +
                    "WHERE resource_for_order_resources.id_resource=resource.id " +
                    "AND resource_for_order_resources.id_order=?;" );
            //PreparedStatement statement = connection.prepareStatement("SELECT resource_for_order_resources.count, resource.name, resource.price, resource.value FROM resource_for_order_resources, resource where resource_for_order_resources.id_resource=resource.id AND resource_for_order_resources.id_order=?;" );
            statement.setInt(1, order_id);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getLocalOrderProductionList(Connection connection, int id_order){

        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT resource_for_order_production.count as count, product.name as name, product.price as price FROM product , resource_for_order_production " +
                    "WHERE resource_for_order_production.id_order=? " +
                    "AND resource_for_order_production.id_product=product.id;");
            statement.setInt(1, id_order);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getProductByID(Connection connection, int id_product){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE product.id=?;");
            statement.setInt(1, id_product);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getProductByIDNoImage(Connection connection, int id){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT id, name, price FROM product WHERE product.id=?;");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    static public ResultSet getProductIngredient(Connection connection , int product_id){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT ingredient.id AS id, resource.name AS name, ingredient.count AS count, resource.value AS value FROM ingredient, resource WHERE ingredient.id_product=? AND ingredient.id_resource=resource.id;");
            statement.setInt(1, product_id);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

   // static public void saveProductByID(Connection connection, Image image , String name, String info, double price){
    //}

    static public void saveOrderingProduction(Connection connection, Map<Integer, Integer> map, int user_id, Timestamp date,double allprice, boolean courier, String address){
        try {
            PreparedStatement statement1 = connection.prepareStatement("INSERT INTO order_production(id_user,date,price, address) VALUES(?,?,?,?);");
            statement1.setInt(1, user_id);
            statement1.setTimestamp(2, date);
            statement1.setDouble(3,allprice);
            statement1.setString(4, address);
            statement1.execute();
            statement1 = connection.prepareStatement("SELECT id FROM order_production WHERE date=?");
            statement1.setTimestamp(1,date);
            ResultSet rs = statement1.executeQuery();
            rs.next();
            int orderID = rs.getInt("id");
            for (Map.Entry<Integer,Integer> mSet:map.entrySet()) {
                statement1 = connection.prepareStatement("INSERT INTO resource_for_order_production(id_product, count, id_order) VALUES(?,?,?);");
                statement1.setInt(1, mSet.getKey());
                statement1.setDouble(2, mSet.getValue());
                statement1.setInt(3, orderID);
                statement1.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ResultSet getProductOrderingList(Connection connection, int id){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM order_production WHERE order_production.id_user=?;");
            statement.setInt(1,id);
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public static void deleteOrder(Connection connection, int id){
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM resource_for_order_production WHERE resource_for_order_production.id_order=?;");
            statement.setInt(1, id);
            statement.execute();
            statement = connection.prepareStatement("DELETE FROM order_production WHERE id=?;");
            statement.setInt(1,id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ResultSet getOrderProductionListForCourier(Connection connection){
        ResultSet resultSet = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT order_production.id as id, users.phonenumber as phonenumber, order_production.address as address ," +
                    "users.name as uname, users.surname as usurname ,order_production.isdelevered as is_delivered , order_production.isget as is_get " +
                    "FROM users, order_production " +
                    "WHERE order_production.isdelevered!=true AND order_production.address!='' AND users.id=order_production.id_user AND order_production.isdone=true ORDER BY order_production.date DESC ;");
            resultSet = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public  static void setOrderingDelivered(Connection connection , int id_order){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE order_production SET isdelevered=true WHERE order_production.id=?;");
            statement.setInt(1, id_order);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public  static void setOrderingGotten(Connection connection , int id, int id_courier){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE order_production SET isget=true, id_courier=? WHERE order_production.id=?;");
            statement.setInt(1, id_courier);
            statement.setInt(2, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static double getLastBudget(Connection connection){
        double bd = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT budget FROM projectinfo ORDER BY recording_date LIMIT 1;");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                bd = rs.getDouble("budget");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bd;
    }

    public static void setBudget(Connection connection , double plusMoney){
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement("UPDATE projectinfo SET budget=?;");
            statement.setDouble(1, getLastBudget(connection)+plusMoney);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static double getOrderPriceByID(Connection connection , int order_id){
        double price = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT price FROM order_production WHERE id=?;");
            statement.setInt(1, order_id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                price = rs.getDouble("price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return price;
    }

    public static void saveOrderResources(Connection connection, Map<Integer,Double> map , Timestamp date , double allprice){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO order_resources(allprice, date) VALUES(?,?);");
            statement.setTimestamp(2, date);
            statement.setDouble(1, allprice);
            statement.execute();
            statement = connection.prepareStatement("SELECT id FROM order_resources WHERE date=?;");
            statement.setTimestamp(1, date);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            int order_id = resultSet.getInt("id");
            for (Map.Entry<Integer, Double> mSet : map.entrySet()) {
                statement = connection.prepareStatement("INSERT INTO resource_for_order_resources(id_order, count, id_resource) VALUES (?,?,?);");
                statement.setInt(1, order_id);
                statement.setDouble(2, mSet.getValue());
                statement.setInt(3, mSet.getKey());
                statement.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void setOrderResourcesState(Connection connection,int id, boolean state){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE order_resources SET isconfirmed=? WHERE id=?;");
            statement.setBoolean(1, state);
            statement.setInt(2, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static double getResourcePriceByID(Connection connection, int id){
        double d = -1;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT price FROM resource WHERE id=?;");
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            d = rs.getDouble("price");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return d;
    }

    public static double getResourceOrderPriceByID(Connection connection, int id){
        double d = -1;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT allprice FROM order_resources WHERE id=?;");
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            d = rs.getDouble("allprice");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return d;
    }
    public static void setResourcesAfterManagerConfirming(Connection connection, int order_id){
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM resource_for_order_resources WHERE id_order=?;");
            statement.setInt(1, order_id);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                setResourceCountWhereID(connection, resultSet.getInt("id_resource" +
                        ""), resultSet.getDouble("count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private static double getResourceCountByID(Connection connection, int id){
        double d = -1;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT count FROM resource WHERE id=?;");
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            d = rs.getDouble("count");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return d;
    }
    private static void setResourceCountWhereID(Connection connection , int id, double pluscount){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE resource SET count=? WHERE id=?;");
            statement.setDouble(1, getResourceCountByID(connection,id)+pluscount);
            statement.setInt(2, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addResource(Connection connection, String name, String value, double price, double count){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO resource(name, value, price,count) VALUES(?,?,?,?);");
            statement.setString(1, name);
            statement.setString(2, value);
            statement.setDouble(3, price);
            statement.setDouble(4, count);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void removeResource(Connection connection, int id){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE resource SET active=FALSE WHERE id=?;");
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void removeProduct(Connection connection, int id){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE product SET active=FALSE WHERE id=?;");
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

