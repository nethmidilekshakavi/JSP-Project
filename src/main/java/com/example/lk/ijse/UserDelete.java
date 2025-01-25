package com.example.lk.ijse;

import com.example.lk.ijse.Bo.BOFactory;
import com.example.lk.ijse.Bo.custom.CategoryBo;
import com.example.lk.ijse.Bo.custom.userBo;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/user-delete")
public class UserDelete extends HttpServlet {


    userBo userBO = (userBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.ADMIN);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        boolean s = false;

        try {

            s = userBO.deleteuser(id);

        } catch (Exception e) {
            e.printStackTrace();
        }


        if (s) {
            resp.sendRedirect("UserDelete.jsp?message=Category saved successfully");
        } else {
            resp.sendRedirect("UserDelete.jsp?error=Failed to save category");
        }

    }

}
