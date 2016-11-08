<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="beanComprarProductos" scope="request" class="modelo.DAOProductos">
            <jsp:setProperty name="beanComprarProductos" property="*" />
            <%

                //Se trae el valor que tiene el submit(botón) y dependiendo de ello se hace una funcionalidad.
                String valorSubmit = (String) request.getParameter("submit");
                if (valorSubmit.equals("Comprar")) {
                    //Se reciben los parámetros del nombre del producto que ofrece el proveedor y 
                    //la cantidad del producto que se va a comprar.
                    String nombreProducto = request.getParameter("proveedores");
                    String cantidadProducto = request.getParameter("cantidadProducto");
                    //Se verifica que el producto ya exista en la base de datos antes de actualizarlo
                    if (beanComprarProductos.verificarProducto(nombreProducto)) {
                        //Se valida que se actualice correctamente la cantidad.
                        if (beanComprarProductos.compraProductoProveedor(nombreProducto, cantidadProducto)) {
                            out.println("Se agregó la cantidad al producto existente correctamente ");
                        }
                        //Si el producto no existe, se inserta.
                    } else {
                        //Se guardan en el objeto productos el nombre y la cantidad
                        beanComprarProductos.setNombre(nombreProducto);
                        beanComprarProductos.setCantidad(Integer.parseInt(cantidadProducto));
                        //Se inserta el producto y se valida que haya sido exitoso el proceso de insersión
                        if (beanComprarProductos.insertarProducto()) {
                            out.println("Se hizo la compra del producto correctamente ");
                        }
                    }
                }


            %>

        </jsp:useBean>

    </body>
</html>
