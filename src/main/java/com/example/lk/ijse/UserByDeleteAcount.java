package com.example.lk.ijse;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/deletebyUser")
public class UserByDeleteAcount extends HttpServlet {
    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Connection connection = dataSource.getConnection();

            // Start transaction
            connection.setAutoCommit(false);

            // Verify user's credentials
            String verifyUserQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement ps = connection.prepareStatement(verifyUserQuery)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // User exists, proceed with deletion

                    // Delete from order_details
                    String deleteOrderDetailsQuery = "DELETE FROM order_details WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)";
                    try (PreparedStatement ps1 = connection.prepareStatement(deleteOrderDetailsQuery)) {
                        ps1.setInt(1, rs.getInt("user_id"));
                        ps1.executeUpdate();
                    }

                    // Delete from orders
                    String deleteOrdersQuery = "DELETE FROM orders WHERE user_id = ?";
                    try (PreparedStatement ps2 = connection.prepareStatement(deleteOrdersQuery)) {
                        ps2.setInt(1, rs.getInt("user_id"));
                        ps2.executeUpdate();
                    }

                    // Delete from cart
                    String deleteCartQuery = "DELETE FROM cart WHERE user_id = ?";
                    try (PreparedStatement ps3 = connection.prepareStatement(deleteCartQuery)) {
                        ps3.setInt(1, rs.getInt("user_id"));
                        ps3.executeUpdate();
                    }

                    // Delete from users
                    String deleteUserQuery = "DELETE FROM users WHERE user_id = ?";
                    try (PreparedStatement ps4 = connection.prepareStatement(deleteUserQuery)) {
                        ps4.setInt(1, rs.getInt("user_id"));
                        int affectedRowCount = ps4.executeUpdate();

                        if (affectedRowCount > 0) {
                            connection.commit();
                            resp.sendRedirect("UserDelete.jsp?message=Account deleted successfully");
                        } else {
                            connection.rollback();
                            resp.sendRedirect("UserDelete.jsp?error=Failed to delete account");
                        }
                    }

                } else {
                    // User credentials are incorrect
                    resp.sendRedirect("UserDelete.jsp?error=Invalid username or password");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("UserDelete.jsp?error=An error occurred while deleting the account");
        }
    }
}
