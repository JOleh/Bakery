package Database;

import java.sql.Connection;
import java.sql.ResultSet;

public interface Database {
    ResultSet lodOnUser(Connection connection);
}
