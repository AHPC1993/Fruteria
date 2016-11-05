<%-- 
    Document   : BeanAdminOperarios
    Created on : 11/11/2014, 02:09:05 PM
    Author     : allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="beanUsuarios" scope="request" class="modelo.DAOUsuarios">
            <jsp:setProperty name="beanUsuarios" property="*" />
            <%
                //Se trae el valor que tiene el submit(botón) y dependiendo de ello se hace una funcionalidad.
                String valorSubmit = (String) request.getParameter("submit");
                if (valorSubmit.equals("Registrarse")) { 
                    //Se cargan los atributos para un usuario.
                    beanUsuarios.setCedula(request.getParameter("cedula"));
                    beanUsuarios.setNombre(request.getParameter("nombres"));
                    beanUsuarios.setApellido(request.getParameter("apellidos"));
                    beanUsuarios.setDireccion(request.getParameter("direccion"));
                    beanUsuarios.setUsuario(request.getParameter("usuarior"));
                    beanUsuarios.setContrasena(request.getParameter("contrasenar"));
                    //Se valida si el usuario fue insertado o no.
                    if (beanUsuarios.insertarUsuario()== true) {
                        out.println("Se ha registrado correctamente");
                    } else {
                        out.println("No se insertó el cliente");
                    }              
                } else if (valorSubmit.equals("Eliminar")) {
                    beanUsuarios.setCedula(request.getParameter("codigoEliminar")); 
                    if (beanUsuarios.eliminarUsuario()) {
                        out.print("Se ha Eliminado correctamente");
                    } else {
                        out.print("No se pudo eliminar");
                    }
                }
                    else if (valorSubmit.equals("Buscar")) {
                    out.print("Se entró a Buscar");                  
                    beanUsuarios.setCedula(request.getParameter("codigoModificar"));
                } 
                else if (valorSubmit.equals("Modificar")) {
                    beanUsuarios.setCedula(request.getParameter("cedulaMod"));
                    beanUsuarios.setNombre(request.getParameter("nombresMod"));
                    beanUsuarios.setApellido(request.getParameter("apellidosMod"));
                    beanUsuarios.setDireccion(request.getParameter("direccionMod"));
                    beanUsuarios.setUsuario(request.getParameter("usuarioMod"));
                    beanUsuarios.setContrasena(request.getParameter("contrasenaMod"));                       
                    if (beanUsuarios.modificarUsuario()) {
                        out.print("Se ha Modificado correctamente");
                    } else {
                        out.print("No se pudo Modificar");
                    }
                } 
//           

            %>
           
        </jsp:useBean>
       
    </body>
</html>
