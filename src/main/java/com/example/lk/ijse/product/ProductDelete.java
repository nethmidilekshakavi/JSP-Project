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
import java.sql.SQLException;

@WebServlet(urlPatterns = "/product-Delete")
public class ProductDelete extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("Pid"));

        try {
            Connection connection = dataSource.getConnection();

            // Start transaction
            connection.setAutoCommit(false);

            // Delete from order_details
            String deleteOrderDetailsQuery = "DELETE FROM order_details WHERE product_id = ?";
            try (PreparedStatement ps1 = connection.prepareStatement(deleteOrderDetailsQuery)) {
                ps1.setInt(1, productId);
                ps1.executeUpdate();
            }

            // Delete from orders
            String deleteOrdersQuery = "DELETE FROM orders WHERE order_id IN (SELECT order_id FROM order_details WHERE product_id = ?)";
            try (PreparedStatement ps2 = connection.prepareStatement(deleteOrdersQuery)) {
                ps2.setInt(1, productId);
                ps2.executeUpdate();
            }

            // Delete from cart
            String deleteCartQuery = "DELETE FROM cart WHERE product_id = ?";
            try (PreparedStatement ps3 = connection.prepareStatement(deleteCartQuery)) {
                ps3.setInt(1, productId);
                ps3.executeUpdate();
            }

            // Delete from products
            String deleteProductQuery = "DELETE FROM products WHERE product_id = ?";
            try (PreparedStatement ps4 = connection.prepareStatement(deleteProductQuery)) {
                ps4.setInt(1, productId);
                int affectedRowCount = ps4.executeUpdate();

                if (affectedRowCount > 0) {
                    connection.commit();
                    resp.sendRedirect("ProductDelete.jsp?message=Product deleted successfully");
                } else {
                    connection.rollback();
                    resp.sendRedirect("ProductDelete.jsp?error=Failed to delete product");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("ProductDelete.jsp?error=An error occurred while deleting the product");
        }
    }
}
