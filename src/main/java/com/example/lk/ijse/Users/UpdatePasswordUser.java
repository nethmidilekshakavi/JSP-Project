package com.example.lk.ijse.Users;

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
import java.util.HashMap;

@WebServlet(urlPatterns = "/user-update")
public class UpdatePasswordUser extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String newPassword = req.getParameter("NewPassword");
        String un =req.getParameter("userName");
        String unname =req.getParameter("userNamee");

        try {
            // Get database connection from the DataSource
            Connection connection = dataSource.getConnection();

            // SQL query to update category details
            String query = "UPDATE users SET name =?, email = ?, password = ? , username = ?  WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            // Set parameters for the prepared statement
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, newPassword);
            preparedStatement.setString(4, un);
            preparedStatement.setString(5, unname);


            // Execute update and check the number of affected rows
            int effectdRowCount = preparedStatement.executeUpdate();

            if (effectdRowCount > 0){
                resp.sendRedirect(
                        "UserChangePassWord.jsp?message=User Password Update successfully"
                );
            }else {
                resp.sendRedirect(
                        "UserChangePassWord.jsp?error=fail to Update Unsuccessfully"
                );
            }

        } catch (Exception e) {
            // Log the exception and redirect with an error message
            e.printStackTrace();  // For debugging
            resp.sendRedirect("UserChangePassWord.jsp?error=An error occurred while updating the category");
        }
    }

}
