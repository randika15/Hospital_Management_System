package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static Connection conn;

    /**
     * Get a Connection to the PostgreSQL database.
     *
     * @return a live Connection or null if the connection failed
     */
    public static Connection getConn() {
        try {
            // 1. Load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");  // Driver class name for PostgreSQL :contentReference[oaicite:0]{index=0}

            // 2. Connect using the PostgreSQL URL format:
            //    jdbc:postgresql://<host>:<port>/<database>
            String url      = "jdbc:postgresql://localhost:5432/hospital";  // Default port is 5432 :contentReference[oaicite:1]{index=1}
            String username = "postgres";
            String password = "root";

            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC Driver not found. Include it in your library path!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Connection to PostgreSQL failed!");
            e.printStackTrace();
        }
        return conn;
    }
}
