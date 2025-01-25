package com.example.lk.ijse;

import com.example.lk.ijse.Bo.BOFactory;
import com.example.lk.ijse.Bo.custom.userBo;
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
import java.sql.SQLException;

@WebServlet(urlPatterns = "/user-delete")
public class UserDelete extends HttpServlet {

    @Resource(name = "jdbc/pool")
    private DataSource dataSource;

    userBo userBO = (userBo) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.ADMIN);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("user_id"));

        boolean s = false;

        try {
            s = userBO.deleteuser(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (s) {
            try {
                Connection connection = dataSource.getConnection();

               /* // Delete from order_details
                String deleteOrderDetailsQuery = "DELETE FROM order_details WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = ?)";
                try (PreparedStatement ps1 = connection.prepareStatement(deleteOrderDetailsQuery)) {
                    ps1.setInt(1, id);
                    ps1.executeUpdate();
                }*/

                // Delete from orders
                String deleteOrdersQuery = "DELETE FROM orders WHERE user_id = ?";
                try (PreparedStatement ps2 = connection.prepareStatement(deleteOrdersQuery)) {
                    ps2.setInt(1, id);
                    ps2.executeUpdate();
                }

                // Delete from cart
                String deleteCartQuery = "DELETE FROM cart WHERE user_id = ?";
                try (PreparedStatement ps3 = connection.prepareStatement(deleteCartQuery)) {
                    ps3.setInt(1, id);
                    ps3.executeUpdate();
                }

                // Delete from users
                String deleteUserQuery = "DELETE FROM users WHERE user_id = ?";
                try (PreparedStatement ps4 = connection.prepareStatement(deleteUserQuery)) {
                    ps4.setInt(1, id);
                    ps4.executeUpdate();
                }

                connection.close();
                resp.sendRedirect("Users-List.jsp?message=User and related data deleted successfully");
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("Users-List.jsp?error=Failed to delete user and related data");
            }
        } else {
            resp.sendRedirect("Users-List.jsp?error=Failed to delete user and related data");
        }
    }
}
