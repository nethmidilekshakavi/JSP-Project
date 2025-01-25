package com.example.lk.ijse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deleteCart")
public class DeleteCart extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartId = request.getParameter("cart_id");
        String userid = request.getParameter("user_id");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");

            // Create a SQL DELETE statement
            String sql = "DELETE FROM cart WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(cartId));
            stmt.executeUpdate();

/*

            String sqlOrderDetails = "DELETE FROM order_details WHERE order_id = (SELECT order_id FROM orders WHERE cart_id = ?)";
            PreparedStatement stmtOrderDetails = conn.prepareStatement(sqlOrderDetails);
            stmtOrderDetails.setInt(1, Integer.parseInt(cartId));
            stmtOrderDetails.executeUpdate();
            stmtOrderDetails.close();
*/

            // Delete from 'orders' based on 'cart_id'
            String sqlOrders = "DELETE FROM orders WHERE user_id = ?";
            PreparedStatement stmtOrders = conn.prepareStatement(sqlOrders);
            stmtOrders.setInt(1, Integer.parseInt(userid));
            stmtOrders.executeUpdate();
            stmtOrders.close();



            // Close the connection
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // Redirect to the cart details page after deletion
        response.sendRedirect("OrderTable.jsp");
    }
}
