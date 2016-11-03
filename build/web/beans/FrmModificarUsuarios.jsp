<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../js/jquery-1.9.1.min.js"></script>
        <script src="../../css/5grid/init.js?use=mobile,desktop"></script>
        <script src="../../js/jquery.formerize-1.1.js"></script>
        <script src="../../js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="../../css/5grid/core.css">
        <link rel="stylesheet" href="../../css/5grid/core-desktop.css">
        <link rel="stylesheet" href="../../css/5grid/core-1200px.css">
        <link rel="stylesheet" href="../../css/5grid/core-noscript.css">
        <link rel="stylesheet" href="../../css/style.css">
        <link rel="stylesheet" href="../../css/style-desktop.css">
        <link rel="stylesheet" href="../../css/noscript.css">
        </noscript>

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
        <jsp:useBean id="beanModUsuarios"  class="modelo.DAOUsuarios">
            <jsp:setProperty name="beanModUsuarios" property="*" />        
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
                    beanModUsuarios.setUsuario(request.getParameter("usuarioModificar"));
                    out.println(beanModUsuarios.getUsuario());
                    //Se consulta el usuario 
                    beanModUsuarios.consultarUsuariosArray();
                    ResultSet rs = st.executeQuery("select * from tbl_usuarios where usuario='" + beanModUsuarios.getUsuario() + "';");
                    //Se valida que exista el usuario y se crea una tabla con el usuario.
                    if(rs.next()){
                   // Ponemos los resultados en un table de html
                    out.println("<table id='datosUsuarios'><tr><th scope='col'>Cédula</th><th scope='col'>Nombre</th><th scope='col'>Apellido</th><th scope='col'>Dirección</th><th scope='col'>usuario</th><th scope='col'>Contrasena</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getObject("cedula") + "</td>");
                        out.println("<td>" + rs.getObject("nombres") + "</td>");
                        out.println("<td>" + rs.getObject("apellidos") + "</td>");
                        out.println("<td>" + rs.getObject("direccion") + "</td>");
                        out.println("<td>" + rs.getObject("usuario") + "</td>");
                        out.println("<td>" + rs.getObject("contrasena") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                    out.println("\n");
                    conexion.getConexion().close();
                    }else{
                        out.println("No existe el usuario");
                    }
                }
            %>


            <form name="ModUsuarios" action="BeanAdminUsuarios.jsp" method="post" target="mod" >        
                <div class="row">
                    <div class="4u"> 
                        <table>
                            <tr>
                                <td><B>Cédula</B><input id="cedulaMod" name="cedulaMod" value="<%=beanModUsuarios.consultarUsuariosArray().get(0).toString()%>" type="text" title="Cédula usuario" class="text"  /> </td>
                                <td><B>Nombre</B> <input id="nombresMod"  name="nombresMod" value="<%=beanModUsuarios.consultarUsuariosArray().get(1).toString()%>" type="text"  title="Nombre" class="text" />   </td>                    
                            </tr>
                            <tr>
                                <td><B>Apellido</B> <input id="apellidosMod" name="apellidosMod" value="<%=beanModUsuarios.consultarUsuariosArray().get(2).toString()%>" type="text" title="Apellidos" class="text"  />   </td>               
                                <td><B>Dirección</B> <input id="direccionMod"  name="direccionMod" value="<%=beanModUsuarios.consultarUsuariosArray().get(3).toString()%>" type="text" title="Dirección de residencia" class="text" /></td>
                            </tr>
                            <tr>
                                <td><B>Usuario</B> <input id="usuarioMod"  name="usuarioMod" value="<%=beanModUsuarios.getUsuario()%>" type="text "  title="Usuario" class="text" readonly="true"/></td>
                                <td><B>Contraseña</B> <input id="contrasenaMod"  name="contrasenaMod" value="<%=beanModUsuarios.consultarUsuariosArray().get(5).toString()%>" type="password"  title="contraseña" class="text" /></td>
                            </tr>
                        </table> 
                        <input  type="submit" name="submit" value="Modificar" class="button" />
                    </div>
                </div>
            </form><iframe  name="mod" width="100" height="200"> </iframe>
            </jsp:useBean>  
    </body>
</html>
