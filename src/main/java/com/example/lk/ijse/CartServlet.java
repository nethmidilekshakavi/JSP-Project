package com.example.lk.ijse;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection connection = dataSource.getConnection()) {
            HttpSession session = req.getSession();

            // Retrieve form parameters
            int userId = (int) session.getAttribute("user_id");
            int productId = Integer.parseInt(req.getParameter("product")); // Assuming "product" is the name attribute in the product select dropdown
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String imgUrl = req.getParameter("product_image");
            double price = Double.parseDouble(req.getParameter("product_price"));
            double total = price * quantity;
            Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now()); // Set current timestamp

            // SQL query to insert the cart item
            String sql = "INSERT INTO cart (user_id, product_id, quantity, added_at, image_url, total ,price) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, productId);
                preparedStatement.setInt(3, quantity);
                preparedStatement.setTimestamp(4, timestamp);
                preparedStatement.setString(5, imgUrl);
                preparedStatement.setDouble(6, total);
                preparedStatement.setDouble(7, price);

                int affectedRowCount = preparedStatement.executeUpdate();
                if (affectedRowCount > 0) {
                    resp.sendRedirect("Cart.jsp?message=Cart item added successfully");
                } else {
                    resp.sendRedirect("Cart.jsp?error=Failed to add item to cart");
                }
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("Cart.jsp?error=An error occurred while adding the item to the cart");
        }
    }
}
