<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Access Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a6c1ee);
            background-size: 300% 300%;
            animation: gradientAnimation 6s ease infinite;
            color: #333;
        }
        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        .container h1 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #4facfe;
        }
        .container p {
            margin-bottom: 20px;
            color: #555;
        }
        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            background: #ff7eb3;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 50px;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .btn:hover {
            background: #ff6584;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to User Access Management</h1>
        <p>Manage your application access with ease.</p>
        <a href="login.jsp" class="btn">Login</a>
        <a href="signup.jsp" class="btn">Sign Up</a>
    </div>
</body>
</html>
