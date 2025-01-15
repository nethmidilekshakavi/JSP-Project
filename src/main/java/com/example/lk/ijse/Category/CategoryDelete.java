package com.example.lk.ijse.Category;

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

@WebServlet(urlPatterns = "/category-delete")
public class CategoryDelete extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int id = Integer.parseInt(req.getParameter("Cid"));


        try {
            // Get database connection from the DataSource
            Connection connection = dataSource.getConnection();

            // SQL query to update category details
            String sql = "DELETE FROM categories WHERE category_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // Set parameters for the prepared statement

            preparedStatement.setInt(1, id);

            // Execute update and check the number of affected rows
            int effectdRowCount = preparedStatement.executeUpdate();

            if (effectdRowCount > 0){
                resp.sendRedirect(
                        "CategoryDelete.jsp?message=Category Delete successfully"
                );
            }else {
                resp.sendRedirect(
                        "CategoryDelete.jsp?error=fail to Delete Unsuccessfully"
                );
            }

        } catch (Exception e) {
            // Log the exception and redirect with an error message
            e.printStackTrace();  // For debugging
            resp.sendRedirect("CategoryDelete.jsp?error=An error occurred while deleting the category");
        }

    }
}
