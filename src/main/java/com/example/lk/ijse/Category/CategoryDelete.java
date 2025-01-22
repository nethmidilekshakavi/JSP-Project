package com.example.lk.ijse.Category;

import com.example.lk.ijse.Bo.BOFactory;
import com.example.lk.ijse.Bo.custom.CategoryBo;
import com.example.lk.ijse.Entity.categories;
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

@WebServlet(urlPatterns = "/category-delete")
public class CategoryDelete extends HttpServlet {

    CategoryBo categoryBo = (CategoryBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("Cid"));



        boolean s = false;

        try {

            s = categoryBo.deleteCategory(id);

        } catch (Exception e) {
            e.printStackTrace();
        }


        if (s) {
            resp.sendRedirect("CategoryDelete.jsp?message=Category delete successfully");
        } else {
            resp.sendRedirect("CategoryDelete.jsp?error=Failed to delete category");
        }

    }
    }

