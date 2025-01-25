package com.example.lk.ijse;
import com.example.lk.ijse.Bo.BOFactory;
import com.example.lk.ijse.Bo.custom.userBo;
import com.example.lk.ijse.Entity.users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin-save")
public class AdminServlet extends HttpServlet {


    userBo userbo = (userBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.ADMIN);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int id = 0;
        String name = req.getParameter("username");
        String email = req.getParameter("password");
        String password = req.getParameter("adminEmail");
        String username = req.getParameter("username");
        String role = "Customer";




            users users = new users(id,name,email,password,username,role);


            boolean s = false;

            try{

                s = userbo.saveAdmin(users);

            } catch (Exception e) {
                e.printStackTrace();
            }


            if (s) {
                resp.sendRedirect("Admin.jsp?message=Admin saved successfully");
            } else {
                resp.sendRedirect("Admin.jsp?error=Failed to save admin");
            }


    }
}

