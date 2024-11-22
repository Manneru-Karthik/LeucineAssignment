<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Access - User Access Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            color: #333;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        .container h1 {
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #ff6a00;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        select, textarea {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            outline: none;
            font-size: 1rem;
        }
        textarea {
            resize: none;
            height: 80px;
        }
        button {
            width: 90%;
            padding: 10px;
            background: #ff6a00;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background: #ee0979;
            transform: translateY(-3px);
        }
        footer {
            margin-top: 20px;
            font-size: 0.85rem;
            color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Request Software Access</h1>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p style="color: green; font-weight: bold;"><%= message %></p>
        <%
            }
        %>
        <form action="RequestServlet" method="post">
            <div class="form-group">
                <select name="software_id" required>
                    <option value="" disabled selected>Select Software</option>
                   <%
    Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/User-access", "postgres", "12345");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT id, name FROM software");
    while (rs.next()) {
%>
    <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
<%
    }
    rs.close();
    stmt.close();
    conn.close();
%>

                </select>
            </div>
            <div class="form-group">
                <select name="access_type" required>
                    <option value="Read">Read</option>
                    <option value="Write">Write</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>
            <div class="form-group">
                <textarea name="reason" placeholder="Reason for Access" required></textarea>
            </div>
            <button type="submit">Request Access</button>
        </form>
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
