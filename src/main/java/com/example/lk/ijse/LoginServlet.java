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

    private static final String DB_URL = "jdbc:mysql://localhost:3306/jsp_project";
    private static final String DB_USER = "root";
    private static final String DB_PW = "1234";

    public static int useriD = 0;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PW);

            String query = "SELECT password, role , user_id FROM users WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                String role = resultSet.getString("role");
                int userId = resultSet.getInt("user_id"); // Fetch the user ID

                System.out.println(userId);

                if (storedPassword.equals(password)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("role", role);
                    session.setAttribute("userID", userId);


                   useriD = userId;

                    if ("Admin".equalsIgnoreCase(role)) {
                        resp.sendRedirect("DashBoard.jsp?message=Login successful");
                    } else if ("Customer".equalsIgnoreCase(role)) {
                        resp.sendRedirect("CustomerDashBoar.jsp?message=Login successful");
                    } else {
                        resp.sendRedirect("index.jsp?error=Unauthorized role");
                    }
                } else {
                    resp.sendRedirect("index.jsp?error=Invalid username or password");
                }
            } else {
                resp.sendRedirect("index.jsp?error=Invalid username or password");
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=Database connection error");
        }
    }
}
