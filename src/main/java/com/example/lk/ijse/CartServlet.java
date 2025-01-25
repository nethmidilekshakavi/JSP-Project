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

@MultipartConfig
@WebServlet(urlPatterns = "/cartSave")
public class CartServlet extends HttpServlet {


    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int uid = Integer.parseInt(req.getParameter("userid"));
            int productId = Integer.parseInt(req.getParameter("productId"));
            double productPrice = Double.parseDouble(req.getParameter("productPrice"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            String selectedSize = req.getParameter("selectedSize");
            selectedSize = (selectedSize != null) ? selectedSize : "N/A";

            Timestamp time = Timestamp.valueOf(LocalDateTime.now());
            double total = productPrice * qty;

            Part filePart = req.getPart("productImage");

            String imageFileName = (filePart != null) ? generateUniqueFileName(filePart.getSubmittedFileName()) : "default.jpg";
            String uploadPath = getServletContext().getRealPath("/img/") + imageFileName;
            if (filePart != null) {
                try (FileOutputStream fos = new FileOutputStream(uploadPath); InputStream is = filePart.getInputStream()) {
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                }
            }

            String sql = "INSERT INTO cart (user_id, product_id, quantity, added_at, image_url, price, total, product_Size) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, uid);
                preparedStatement.setInt(2, productId);
                preparedStatement.setInt(3, qty);
                preparedStatement.setTimestamp(4, time);
                preparedStatement.setString(5, imageFileName);
                preparedStatement.setDouble(6, productPrice);
                preparedStatement.setDouble(7, total);
                preparedStatement.setString(8, selectedSize);

                System.out.println(uid + " " + productId + " " + qty + " " + time + " " + imageFileName + " " + productPrice + " " + total + " " + selectedSize);

                int affectedRowCount = preparedStatement.executeUpdate();
                if (affectedRowCount > 0) {
                    resp.sendRedirect("OrderTable.jsp=Product saved successfully");
                } else {
                    resp.sendRedirect("Cart.jsp?error=Failed to save Product");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Cart.jsp?error=An error occurred while processing the request.");
        }
    }

    private String generateUniqueFileName(String originalFileName) {
        if (originalFileName == null || originalFileName.isEmpty()) {
            return "default.jpg";
        }
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf('.'));
        return System.currentTimeMillis() + fileExtension;
    }
}
