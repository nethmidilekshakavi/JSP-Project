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
import java.sql.SQLException;

@WebServlet(urlPatterns = "/user-delete")
public class UserDelete extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));

        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false); // Start transaction

            try {
                // Step 1: Delete from `order_details`
                String deleteOrderDetailsQuery = "DELETE FROM order_details WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)";
                try (PreparedStatement ps1 = connection.prepareStatement(deleteOrderDetailsQuery)) {
                    ps1.setInt(1, userId);
                    ps1.executeUpdate();
                }

                // Step 2: Delete from `orders`
                String deleteOrdersQuery = "DELETE FROM orders WHERE user_id = ?";
                try (PreparedStatement ps2 = connection.prepareStatement(deleteOrdersQuery)) {
                    ps2.setInt(1, userId);
                    ps2.executeUpdate();
                }

                // Step 3: Delete from `cart`
                String deleteCartQuery = "DELETE FROM cart WHERE user_id = ?";
                try (PreparedStatement ps3 = connection.prepareStatement(deleteCartQuery)) {
                    ps3.setInt(1, userId);
                    ps3.executeUpdate();
                }

                // Step 4: Delete from `users`
                String deleteUserQuery = "DELETE FROM users WHERE user_id = ?";
                try (PreparedStatement ps4 = connection.prepareStatement(deleteUserQuery)) {
                    ps4.setInt(1, userId);
                    ps4.executeUpdate();
                }

                // Commit the transaction
                connection.commit();
                resp.sendRedirect("Users-List.jsp?message=User and related data deleted successfully");
            } catch (SQLException e) {
                // Rollback the transaction if any operation fails
                connection.rollback();
                e.printStackTrace();
                resp.sendRedirect("Users-List.jsp?error=Failed to delete user and related data");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("Users-List.jsp?error=Database connection error");
        }
    }
}
