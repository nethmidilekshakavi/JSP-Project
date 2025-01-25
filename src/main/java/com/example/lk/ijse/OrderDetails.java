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
            int uid = Integer.parseInt(req.getParameter("user_id"));
            int oid = Integer.parseInt(req.getParameter("order_id"));
            int pid = Integer.parseInt(req.getParameter("product_id"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            Timestamp time = Timestamp.valueOf(req.getParameter("added_at"));


            String sql = "INSERT INTO order_details (order_id,user_id ,product_id,qty, order_date) VALUES (?, ?, ?, ?, ?)";

            // Connect to the database and execute the query
            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, oid);
                preparedStatement.setInt(2, uid);
                preparedStatement.setInt(3, pid);
                preparedStatement.setInt(4, qty);
                preparedStatement.setTimestamp(5, time);


                // Execute the insert statement
                int affectedRowCount = preparedStatement.executeUpdate();



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
