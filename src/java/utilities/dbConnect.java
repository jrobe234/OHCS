package utilities;

import java.sql.*;
import javax.sql.*;

public class dbConnect {

    java.sql.Connection conn;
    java.sql.Statement stmt;
    String connectionString;
    String dbUser;
    String dbPass;

    public dbConnect() throws SQLException {
        //connectionString = "jdbc:oracle:thin:@oracle.students.itee.uq.edu.au:1521:iteeo";
        connectionString = "jdbc:oracle:thin:@localhost:1521:XE";
        dbUser = "CSSE3005GF";
        dbPass = "229681";
        connect();
    }

    private void connect() throws SQLException {
        try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("oracle.jdbc.OracleDriver");
            conn = java.sql.DriverManager.getConnection(connectionString, dbUser, dbPass);
            stmt = conn.createStatement();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block

        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }

    public ResultSet executeQuery(String query) throws SQLException {
        ResultSet rs;
        rs = stmt.executeQuery(query);
        return rs;
    }

    

    private void close() throws SQLException {
          try {
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }
}
