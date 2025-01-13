package com.example.lk.ijse;

import com.example.lk.ijse.Entity.Admin;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UsersListServlet", value = "/users-list")
public class UsersListServelet extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Admin> adminList = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM users")) {

            while (resultSet.next()) {
                Admin adminDto = new Admin(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6)

                );
                adminList.add(adminDto);
            }

            req.setAttribute("Users", adminList);
            RequestDispatcher rd = req.getRequestDispatcher("Users-List.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            // Sending error message in the redirect
            resp.sendRedirect("users-list.jsp?error=Failed to retrieve users. Please try again.");
        }
    }
}
