package com.example.lk.ijse;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AdminSaveServlet", value = "/Admin-save")
public class AdminSaveServelet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    private static final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id  = 0;
        String name = req.getParameter("adminName");
        String email = req.getParameter("adminEmail");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String role = "Customer"; // Default role, change as needed

        try (Connection connection = dataSource.getConnection()) {

            // Prepare SQL statement (if user_id is auto-incremented, no need to pass it)
            String sql = "INSERT INTO users (user_id ,username, password, email, name, role) VALUES (?, ?, ?, ?, ? ,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // Hash the password using BCrypt
            String encryptedPassword = passwordEncoder.encode(password);

            // Set the parameters in the prepared statement
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, encryptedPassword);  // Set hashed password
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, name);
            preparedStatement.setString(6, role);

            // Execute the query
            int affectedRowCount = preparedStatement.executeUpdate();

            // Redirect based on whether the insertion was successful
            if (affectedRowCount > 0) {
                resp.sendRedirect("Admin.jsp?message=Admin saved successfully");
            } else {
                resp.sendRedirect("Admin.jsp?error=Failed to save admin");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Admin.jsp?error=An error occurred while saving admin");
        }
    }
}
