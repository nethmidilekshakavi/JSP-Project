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

                String sql = "DELETE FROM users WHERE username = ? AND password = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                preparedStatement.setString(1, un);
                preparedStatement.setString(2, pw);

                int affectedRowCount = preparedStatement.executeUpdate();

                if (affectedRowCount > 0) {
                    resp.sendRedirect("UserDelete.jsp?message=Your account has been deleted successfully");
                } else {
                    resp.sendRedirect("UserDelete.jsp?error=Failed to delete your account");
                }

                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();  // For debugging
                resp.sendRedirect("UserDelete.jsp?error=An error occurred while deleting the account");
            }
        }
    }



