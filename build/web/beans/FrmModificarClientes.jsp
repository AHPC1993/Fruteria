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
        <jsp:useBean id="beanModClientes"  class="modelo.DAOClientes">
            <jsp:setProperty name="beanModClientes" property="*" />        
            <%
                //Se carga el valor que tiene el submit.
                String valorSubmit = (String) request.getParameter("submit");
                //Cuando el submit tiene el valor Buscar 
                if (valorSubmit.equals("Buscar")) {
                    //Se abre una conexión a la base de datos 
                    controlador.Conexion conexion = new controlador.Conexion();
                    conexion.conectar();
                    Statement st = conexion.getConexion().createStatement();
                    //Se guarda el usuario que se quiere modificar
                    beanModClientes.setCedula(request.getParameter("cedulaModificar"));
                    //Se consulta el usuario 
                    beanModClientes.consultarClientesArray();
                    ResultSet rs = st.executeQuery("select * from tbl_clientes where cedula='" + beanModClientes.getCedula() + "';");
                    //Se valida que exista el usuario y se crea una tabla con el usuario.
                    // Ponemos los resultados en un table de html
                    out.println("<table id='datosClientes'><tr><th scope='col'>Cédula</th><th scope='col'>Nombre</th><th scope='col'>Apellido</th><th scope='col'>Dirección</th><th scope='col'>Teléfono</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getObject("cedula") + "</td>");
                        out.println("<td>" + rs.getObject("nombres") + "</td>");
                        out.println("<td>" + rs.getObject("apellidos") + "</td>");
                        out.println("<td>" + rs.getObject("direccion") + "</td>");
                        out.println("<td>" + rs.getObject("telefono") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                    conexion.getConexion().close();
                }

            %>


            <form name="ModUsuarios" action="BeanAdminClientes.jsp" method="post" target="mod" >        
                <table>
                    <tr>
                        <td><B>Cédula</B><input id="cedulaMod" name="cedulaMod" value="<%=beanModClientes.consultarClientesArray().get(0).toString()%>" type="text" class="text"  readonly="true"/> </td>
                        <td><B>Nombre</B> <input id="nombresMod"  name="nombresMod" value="<%=beanModClientes.consultarClientesArray().get(1).toString()%>" type="text"  class="text" />   </td>                    
                    </tr>
                    <tr>
                        <td><B>Apellido</B> <input id="apellidosMod" name="apellidosMod" value="<%=beanModClientes.consultarClientesArray().get(2).toString()%>" type="text"  class="text"  />   </td>               
                        <td><B>Dirección</B> <input id="direccionMod"  name="direccionMod" value="<%=beanModClientes.consultarClientesArray().get(3).toString()%>" type="text" class="text" /></td>
                    </tr>
                    <tr>
                        <td><B>Teléfono</B> <input id="usuarioMod"  name="telefonoMod" value="<%=beanModClientes.consultarClientesArray().get(4).toString()%>" type="text "   class="text"/></td>
                    </tr>
                </table> 
                <input  type="submit" name="submit" value="Modificar" class="button" />
            </form><iframe  name="mod" width="100" height="200"> </iframe>
            </jsp:useBean>  
    </body>
</html>
