
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="beanClientes" scope="request" class="modelo.DAOClientes">
            <jsp:setProperty name="beanClientes" property="*" />
            <%
                //Se trae el valor que tiene el submit(botón) y dependiendo de ello se hace una funcionalidad.
                String valorSubmit = (String) request.getParameter("submit");
                if (valorSubmit.equals("Registrarse")) { 
                    //Se cargan los atributos para un usuario.
                    beanClientes.setCedula(request.getParameter("cedula"));
                    beanClientes.setNombre(request.getParameter("nombres"));
                    beanClientes.setApellido(request.getParameter("apellidos"));
                    beanClientes.setDireccion(request.getParameter("direccion"));
                    beanClientes.setTelefono(request.getParameter("telefono"));
                    //Se valida si el usuario fue insertado o no.
                    if (beanClientes.insertarCliente()== true) {
                        out.println("Se ha registrado correctamente");
                    } else {
                        out.println("No se insertó el cliente");
                    }              
                } else if (valorSubmit.equals("Eliminar")) {
                    beanClientes.setCedula(request.getParameter("codigoEliminar")); 
                    if (beanClientes.eliminarCliente()) {
                        out.print("Se ha Eliminado correctamente");
                    } else {
                        out.print("No se pudo eliminar");
                    }
                }
                    else if (valorSubmit.equals("Buscar")) {
                    out.print("Se entró a Buscar");                  
                    beanClientes.setCedula(request.getParameter("codigoModificar"));
                } 
                else if (valorSubmit.equals("Modificar")) {
                    beanClientes.setCedula(request.getParameter("cedulaMod"));
                    beanClientes.setNombre(request.getParameter("nombresMod"));
                    beanClientes.setApellido(request.getParameter("apellidosMod"));
                    beanClientes.setDireccion(request.getParameter("direccionMod"));
                    beanClientes.setTelefono(request.getParameter("telefonoMod"));
                    if (beanClientes.modificarCliente()) {
                        out.print("Se ha Modificado correctamente");
                    } else {
                        out.print("No se pudo Modificar");
                    }
                }           

            %>
           
        </jsp:useBean>
       
    </body>
</html>
