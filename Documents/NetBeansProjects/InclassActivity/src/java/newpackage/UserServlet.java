package newpackage;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/insertUser", "/deleteUser"}) 
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/user";
    private static final String USER = "root";
    private static final String PASS = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/insertUser".equals(action)) {
            insertUser(request, response);
        } else if ("/deleteUser".equals(action)) {
            deleteUser(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Invalid request");
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        if (username == null || username.trim().isEmpty() || email == null || email.trim().isEmpty()) {
            response.getWriter().write("Error: Username and Email cannot be empty.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (username, email) VALUES (?, ?)")) {

                stmt.setString(1, username);
                stmt.setString(2, email);
                int rows = stmt.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.getWriter().write("Error: Unable to insert user.");
                }
            }
        } catch (ClassNotFoundException e) {
            response.getWriter().write("Error: MySQL JDBC Driver not found.");
        } catch (SQLException e) {
            response.getWriter().write("Database Error: " + e.getMessage());
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.trim().isEmpty()) {
            response.getWriter().write("Error: User ID cannot be empty.");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM users WHERE id = ?")) {

                stmt.setInt(1, id);
                int rows = stmt.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.getWriter().write("Error: User ID not found.");
                }
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("Error: Invalid User ID format.");
        } catch (ClassNotFoundException e) {
            response.getWriter().write("Error: MySQL JDBC Driver not found.");
        } catch (SQLException e) {
            response.getWriter().write("Database Error: " + e.getMessage());
        }
    }
}