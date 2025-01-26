package com.example.lk.ijse.Category;
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
import java.sql.SQLException;

@WebServlet(urlPatterns = "/category-delete")
public class CategoryDelete extends HttpServlet {


    @Resource(name = "jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("Cid"));

        try {
            Connection connection = dataSource.getConnection();

            // Start transaction
            connection.setAutoCommit(false);

            String deleteProductQuery = "DELETE FROM categories WHERE category_id = ?";
            try (PreparedStatement ps4 = connection.prepareStatement(deleteProductQuery)) {
                ps4.setInt(1, id);
                int affectedRowCount = ps4.executeUpdate();

                if (affectedRowCount > 0) {
                    connection.commit();
                    resp.sendRedirect("CategoryList.jsp?message=Category deleted successfully");
                } else {
                    connection.rollback();
                    resp.sendRedirect("CategoryList.jsp?error=Failed to delete product");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("CategoryList.jsp?error=An error occurred while deleting the product");
        }
    }
    }

