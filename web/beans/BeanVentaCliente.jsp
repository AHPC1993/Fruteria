
<%@page import="modelo.DAOVentas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="beanVenderProductos" scope="request" class="modelo.DAOVentas">
            <jsp:setProperty name="beanVenderProductos" property="*" />
            <%

                //Se trae el valor que tiene el submit(botón) y dependiendo de ello se hace una funcionalidad.
                String valorSubmit = (String) request.getParameter("submit");
                if (valorSubmit.equals("Vender")) {
                    //Se reciben los parámetros del nombre del producto que ofrece el proveedor y 
                    //la cantidad del producto que se va a comprar.
                    String nombreProducto = request.getParameter("productos");
                    String nombreCliente = request.getParameter("clientes");
                    int cantidadProducto = Integer.parseInt(request.getParameter("cantidadProducto"));
                    int precio = beanVenderProductos.precioProducto(nombreProducto);
                    int total = cantidadProducto * precio;
                    //Se guardan en el objeto los atributos necesarios para hacer una insersión.
                    beanVenderProductos.setCantidad(cantidadProducto);
                    beanVenderProductos.setCliente(nombreCliente);
                    beanVenderProductos.setProducto(nombreProducto);
                    beanVenderProductos.setPrecio(precio);
                    beanVenderProductos.setTotal(total);
                    //Se inserta la venta en la base de datos, si es correcta se muestra un mensaje al Usuario
                    if (beanVenderProductos.insertarVenta()) {
                        if(beanVenderProductos.actualizarCantidadProducto(nombreProducto, cantidadProducto)){
                        out.println("Se realizó la venta correctamente. " + beanVenderProductos.getPrecio());
                        out.println(cantidadProducto);
                        }
                    } else {
                        out.println("No Se realizó la venta correctamente. ");

                    }
                } 


            %>

        </jsp:useBean>

    </body>
</html>
