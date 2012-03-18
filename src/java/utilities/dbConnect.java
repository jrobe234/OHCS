package utilities;

import java.sql.*;
import javax.sql.*;

public class dbConnect {

    com.mysql.jdbc.jdbc2.optional.MysqlDataSource ds;
    Connection con = null;
    Statement stmt;

    public dbConnect() throws SQLException {
        ds = new com.mysql.jdbc.jdbc2.optional.MysqlDataSource();
        ds.setServerName("localhost");
        ds.setPortNumber(3306);
        ds.setDatabaseName("healthcare");
        ds.setUser("root");
        ds.setPassword("password");
        connect();
    }

    private void connect() throws SQLException {
        con = ds.getConnection();
        stmt = con.createStatement();
    }

    public ResultSet executeQuery(String query) throws SQLException {
        ResultSet rs;
        rs = stmt.executeQuery(query);
        return rs;
    }

    

    private void close() throws SQLException {
        con.close();
    }
}
