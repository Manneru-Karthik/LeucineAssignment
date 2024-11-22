package com.usermanagement.servlets;

import com.usermanagement.utils.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevels = String.join(",", request.getParameterValues("access_levels"));

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement pst = con.prepareStatement("INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)")) {
            pst.setString(1, name);
            pst.setString(2, description);
            pst.setString(3, accessLevels);
            pst.executeUpdate();
            request.setAttribute("message", "Software successfully added!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: Unable to add software.");
        }
        request.getRequestDispatcher("createSoftware.jsp").forward(request, response);
    }
}
