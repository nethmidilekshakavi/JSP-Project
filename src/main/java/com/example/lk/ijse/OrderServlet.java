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
import java.sql.Timestamp;

@WebServlet(urlPatterns = "/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = null;

        try {
            // Get the data from the form
            int uid = Integer.parseInt(req.getParameter("user_id"));
            int cartId = Integer.parseInt(req.getParameter("cart_id"));
            double total = Double.parseDouble(req.getParameter("total"));
            String selectedSize = req.getParameter("product_size");
            Timestamp time = Timestamp.valueOf(req.getParameter("added_at"));
            String status = "Order Success!";
            int qty = Integer.parseInt(req.getParameter("quantity"));
            int pid = Integer.parseInt(req.getParameter("product_id"));

            // SQL query to insert into `orders`
            String orderSql = "INSERT INTO orders (user_id, order_date, total, size, status, product_id, qty) VALUES (?, ?, ?, ?, ?, ?, ?)";
            String cartUpdateSql = "UPDATE cart SET status = 'Order Successfully😁' WHERE id = ?";
            String orderDetailsSql = "INSERT INTO order_details (order_id, user_id, product_id, qty, order_date) VALUES (?, ?, ?, ?, ?)";

            connection = dataSource.getConnection();
            connection.setAutoCommit(false); // Start transaction

            // Insert into `orders` table
            try (PreparedStatement orderPs = connection.prepareStatement(orderSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                orderPs.setInt(1, uid);
                orderPs.setTimestamp(2, time);
                orderPs.setDouble(3, total);
                orderPs.setString(4, selectedSize);
                orderPs.setString(5, status);
                orderPs.setInt(6, pid);
                orderPs.setInt(7, qty);

                int affectedRowCount = orderPs.executeUpdate();
                if (affectedRowCount > 0) {
                    // Get the generated order ID
                    var generatedKeys = orderPs.getGeneratedKeys();
                    int orderId = 0;
                    if (generatedKeys.next()) {
                        orderId = generatedKeys.getInt(1);
                    }

                    // Update `cart` table
                    try (PreparedStatement cartPs = connection.prepareStatement(cartUpdateSql)) {
                        cartPs.setInt(1, cartId);
                        cartPs.executeUpdate();
                    }

                    // Insert into `order_details` table
                    try (PreparedStatement orderDetailsPs = connection.prepareStatement(orderDetailsSql)) {
                        orderDetailsPs.setInt(1, orderId);
                        orderDetailsPs.setInt(2, uid);
                        orderDetailsPs.setInt(3, pid);
                        orderDetailsPs.setInt(4, qty);
                        orderDetailsPs.setTimestamp(5, time);
                        orderDetailsPs.executeUpdate();
                    }

                    connection.commit(); // Commit the transaction
                    resp.sendRedirect("OrderTable.jsp?message=Order placed successfully");
                } else {
                    connection.rollback(); // Rollback if no rows affected
                    resp.sendRedirect("OrderTable.jsp?error=Failed to place the order");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            resp.sendRedirect("Cart.jsp?error=An error occurred while processing the request.");
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception closeEx) {
                    closeEx.printStackTrace();
                }
            }
        }
    }
}
