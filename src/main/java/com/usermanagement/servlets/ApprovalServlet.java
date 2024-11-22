package com.usermanagement.servlets;

import com.usermanagement.utils.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("request_id"));
        String action = request.getParameter("action");
        String status = "approve".equals(action) ? "Approved" : "Rejected";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement pst = con.prepareStatement("UPDATE requests SET status = ? WHERE id = ?")) {
            pst.setString(1, status);
            pst.setInt(2, requestId);
            pst.executeUpdate();
            request.setAttribute("message", "Request " + status + " successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            // If error occurs, set an error message
            request.setAttribute("message", "Error: Unable to process request.");
        }

        // Forward the request to pendingRequests.jsp with the success or error message
        request.getRequestDispatcher("pendingRequests.jsp").forward(request, response);
    }
}
