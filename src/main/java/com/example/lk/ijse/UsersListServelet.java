package com.example.lk.ijse;
import com.example.lk.ijse.DTO.AdminDto;
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

@WebServlet(urlPatterns = "/User-list")
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
                Admin admin = new Admin(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("username"),
                        resultSet.getString("role")
                );
                adminList.add(admin);
            }

            req.setAttribute("users", adminList);  // Updated to 'users' for consistency
            RequestDispatcher rd = req.getRequestDispatcher("Users-List.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Failed to retrieve users. Please try again.");
            RequestDispatcher rd = req.getRequestDispatcher("Users-List.jsp");
            rd.forward(req, resp);
        }
    }
}



