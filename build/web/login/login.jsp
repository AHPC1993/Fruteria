<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
    </head>
    <body>
   
  <div class="login-page">
       <center><h1 style="color: #4d4d4d">Fruteria</h1></center>
            <div class="form">

                <form class="register-form" name="AddUsuarios" action="../beans/BeanAdminUsuarios.jsp" method="post" target="add" onsubmit="return formulario(this)">
                    <input type="text" placeholder="Cédula" id="cedula" name="cedula" required="true"/>
                    <input type="text" placeholder="Nombres"id="nombres" name="nombres"required="true"/>
                    <input type="text" placeholder="Apellidos"id="apellidos" name="apellidos"required="true"/>
                    <input type="text" placeholder="Dirección"id="direccion" name="direccion"/>
                    <input type="text" placeholder="Usuario"id="usuarior" name="usuarior"required="true"/>
                    <input type="password" placeholder="Contraseña"id="contrasenar" name="contrasenar" required="true"/>
                    <input  type="submit" name="submit" value="Registrarse"  class="button"/>
                    <p class="message">Ya estás registrado? <a href="#">Iniciar Sesión</a></p>
                </form>
                <form class="login-form" name="login-form" action="../beans/BeanLoginUsuarios.jsp" method="post">
                    <input type="text" placeholder="Usuario" id="usuario" name="usuario"/>
                    <input type="password" placeholder="Contraseña" id="contrasena"  name="contrasena"/>
                    <input  type="submit" name="submit" value="Login" class="button" />                
                 
                </form>
            </div>
        </div>
         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

      <script src="js/index.js"></script>
    </body>
</html>
