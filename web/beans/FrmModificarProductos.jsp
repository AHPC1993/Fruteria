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
        <jsp:useBean id="beanModProductos"  class="modelo.DAOProductos">
            <jsp:setProperty name="beanModProductos" property="*" />        
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
                    beanModProductos.setId(request.getParameter("idModificar"));
                    //Se consulta el usuario 
                    beanModProductos.consultarProductosArray();
                    ResultSet rs = st.executeQuery("select * from tbl_productos where id='" + beanModProductos.getId() + "';");
                    //Se valida que exista el id y se crea una tabla con el producto.
                    // Ponemos los resultados en un table de html
                    out.println("<table id='datosProductos'><tr><th scope='col'>Id</th><th scope='col'>Nombre</th><th scope='col'>Precio</th><th scope='col'>Cantidad</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getObject("id") + "</td>");
                        out.println("<td>" + rs.getObject("nombre") + "</td>");
                        out.println("<td>" + rs.getObject("precio") + "</td>");
                        out.println("<td>" + rs.getObject("cantidad") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                    conexion.getConexion().close();
                }

            %>


            <form name="ModUsuarios" action="BeanAdminProductos.jsp" method="post" target="mod" >        
                <table>
                    <tr>
                        <td><B>Id    </B><input id="idMod" name="idMod" value="<%=beanModProductos.consultarProductosArray().get(0).toString()%>" type="text" class="text"  readonly="true"/> </td>
                        <td><B>Nombre</B> <input id="nombreMod"  name="nombreMod" value="<%=beanModProductos.consultarProductosArray().get(1).toString()%>" type="text"  class="text" />   </td>                    
                    </tr>
                    <tr>
                        <td><B>Precio</B> <input id="precioMod" name="precioMod" value="<%=beanModProductos.consultarProductosArray().get(2).toString()%>" type="text"  class="text"  />   </td>               
                        <td><B>Cantidad</B> <input id="cantidadMod"  name="cantidadMod" value="<%=beanModProductos.consultarProductosArray().get(3).toString()%>" type="text" class="text" /></td>
                    </tr>
                </table> 
                <input  type="submit" name="submit" value="Modificar" class="button" />
            </form><iframe  name="mod" width="100" height="200"> </iframe>
            </jsp:useBean>  
    </body>
</html>
