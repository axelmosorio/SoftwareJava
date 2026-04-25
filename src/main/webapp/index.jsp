<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Software BBC - Login</title>
</head>
<body>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .login-container {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }
        
        h2 { color: #1c1e21; margin-bottom: 1.5rem; }
        
        input {
            width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        }
        
        button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s;
        }
        
        button:hover { background-color: #0056b3; }
        
        .error-msg {
            color: #d93025;
            background: #f8d7da;
            padding: 8px;
            border-radius: 4px;
            margin-bottom: 1rem;
            font-size: 14px;
    }
    </style>
    <div class="login-container">
    <h2>Software BBC</h2>
    <% if(request.getAttribute("error") != null) { %>
        <div class="error-msg"><%= request.getAttribute("error") %></div>
    <% } %>
    
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Usuario" required>
        <input type="password" name="password" placeholder="Contraseña" required>
        <button type="submit">Entrar al Sistema</button>
    </form>
</div>
</body>
</html>