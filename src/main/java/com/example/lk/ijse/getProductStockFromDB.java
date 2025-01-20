package com.example.lk.ijse;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServlet;
import javax.sql.DataSource;
import java.sql.*;

public class getProductStockFromDB extends HttpServlet {

    @Resource
    private DataSource dataSource;

    public int getStock(String productName) {



        int stock = 0;
        String query = "SELECT stock_quantity FROM products WHERE product_name = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, productName);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    stock = resultSet.getInt("stock_quantity");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
    }
}
