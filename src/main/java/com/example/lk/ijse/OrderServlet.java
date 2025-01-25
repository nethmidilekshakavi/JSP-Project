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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int oid = 0;
            int uid = Integer.parseInt(req.getParameter("user_id"));
            double total = Double.parseDouble(req.getParameter("total"));
            String selectedSize = req.getParameter("product_size");
            Timestamp time = Timestamp.valueOf(req.getParameter("added_at"));




            String sql = "INSERT INTO orders (order_id ,user_id,order_date,total,status) " +
                    "VALUES (?, ?, ?, ? ,?)";

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1,oid);
                preparedStatement.setInt(2, uid);
                preparedStatement.setTimestamp(3, time);
                preparedStatement.setDouble(4, total);
                preparedStatement.setString(5, selectedSize);


                System.out.println(uid + " " + " "  + " " + time + " "  + " " + " " + total + " " + selectedSize);

                int affectedRowCount = preparedStatement.executeUpdate();
                if (affectedRowCount > 0) {
                    resp.sendRedirect("OrderTable.jsp?message=Product saved successfully");
                } else {
                    resp.sendRedirect("OrderTable.jsp?error=Failed to save Product");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Cart.jsp?error=An error occurred while processing the request.");
        }
    }


    }

