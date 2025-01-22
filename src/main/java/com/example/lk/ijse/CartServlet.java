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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = "/cartSave")
public class CartServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    private static final Logger LOGGER = Logger.getLogger(CartServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

           /* HttpSession session = req.getSession();*/

         /*   if (session.getAttribute("user_id") == null) {
                resp.sendRedirect("login.jsp?error=Please log in first.");
                return;
            }
*/

                int cartid = 0;


            try (Connection connection = dataSource.getConnection()) {
               /* int userId = (int) session.getAttribute("user_id");*/

                String userid = req.getParameter("user_id");

                // Validate and parse the product
                String productStr = req.getParameter("product");
                if (productStr == null || productStr.trim().isEmpty()) {
                    resp.sendRedirect("Cart.jsp?error=Product ID is missing");
                    return;
                }
                int productId = Integer.parseInt(productStr);

                // Validate and parse the quantity
                String quantityStr = req.getParameter("quantity");
                if (quantityStr == null || quantityStr.trim().isEmpty()) {
                    resp.sendRedirect("Cart.jsp?error=Quantity is missing");
                    return;
                }
                int quantity = Integer.parseInt(quantityStr);

                // Validate and parse the price
                String priceStr = req.getParameter("product_price");
                if (priceStr == null || priceStr.trim().isEmpty()) {
                    resp.sendRedirect("Cart.jsp?error=Product price is missing");
                    return;
                }
                double price = Double.parseDouble(priceStr);

                // Validate and retrieve other parameters
                String imgUrl = req.getParameter("product_image");



                // Calculate total
                double total = price * quantity;
                Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now());

                String sql = "INSERT INTO cart (cart_id,user_id, product_id, quantity, added_at, image_url,price, total) VALUES (?, ?, ?, ?, ?, ?, ?,?)";

                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1,cartid);
                    preparedStatement.setString(2, userid);
                    preparedStatement.setInt(3, productId);
                    preparedStatement.setInt(4, quantity);
                    preparedStatement.setTimestamp(5, timestamp);
                    preparedStatement.setString(6, imgUrl);
                    preparedStatement.setDouble(7, total);
                    preparedStatement.setDouble(8, price);

                    int affectedRowCount = preparedStatement.executeUpdate();
                    if (affectedRowCount > 0) {
                        resp.sendRedirect("Cart.jsp?message=Cart item added successfully");
                    } else {
                        resp.sendRedirect("Cart.jsp?error=Failed to add item to cart");
                    }
                }
            } catch (SQLException | NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Error adding item to cart", e);
                resp.sendRedirect("Cart.jsp?error=An error occurred while adding the item to the cart");
            }
        }

    }

