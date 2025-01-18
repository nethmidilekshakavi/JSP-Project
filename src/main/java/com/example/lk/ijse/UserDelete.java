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

        String name = req.getParameter("name");

        try {
            // Get database connection from the DataSource
            Connection connection = dataSource.getConnection();

            // SQL query to update category details
            String sql = "DELETE FROM users WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setString(1, name);

            int effectdRowCount = preparedStatement.executeUpdate();

            if (effectdRowCount > 0){
                resp.sendRedirect(
                        "Users-List.jsp?message=User Delete successfully"
                );
            }else {
                resp.sendRedirect(
                        "Users-List.jsp?error=fail to Delete Unsuccessfully"
                );
            }

        } catch (Exception e) {
            // Log the exception and redirect with an error message
            e.printStackTrace();  // For debugging
            resp.sendRedirect("Users-List.jsp?error=An error occurred while deleting the category");
        }
    }
}
