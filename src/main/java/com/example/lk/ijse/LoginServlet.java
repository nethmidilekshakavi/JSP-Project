package com.example.lk.ijse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/jsp_project";
    String DB_USER = "root";
    String DB_PW = "1234";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PW);

            String query = "SELECT role FROM users WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String role = resultSet.getString("role");
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                if ("admin".equalsIgnoreCase(role)) {
                    resp.sendRedirect("DashBoard.jsp?message=Login successful");
                } else if ("Customer".equalsIgnoreCase(role)){
                    resp.sendRedirect("CustomerDashBoar.jsp?message=Login successful");
                }
            } else {
                resp.sendRedirect("index.jsp?error=Invalid username or password");
            }

            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=Database connection error");
        }
    }
}
