<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Usuarios - Software Inc</title>
    <style>
        body { 
            font-family: sans-serif; 
            margin: 20px; background-color: #f4f4f4; 
        }
        .container { 
            background: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 2px 10px rgba(0,0,0,0.1); 
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
        }
        
        th, td {
            padding: 10px; 
            border: 1px solid #ddd;
            text-align: left;
        }
        
        th {
            background-color: #007bff; 
            color: white; 
        }
        
        .btn {
            padding: 5px 10px; 
            text-decoration: none;
            border-radius: 3px; 
            color: white; 
        }
        
        .btn-delete {
            background-color: #dc3545; 
        }
        
        .btn-save { 
            background-color: #28a745;
            border: none; 
            cursor: pointer; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Panel de Gestión de Usuarios</h2>
        <form action="UsuarioServlet" method="POST">
            <input type="hidden" name="id" value="${usuarioEdit.id}">
            <input type="text" name="username" placeholder="Usuario" value="${usuarioEdit.username}" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <button type="submit" class="btn btn-save">Guardar Usuario</button>
        </form>

        <table>
            <tr>
                <th>ID</th>
                <th>Nombre de Usuario</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="u" items="${listaUsuarios}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.username}</td>
                    <td>
                        <a href="UsuarioServlet?accion=eliminar&id=${u.id}" class="btn btn-delete" onclick="return confirm('¿Seguro?')">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="bienvenida.jsp">Volver al Inicio</a>
    </div>
</body>
</html>
