package com.example.lk.ijse.product;

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

@WebServlet(urlPatterns = "/product-Update")
public class ProductUpdate extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("pid"));
        String name = req.getParameter("name");
        String description = req.getParameter("desc");  // Avoid using 'desc' in SQL queries
        double price = Double.parseDouble(req.getParameter("price"));
        int qty = Integer.parseInt(req.getParameter("qty"));
        int cid = Integer.parseInt(req.getParameter("cid"));

        try (Connection connection = dataSource.getConnection()) {  // Use try-with-resources for auto-closing

            // SQL query to update product details
            String sql = "UPDATE products SET product_name = ?, description = ?, price = ?, stock_quantity = ?, category_id = ? WHERE product_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {  // Use try-with-resources for auto-closing

                // Set parameters for the prepared statement
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, description);
                preparedStatement.setDouble(3, price);
                preparedStatement.setInt(4, qty);
                preparedStatement.setInt(5, cid);
                preparedStatement.setInt(6, id);

                // Execute update and check the number of affected rows
                int affectedRowCount = preparedStatement.executeUpdate();

                if (affectedRowCount > 0) {
                    resp.sendRedirect("ProductUpdate.jsp?message=Product updated successfully");
                } else {
                    resp.sendRedirect("ProductUpdate.jsp?error=Failed to update product");
                }
            }
        } catch (Exception e) {
            // Log the exception and redirect with an error message
            e.printStackTrace();  // For debugging
            resp.sendRedirect("ProductUpdate.jsp?error=An error occurred while updating the product");
        }
    }
}
