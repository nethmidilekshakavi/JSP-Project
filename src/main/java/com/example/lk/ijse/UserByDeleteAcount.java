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

@WebServlet(urlPatterns = "/deletebyUser")
public class UserByDeleteAcount extends HttpServlet {
    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String un = req.getParameter("username");
        String pw = req.getParameter("password");

        try {
            Connection connection = dataSource.getConnection();

            // Get user_id based on username and password
            String getUserIdQuery = "SELECT user_id FROM users WHERE username = ? AND password = ?";
            PreparedStatement getUserIdStmt = connection.prepareStatement(getUserIdQuery);
            getUserIdStmt.setString(1, un);
            getUserIdStmt.setString(2, pw);
            ResultSet rs = getUserIdStmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");

               /* // Delete from order_details
                String deleteOrderDetailsQuery = "DELETE FROM order_details WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)";
                try (PreparedStatement ps1 = connection.prepareStatement(deleteOrderDetailsQuery)) {
                    ps1.setInt(1, userId);
                    ps1.executeUpdate();
                }
*/
                // Delete from orders
                String deleteOrdersQuery = "DELETE FROM orders WHERE user_id = ?";
                try (PreparedStatement ps2 = connection.prepareStatement(deleteOrdersQuery)) {
                    ps2.setInt(1, userId);
                    ps2.executeUpdate();
                }

                // Delete from cart
                String deleteCartQuery = "DELETE FROM cart WHERE user_id = ?";
                try (PreparedStatement ps3 = connection.prepareStatement(deleteCartQuery)) {
                    ps3.setInt(1, userId);
                    ps3.executeUpdate();
                }

                // Delete from users
                String deleteUserQuery = "DELETE FROM users WHERE user_id = ?";
                try (PreparedStatement ps4 = connection.prepareStatement(deleteUserQuery)) {
                    ps4.setInt(1, userId);
                    int affectedRowCount = ps4.executeUpdate();

                    if (affectedRowCount > 0) {
                        resp.sendRedirect("UserDelete.jsp?message=Your account has been deleted successfully");
                    } else {
                        resp.sendRedirect("UserDelete.jsp?error=Failed to delete your account");
                    }
                }
            } else {
                resp.sendRedirect("UserDelete.jsp?error=Invalid username or password");
            }

            getUserIdStmt.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("UserDelete.jsp?error=An error occurred while deleting the account");
        }
    }
}
