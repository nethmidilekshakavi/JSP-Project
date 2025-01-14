package com.example.lk.ijse;

import com.example.lk.ijse.Entity.Category;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryManagement", value = "/category-save")
public class CategoryManagement extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get category details from form
            int id = Integer.parseInt(req.getParameter("categoryId"));
            String name = req.getParameter("categoryName");
            String desc = req.getParameter("categoryDescription");

            // Validate inputs (optional, but good practice)
            if (name == null || name.isEmpty() || desc == null || desc.isEmpty()) {
                resp.sendRedirect("CategoryManagemt.jsp?error=Category name and description are required");
                return;
            }

            // Establish connection
            try (Connection connection = dataSource.getConnection()) {
                String sql = "INSERT INTO categories(category_id, category_name, description) VALUES (?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, id);
                    preparedStatement.setString(2, name);
                    preparedStatement.setString(3, desc);

                    int affectedRowCount = preparedStatement.executeUpdate();

                    if (affectedRowCount > 0) {
                        resp.sendRedirect("CategoryManagemt.jsp?message=Category saved successfully");
                    } else {
                        resp.sendRedirect("CategoryManagemt.jsp?error=Failed to save category");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("CategoryManagemt.jsp?error=An error occurred while saving the category");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categoryList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM categories";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Category category = new Category(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3)
                );
                categoryList.add(category);
            }

            req.setAttribute("categories", categoryList);

            RequestDispatcher rd = req.getRequestDispatcher("CategoryManagemt.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("CategoryManagemt.jsp?error=Failed to load categories");
        }
    }

}
