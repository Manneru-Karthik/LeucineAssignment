<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Requests - User Access Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #fc466b, #3f5efb);
            color: #333;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 800px;
        }
        h1 {
            text-align: center;
            color: #fc466b;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #fc466b;
            color: #fff;
        }
        button {
            padding: 8px 15px;
            background: #3f5efb;
            border: none;
            color: #fff;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #2c47c6;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.85rem;
            color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Pending Access Requests</h1>
        
        <!-- Display success or error message -->
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p style="color: green; font-weight: bold;"><%= message %></p>
        <%
            }
        %>
        <table>
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Software</th>
                    <th>Access Type</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("org.postgresql.Driver");
                        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/User-access", "postgres", "12345");
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(
                            "SELECT r.id AS request_id, u.username AS employee_name, s.name AS software_name, r.access_type, r.reason " +
                            "FROM requests r " +
                            "JOIN users u ON r.user_id = u.id " +
                            "JOIN software s ON r.software_id = s.id " +
                            "WHERE r.status = 'Pending'"
                        );
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("employee_name") %></td>
                    <td><%= rs.getString("software_name") %></td>
                    <td><%= rs.getString("access_type") %></td>
                    <td><%= rs.getString("reason") %></td>
                    <td>
                        <form action="ApprovalServlet" method="post" style="display: inline;">
                            <input type="hidden" name="request_id" value="<%= rs.getInt("request_id") %>">
                            <button type="submit" name="action" value="approve">Approve</button>
                        </form>
                        <form action="ApprovalServlet" method="post" style="display: inline;">
                            <input type="hidden" name="request_id" value="<%= rs.getInt("request_id") %>">
                            <button type="submit" name="action" value="reject">Reject</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
        <div>
        <!-- Logout Link -->
<a href="LogoutServlet" style="color: #11998e; font-weight: bold; text-decoration: none; float: right; margin: 10px;">
    Logout
</a>
        
        </div>
        <footer>© 2024 User Access Management System</footer>
    </div>
</body>
</html>
