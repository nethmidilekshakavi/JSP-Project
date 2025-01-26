package com.example.lk.ijse.Category;
import com.example.lk.ijse.Bo.BOFactory;
import com.example.lk.ijse.Bo.custom.CategoryBo;
import com.example.lk.ijse.Bo.custom.userBo;
import com.example.lk.ijse.Entity.categories;
import com.example.lk.ijse.Entity.users;
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
import java.sql.*;


@WebServlet(urlPatterns = "/category-save")
public class CategoryManagement extends HttpServlet {

    CategoryBo categoryBo = (CategoryBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;


    @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {

                int id = Integer.parseInt(req.getParameter("categoryId"));
                String name = req.getParameter("categoryName");
                String desc = req.getParameter("categoryDescription");


                String sql = "INSERT INTO categories (category_id , category_name, description) " +
                        "VALUES (?, ?, ?)";

                try (Connection connection = dataSource.getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, id);
                    preparedStatement.setString(2, name);
                    preparedStatement.setString(3, desc);

                    int affectedRowCount = preparedStatement.executeUpdate();
                    if (affectedRowCount > 0) {
                        resp.sendRedirect("CategoryManagemt.jsp?message=Category saved successfully");
                    } else {
                        resp.sendRedirect("CategoryManagemt.jsp?error=Failed to save Product");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("CategoryManagemt.jsp?error=An error occurred while saving the product");
            }
        }

    }
