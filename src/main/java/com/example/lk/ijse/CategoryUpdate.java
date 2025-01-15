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

@WebServlet(urlPatterns = "/category-update")
public class CategoryUpdate extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("Cname");
        String desc = req.getParameter("Cdesc");
        int id = Integer.parseInt(req.getParameter("Cid"));

        System.out.println("update Name _:" + name);
        System.out.println("update desc _:" + desc);

        try {
            // Get database connection from the DataSource
            Connection connection = dataSource.getConnection();

            // SQL query to update category details
            String sql = "UPDATE categories SET category_name = ?, description = ? WHERE category_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // Set parameters for the prepared statement
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, desc);
            preparedStatement.setInt(3, id);

            // Execute update and check the number of affected rows
            int effectdRowCount = preparedStatement.executeUpdate();

            if (effectdRowCount > 0){
                resp.sendRedirect(
                        "CatorgoryUpdate.jsp?message=Customer Update successfully"
                );
            }else {
                resp.sendRedirect(
                        "CatorgoryUpdate.jsp?error=fail to Update Unsuccessfully"
                );
            }

        } catch (Exception e) {
            // Log the exception and redirect with an error message
            e.printStackTrace();  // For debugging
            resp.sendRedirect("CatorgoryUpdate.jsp?error=An error occurred while updating the category");
        }
    }
}
