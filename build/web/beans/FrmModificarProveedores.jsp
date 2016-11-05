<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table, th, td, tr {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td, tr {
                padding: 5px;
                text-align: left;    
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="beanModProveedores"  class="modelo.DAOProveedores">
            <jsp:setProperty name="beanModProveedores" property="*" />        
            <%
                //Se carga el valor que tiene el submit.
                String valorSubmit = (String) request.getParameter("submit");
                //Cuando el submit tiene el valor Buscar 
                if (valorSubmit.equals("Buscar")) {
                    //Se abre una conexión a la base de datos 
                    controlador.Conexion conexion = new controlador.Conexion();
                    conexion.conectar();
                    Statement st = conexion.getConexion().createStatement();
                    //Se guarda el id del producto que se quiere modificar
                    beanModProveedores.setNit(request.getParameter("nitModificar"));
                    //Se consulta el usuario 
                    try {
                        beanModProveedores.consultarProveedoresArray();
                        ResultSet rs = st.executeQuery("select * from tbl_proveedores where nit='" + beanModProveedores.getNit() + "';");
                        //Se valida que exista el id y se crea una tabla con el producto.
                        // Ponemos los resultados en un table de html
                        out.println("<table id='datosProveedores'><tr><th scope='col'>Nit</th><th scope='col'>Nombre</th><th scope='col'>Dirección</th><th scope='col'>Teléfono</th><th scope='col'>Producto</th><th scope='col'>Precio</th></tr>");
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getObject("nit") + "</td>");
                            out.println("<td>" + rs.getObject("nombre") + "</td>");
                            out.println("<td>" + rs.getObject("direccion") + "</td>");
                            out.println("<td>" + rs.getObject("telefono") + "</td>");
                            out.println("<td>" + rs.getObject("producto") + "</td>");
                            out.println("<td>" + rs.getObject("precio") + "</td>");
                            out.println("</tr>");
                        }
                        out.println("</table>");
                        conexion.getConexion().close();
                    } catch (Exception e) {
                        out.println("Excepcion " + e);
                    }
                }

            %>


            <form name="ModUsuarios" action="BeanAdminProductos.jsp" method="post" target="mod" >        
                <table>
                    <tr>
                        <td><B>Id    </B><input id="nitMod" name="nitMod" value="<%=beanModProveedores.consultarProveedoresArray().get(0).toString()%>" type="text" class="text"  readonly="true"/> </td>
                        <td><B>Nombre</B> <input id="nombreMod"  name="nombreMod" value="<%=beanModProveedores.consultarProveedoresArray().get(1).toString()%>" type="text"  class="text" />   </td>                    
                    </tr>
                    <tr>
                        <td><B>Dirección</B> <input id="direccionMod" name="direccionMod" value="<%=beanModProveedores.consultarProveedoresArray().get(2).toString()%>" type="text"  class="text"  />   </td>               
                        <td><B>Teléfono</B> <input id="telefonoMod"  name="telefonoMod" value="<%=beanModProveedores.consultarProveedoresArray().get(3).toString()%>" type="text" class="text" /></td>
                    </tr>
                    <tr>
                        <td><B>Producto</B> <input id="productoMod" name="productoMod" value="<%=beanModProveedores.consultarProveedoresArray().get(4).toString()%>" type="text"  class="text"  />   </td>               
                        <td><B>Precio</B> <input id="precioMod"  name="precioMod" value="<%=beanModProveedores.consultarProveedoresArray().get(5).toString()%>" type="text" class="text" /></td>
                    </tr>
                </table> 
                <input  type="submit" name="submit" value="Modificar" class="button" />
            </form><iframe  name="mod" width="100" height="200"> </iframe>
            </jsp:useBean>  
    </body>
</html>
