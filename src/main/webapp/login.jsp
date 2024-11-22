<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - User Access Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
        }
        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 350px;
        }
        .container h1 {
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #764ba2;
        }
        .container p {
            color: #666;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
        }
        button {
            width: 90%;
            padding: 10px;
            background: #764ba2;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background: #5a4b9e;
            transform: translateY(-3px);
        }
        .forgot-password {
            margin-top: 15px;
            font-size: 0.9rem;
        }
        .forgot-password a {
            color: #764ba2;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: underline;
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
        <h1>Login</h1>
        <p>Welcome back! Please log in to continue.</p>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <div class="forgot-password">
            <a href="#">Forgot your password?</a>
        </div>
        <footer>© 2024 User Access Management System</footer>
    </div>
</body>
</html>
