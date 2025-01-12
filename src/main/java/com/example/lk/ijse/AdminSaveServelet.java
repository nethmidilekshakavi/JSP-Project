package com.example.lk.ijse;

import com.example.lk.ijse.Bo.AdminBo;
import com.example.lk.ijse.Bo.BOFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



@WebServlet(name = "CustomerSaveServlet",value = "/Admin-save")
public class AdminSaveServelet extends HttpServlet {
    AdminBo adminBo =  BOFactory.getBoFactory().getBO(BOFactory.BOTypes.ADMIN);

    String DB_URL = "jdbc:mysql://localhost:3306/jsp_project";
    String DB_USER = "root";
    String DB_PW = "1234";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("adminId"));
        String name = req.getParameter("adminName");
        String email = req.getParameter("adminEmail");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String role = req.getParameter("role");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PW
            );

            String sql = "INSERT INTO users (id,name,email,password,username,role) VALUES (?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setInt(1,id);
            preparedStatement.setString(2,name);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,password);
            preparedStatement.setString(5,username);
            preparedStatement.setString(6,role);

            int effectdRowCount = preparedStatement.executeUpdate();

            if (effectdRowCount > 0){
                resp.sendRedirect(
                        "Admin.jsp?message=Admin saved successfully"
                );
            }else {
                resp.sendRedirect(
                        "Admin.jsp?error=fail to saved Unsuccessfully"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "Admin.jsp?error=fail to saved Unsuccessfully"
            );
        }
    }
}