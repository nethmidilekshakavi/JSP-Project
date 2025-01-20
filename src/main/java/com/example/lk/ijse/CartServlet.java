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


@WebServlet("/cart")
public class CartServlet  extends HttpServlet {
    @Resource(name = "jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            int cid = 0;
            HttpSession session = req.getSession();
            int uid = (int) session.getAttribute("user_id"); //userid get in login
            int productid = Integer.parseInt(req.getParameter("producct_id"));
            int quentity = req.getIntHeader("quantity");
            String time = req.getParameter(" timestamp");
            String img = req.getParameter("img");
            double total = req.getIntHeader("total");


            String sql = "INSERT INTO products (cart_id ,user_id, product_id, quantity, added_at, image_url,t) " +
                    "VALUES (?, ?, ?, ?, ?, ?,?)";

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, cid);
                preparedStatement.setInt(2, uid);
                preparedStatement.setInt(3, productid);
                preparedStatement.setInt(4, quentity);
                preparedStatement.setString(5, time);
                preparedStatement.setString(6, img);
                preparedStatement.setDouble(7, total);


                int affectedRowCount = preparedStatement.executeUpdate();
                if (affectedRowCount > 0) {
                    resp.sendRedirect("Cart.jsp?message=Cart saved successfully");
                } else {
                    resp.sendRedirect("Cart.jsp?error=Failed to save Product");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Cart.jsp?error=An error occurred while saving the product");
        }

    }
}
