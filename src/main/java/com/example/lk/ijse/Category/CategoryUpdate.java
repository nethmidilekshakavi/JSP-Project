package com.example.lk.ijse.Category;

import com.example.lk.ijse.Bo.BOFactory;
import com.example.lk.ijse.Bo.custom.CategoryBo;
import com.example.lk.ijse.Entity.categories;
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

        int id = Integer.parseInt(req.getParameter("Cid"));
        String name = req.getParameter("name");
        String desc = req.getParameter("Cdesc");


        try (Connection connection = dataSource.getConnection()) {  // Use try-with-resources for auto-closing

            // SQL query to update product details
            String sql = "UPDATE categories SET category_name = ?, description = ? WHERE category_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                // Set parameters for the prepared statement
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, desc);
                preparedStatement.setInt(3, id);



                int affectedRowCount = preparedStatement.executeUpdate();

                if (affectedRowCount > 0) {
                    resp.sendRedirect("CatorgoryUpdate.jsp?message=Product updated successfully");
                } else {
                    resp.sendRedirect("CatorgoryUpdate.jsp?error=Failed to update product");
                }
            }
        } catch (Exception e) {
            // Log the exception and redirect with an error message
            e.printStackTrace();  // For debugging
            resp.sendRedirect("CatorgoryUpdate.jsp?error=An error occurred while updating the product");
        }
    }
}
