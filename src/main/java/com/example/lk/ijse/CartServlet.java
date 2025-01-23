package com.example.lk.ijse;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.sql.DataSource;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
@WebServlet(urlPatterns = "/cartSave")
public class CartServlet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    private static final Logger LOGGER = Logger.getLogger(CartServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int uid = 1;
            int productId = Integer.parseInt(req.getParameter("productId"));
            String productName = req.getParameter("productName");
            String productDescription = req.getParameter("productDescription");
            String priceParam = req.getParameter("productPrice");
            double productPrice = (priceParam != null && !priceParam.isEmpty()) ? Double.parseDouble(priceParam) : 0.0;
            int qty = Integer.parseInt(req.getParameter("qty"));
            String selectedSize = req.getParameter("selectedSize");

            Part filePart = req.getPart("productImage");
            String imageFileName = filePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("/img/") + imageFileName;
            try (FileOutputStream fos = new FileOutputStream(uploadPath);
                 InputStream is = filePart.getInputStream()) {
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
            }

            String sql = "INSERT INTO cart (user_id, product_id, quantity, product_size, image_url, price, total, added_at)\n" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                preparedStatement.setInt(1, uid);
                preparedStatement.setInt(2, productId);
                preparedStatement.setInt(3, qty);
                preparedStatement.setString(4, selectedSize);
                preparedStatement.setString(5, imageFileName);
                preparedStatement.setDouble(6, productPrice);
                preparedStatement.setDouble(7, productPrice * qty);
                preparedStatement.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    resp.sendRedirect("Cart.jsp?message=Product added to cart");
                } else {
                    resp.sendRedirect("Cart.jsp?error=Failed to add product to cart");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Cart.jsp?error=An unexpected error occurred");
        }
    }

}


