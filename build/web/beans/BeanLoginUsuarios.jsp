<%-- 
    Document   : BeanLoginU
    Created on : 11/10/2014, 08:55:33 PM
    Author     : allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>bean Login</title>        
    </head>
    <body>
        <%
            //Se crea el objeto users
            modelo.DAOUsuarios users = new modelo.DAOUsuarios();
            //Se guarda el usuario ingresado
            users.setUsuario(request.getParameter("usuario"));
            //Se guarda la contraseña ingresada y se le reemplazan los ' con #
            users.setContrasena(request.getParameter("contrasena").replace("'", "#"));
            //Se valida el usuario.
            boolean resultado = users.aprobarUsuario();
            //Si el resultado es true, se redirecciona a la página principal, de lo contrario
            //Falla la autenticación.
            if (resultado) {
                response.sendRedirect("../index.html");
                out.print("Se ha hecho el login");
            } else {
                out.print("Falló la autenticación");
            }


        %>
    <center> <form action="../index.html">
            Volver: <br>
            <input type="submit" name="btnSalir" value="Volver" />                   
        </form>
    </center>



</body>
</html>

