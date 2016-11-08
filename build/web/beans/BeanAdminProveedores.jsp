
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="beanProveedores" scope="request" class="modelo.DAOProveedores">
            <jsp:setProperty name="beanProveedores" property="*" />
            <%
                //Se trae el valor que tiene el submit(botón) y dependiendo de ello se hace una funcionalidad.
                String valorSubmit = (String) request.getParameter("submit");
                if (valorSubmit.equals("Registrarse")) {
                    //Se cargan los atributos para un usuario.
                    beanProveedores.setNit(request.getParameter("nit"));
                    beanProveedores.setNombre(request.getParameter("nombre"));
                    beanProveedores.setDireccion(request.getParameter("direccion"));
                    beanProveedores.setTelefono(request.getParameter("telefono"));
                    beanProveedores.setProducto(request.getParameter("producto"));
                    beanProveedores.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    //Se valida si el proveedor fue insertado o no.
                    if (beanProveedores.insertarProveedor()== true) {
                        out.println("Se ha registrado correctamente");
                    } else {
                        out.println("No se insertó el cliente");
                    }
                } else if (valorSubmit.equals("Eliminar")) {
                    beanProveedores.setNit(request.getParameter("codigoEliminar"));
                    if (beanProveedores.eliminarProveedor()) {
                        out.print("Se ha Eliminado correctamente");
                    } else {
                        out.print("No se pudo eliminar");
                    }
                } else if (valorSubmit.equals("Buscar")) {
                    out.print("Se entró a Buscar");
                    beanProveedores.setNit(request.getParameter("codigoModificar"));
                } else if (valorSubmit.equals("Modificar")) {
                    beanProveedores.setNit(request.getParameter("nitMod"));
                    beanProveedores.setNombre(request.getParameter("nombreMod"));
                    beanProveedores.setDireccion(request.getParameter("direccionMod"));
                    beanProveedores.setTelefono(request.getParameter("telefonoMod"));
                    beanProveedores.setProducto(request.getParameter("productoMod"));
                    beanProveedores.setPrecio(Integer.parseInt(request.getParameter("precioMod")));
                    if (beanProveedores.modificarProveedor()) {
                        out.print("Se ha Modificado correctamente");
                    } else {
                        out.print("No se pudo Modificar");
                    }
                }

            %>

        </jsp:useBean>

    </body>
</html>
