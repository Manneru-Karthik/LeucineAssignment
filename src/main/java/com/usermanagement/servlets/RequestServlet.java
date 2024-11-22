package com.usermanagement.servlets;

import com.usermanagement.utils.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int softwareId = Integer.parseInt(request.getParameter("software_id"));
        String accessType = request.getParameter("access_type");
        String reason = request.getParameter("reason");
        String username = (String) request.getSession().getAttribute("username");

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement userPst = con.prepareStatement("SELECT id FROM users WHERE username = ?");
             PreparedStatement reqPst = con.prepareStatement("INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, 'Pending')")) {
            userPst.setString(1, username);
            ResultSet rs = userPst.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                reqPst.setInt(1, userId);
                reqPst.setInt(2, softwareId);
                reqPst.setString(3, accessType);
                reqPst.setString(4, reason);
                reqPst.executeUpdate();
                request.setAttribute("message", "Request submitted successfully.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Set an error message if an exception occurs
            request.setAttribute("message", "Error: Unable to submit request.");
        }

        // Forward to the same page to display the message
        request.getRequestDispatcher("requestAccess.jsp").forward(request, response);

    }
}
