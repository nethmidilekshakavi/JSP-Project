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

@WebServlet(urlPatterns = "/user-delete")
public class UserDelete extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            try (Connection connection = dataSource.getConnection()) {
                String sql = "DELETE FROM users WHERE user_id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, id); // Use setInt instead of setString for numeric values

                    int affectedRowCount = preparedStatement.executeUpdate();
                    if (affectedRowCount > 0) {
                        resp.sendRedirect("Users-List.jsp?message=User deleted successfully");
                    } else {
                        resp.sendRedirect("Users-List.jsp?error=Failed to delete user");
                    }
                }
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("Users-List.jsp?error=Invalid user ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Users-List.jsp?error=An error occurred while deleting the user");
        }
    }
}
