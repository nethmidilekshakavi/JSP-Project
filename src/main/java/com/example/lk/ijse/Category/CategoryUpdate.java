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

@WebServlet(urlPatterns = "/category-update")
public class CategoryUpdate extends HttpServlet {

    CategoryBo categoryBo = (CategoryBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("Cid"));
        String name = req.getParameter("Cname");
        String desc = req.getParameter("Cdesc");


        categories categories = new categories(id, name, desc);


        boolean s = false;


        try {

            s = categoryBo.updateCategory(categories);

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (s) {
            resp.sendRedirect("CatorgoryUpdate.jsp?message=Category saved successfully");
        } else {
            resp.sendRedirect("CatorgoryUpdate.jsp?error=Failed to save category");
        }

    }
}
