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

@WebServlet(urlPatterns = "/OrderDetails")
public class OrderDetails extends HttpServlet {


    @Resource(name = "jdbc/pool")
    private DataSource dataSource;


    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = 0;
            int uid = Integer.parseInt(req.getParameter("user_id"));
            int oid = Integer.parseInt(req.getParameter("user_id"));
            Timestamp time = Timestamp.valueOf(req.getParameter("added_at"));
            String status = "Order Success!";

            String sql = "INSERT INTO order_details (id, order_id,user_id , order_date, status) VALUES (?, ?, ?, ?, ?)";

            // Connect to the database and execute the query
            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);
                preparedStatement.setInt(2, oid);
                preparedStatement.setInt(3, uid);
                preparedStatement.setTimestamp(4, time);
                preparedStatement.setString(5, status);

                // Execute the insert statement
                int affectedRowCount = preparedStatement.executeUpdate();

               /* // Update cart table status to 'success'
                String updateCartQuery = "UPDATE cart SET status = 'Order Successfully😁' WHERE cart_id = ?";
                PreparedStatement updatePs = connection.prepareStatement(updateCartQuery);
                updatePs.setInt(1, cartId);
                updatePs.executeUpdate();
                */

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
