<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                margin: 0;
                background-color: #f8f9fa;
            }
            
            .navbar {
                background-color: #343a40;
                color: white;
                padding: 1rem 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .content {
                padding: 3rem;
                text-align: center;
            }
            
            .welcome-card {
                background: white;
                padding: 3rem;
                border-radius: 15px;
                display: inline-block;
                box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            }
            
            .logout-btn {
                color: #ff4d4d;
                text-decoration: none;
                font-weight: bold;
                border: 1px solid #ff4d4d;
                padding: 5px 15px;
                border-radius: 20px;
                transition: 0.3s;
            }
            
            .logout-btn:hover {
                background: #ff4d4d;
                color: white;
            }
                                                                                                                                                                                                    
            .boton_administrar {
                margin: 30px;
                width: 180px;
                height: 30px;
                background-color: whitesmoke;
                color: white;
                border-radius: 8px;
                text-decoration: none;
                text-align: center;
                padding: 10px;
                border: 1px
            }
</style>
        <div class="navbar">
            <span><strong>Software BBC</strong> | Panel Principal</span>
            <a href="index.jsp" class="logout-btn">Cerrar sesión</a>
        </div>

        <div class="content">
            <div class="welcome-card">
                <h1>¡Bienvenido, <%= session.getAttribute("usuarioLogueado") %>!</h1>
                <p>Has iniciado sesión correctamente en la plataforma.</p>
                <div class="boton_administrar">
                <a href="UsuarioServlet">Administrar Usuarios</a>
                </div>
            </div>
        </div>
    </body>
</html>
