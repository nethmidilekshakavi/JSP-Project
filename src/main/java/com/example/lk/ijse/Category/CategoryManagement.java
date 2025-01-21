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

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;


@WebServlet(name = "CategoryManagement", value = "/category-save")
public class CategoryManagement extends HttpServlet {


    CategoryBo categoryBo = (CategoryBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("categoryId"));
        String name = req.getParameter("categoryName");
        String desc = req.getParameter("categoryDescription");


        categories categories = new categories(id, name, desc);


        boolean s = false;


        try {

            s = categoryBo.saveCategory(categories);

        } catch (Exception e) {
            e.printStackTrace();
        }


        if (s) {
            resp.sendRedirect("CategoryManagemt.jsp?message=Category saved successfully");
        } else {
            resp.sendRedirect("CategoryManagemt.jsp?error=Failed to save category");
        }

    }
}
