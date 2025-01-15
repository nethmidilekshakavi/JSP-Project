package com.example.lk.ijse;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet(name = "ProductManagementSave", value = "/product-save")
public class ProductManagementSave extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get category details from form
            int id = Integer.parseInt(req.getParameter("pid"));
            String name = req.getParameter("name");
            String desc = req.getParameter("desc");
            double price = Double.parseDouble(req.getParameter("price"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            int cid = Integer.parseInt(req.getParameter("cid"));

            // Validate inputs (optional, but good practice)
            if (name == null || name.isEmpty() || desc == null || desc.isEmpty()) {
                resp.sendRedirect("ProductMangemt.jsp.jsp?error=product name and description are required");
                return;
            }

            // Establish connection
            try (Connection connection = dataSource.getConnection()) {
                String sql = "INSERT INTO  products(product_id ,product_name,description,price,stock_quantity,category_id) VALUES (?, ?, ?,?,?,?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, id);
                    preparedStatement.setString(2, name);
                    preparedStatement.setString(3, desc);
                    preparedStatement.setDouble(4, price);
                    preparedStatement.setInt(5, qty);
                    preparedStatement.setInt(6, cid);

                    int affectedRowCount = preparedStatement.executeUpdate();

                    if (affectedRowCount > 0) {
                        resp.sendRedirect("ProductMangemt.jsp?message=Product saved successfully");
                    } else {
                        resp.sendRedirect("ProductMangemt.jsp?error=Failed to save Product");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("ProductMangemt.jsp?error=An error occurred while saving the product");
        }
    }




}



