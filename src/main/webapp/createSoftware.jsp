<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Software - User Access Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: #333;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        .container h1 {
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #11998e;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        input[type="text"], textarea {
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
        .checkbox-group {
            margin-top: 10px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        button {
            width: 90%;
            padding: 10px;
            background: #11998e;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background: #0d8769;
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
        <h1>Add New Software</h1>
            <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p style="color: green; font-weight: bold;"><%= message %></p>
        <%
            }
        %>
        
        <form action="SoftwareServlet" method="post">
            <div class="form-group">
                <input type="text" name="name" placeholder="Software Name" required>
            </div>
            <div class="form-group">
                <textarea name="description" placeholder="Description"></textarea>
            </div>
            <div class="checkbox-group">
                <label><input type="checkbox" name="access_levels" value="Read"> Read</label>
                <label><input type="checkbox" name="access_levels" value="Write"> Write</label>
                <label><input type="checkbox" name="access_levels" value="Admin"> Admin</label>
            </div>
            <button type="submit">Add Software</button>
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
