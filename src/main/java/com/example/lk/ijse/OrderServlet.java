package com.example.lk.ijse;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import javax.sql.DataSource;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;


@WebServlet(urlPatterns = "/OrderServlet")
public class OrderServlet extends HttpServlet {


    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // Get the data from the form
            int uid = Integer.parseInt(req.getParameter("user_id"));
            int cartId = Integer.parseInt(req.getParameter("cart_id"));
            double total = Double.parseDouble(req.getParameter("total"));
            String selectedSize = req.getParameter("product_size");
            Timestamp time = Timestamp.valueOf(req.getParameter("added_at"));
            String status = "Order Success!";

            // SQL query to insert the order
            String sql = "INSERT INTO orders (user_id, order_date, total, size, status) VALUES (?, ?, ?, ?, ?)";

            // Connect to the database and execute the query
            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, uid);
                preparedStatement.setTimestamp(2, time);
                preparedStatement.setDouble(3, total);
                preparedStatement.setString(4, selectedSize);
                preparedStatement.setString(5, status);

                // Execute the insert statement
                int affectedRowCount = preparedStatement.executeUpdate();

                // Update cart table status to 'success'
                String updateCartQuery = "UPDATE cart SET status = 'Order Successfully😁' WHERE cart_id = ?";
                PreparedStatement updatePs = connection.prepareStatement(updateCartQuery);
                updatePs.setInt(1, cartId);
                updatePs.executeUpdate();

                // Check if the row was inserted successfully
                if (affectedRowCount > 0) {
                    resp.sendRedirect("OrderTable.jsp?message=Order placed successfully");
                } else {
                    resp.sendRedirect("OrderTable.jsp?error=Failed to place the order");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Cart.jsp?error=An error occurred while processing the request.");
        }


    }
}

