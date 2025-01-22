package com.example.lk.ijse.img;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import javax.sql.DataSource;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

@MultipartConfig
@WebServlet(urlPatterns = "/product-save")
public class ProductManagementSave extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("pid"));
            String name = req.getParameter("name");
            String description = req.getParameter("desc");
            double price = Double.parseDouble(req.getParameter("price"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            int cid = Integer.parseInt(req.getParameter("cid"));

            Part file = req.getPart("productImage");

            String imageFileName = file.getSubmittedFileName();
            System.out.println("Selected Image File Name " + imageFileName);

            String uploadPath = getServletContext().getRealPath("/img/") + imageFileName;
            System.out.println("File path " + uploadPath);

            try (FileOutputStream fos = new FileOutputStream(uploadPath); InputStream is = file.getInputStream()) {
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
            } catch (Exception e) {
                e.printStackTrace();
            }

            String sql = "INSERT INTO products (product_id, product_name, description, price, stock_quantity, category_id, product_img) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection connection = dataSource.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);
                preparedStatement.setString(2, name);
                preparedStatement.setString(3, description);
                preparedStatement.setDouble(4, price);
                preparedStatement.setInt(5, qty);
                preparedStatement.setInt(6, cid);
                preparedStatement.setString(7, imageFileName);

                int affectedRowCount = preparedStatement.executeUpdate();
                if (affectedRowCount > 0) {
                    resp.sendRedirect("ProductMangemt.jsp?message=Product saved successfully");
                } else {
                    resp.sendRedirect("ProductMangemt.jsp?error=Failed to save Product");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("ProductMangemt.jsp?error=An error occurred while saving the product");
        }
    }
}
