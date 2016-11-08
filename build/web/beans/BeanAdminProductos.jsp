
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="beanProductos" scope="request" class="modelo.DAOProductos">
            <jsp:setProperty name="beanProductos" property="*" />
            <%
                //Se trae el valor que tiene el submit(botón) y dependiendo de ello se hace una funcionalidad.
                String valorSubmit = (String) request.getParameter("submit");
                if (valorSubmit.equals("Registrarse")) { 
                    //Se cargan los atributos para un usuario.
                    beanProductos.setId(request.getParameter("id"));
                    beanProductos.setNombre(request.getParameter("nombre"));
                    beanProductos.setPrecio(Integer.parseInt(request.getParameter("precio")));
                    beanProductos.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
                    //Se valida si el usuario fue insertado o no.
                    if (beanProductos.insertarProducto()== true) {
                        out.println("Se ha registrado correctamente");
                    } else {
                        out.println("No se insertó el cliente");
                    }              
                } else if (valorSubmit.equals("Eliminar")) {
                    beanProductos.setId(request.getParameter("codigoEliminar")); 
                    if (beanProductos.eliminarProducto()) {
                        out.print("Se ha Eliminado correctamente");
                    } else {
                        out.print("No se pudo eliminar");
                    }
                }
                    else if (valorSubmit.equals("Buscar")) {
                    out.print("Se entró a Buscar");                  
                    beanProductos.setId(request.getParameter("codigoModificar"));
                } 
                else if (valorSubmit.equals("Modificar")) {
                    beanProductos.setId(request.getParameter("cedulaMod"));
                    beanProductos.setNombre(request.getParameter("nombreMod"));
                    beanProductos.setPrecio(Integer.parseInt(request.getParameter("precioMod")));
                    beanProductos.setCantidad(Integer.parseInt(request.getParameter("cantidadMod")));
                    if (beanProductos.modificarProducto()) {
                        out.print("Se ha Modificado correctamente");
                    } else {
                        out.print("No se pudo Modificar");
                    }
                }           

            %>
           
        </jsp:useBean>
       
    </body>
</html>
