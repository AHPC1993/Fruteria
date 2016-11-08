<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Adminitración de clientes</title>
        <meta charset="utf-8">
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400" rel="stylesheet">

        <!--Script necesarios para las tab-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#tabs").tabs({
                    collapsible: true
                });
            });
        </script>

        <!--Utilizado para darle estilo a la tabla creada-->
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
    </script>

</head>
<body>
    <div id="tabs" style=" overflow: scroll; width: available" >
        <ul>
            <li><a href="#tabs-1">Ingresar cliente</a></li>
            <li><a href="#tabs-2">Eliminar cliente </a></li>
            <li><a href="#tabs-3">Modificar cliente</a></li>
            <li><a href="#tabs-4">Mostrar datos</a></li>
            <li><a href="#tabs-5">Menú principal</a></li>
        </ul>

        <div id="tabs-1">
            <center><article id="me" class="panel">
                    <form name="AddCliente" action="BeanAdminClientes.jsp" method="post" target="add" >        
                        <table>
                            <tr>
                                <td><B>Cédula </B><input id="cedula" name="cedula" type="text"  class="text" required="true" /> </td>
                                <td><B>Nombre</B> <input id="nombres"  name="nombres" type="text" class="text" required="true"/>   </td>                    
                            </tr>
                            <tr>
                                <td><B>Apellido</B> <input id="apellidos" name="apellidos" type="text"  class="text"  required="true"/>   </td>               
                                <td><B>Dirección</B> <input id="direccion" name="direccion" type="text" class="text" />   </td>               
                            </tr>
                            <tr>
                                <td><B>Teléfono</B> <input id="telefono"  name="telefono" type="text"  class="text" required="true"/></td>
                            </tr>
                        </table>                                    
                        <input  type="submit" name="submit" value="Registrarse"  class="button"/>
                    </form><iframe  name="add" width="250" height="250"></iframe>
                </article>
            </center>
        </div>
        <div id="tabs-2">
            <form name="eliminarCliente" action="BeanAdminClientes.jsp" method="post" target="eli">  
                Ingrese la cédula del cliente a eliminar
                <br>
                <input id="codigoEliminar" name="codigoEliminar" type="text" title="cédula" class="text"  /> 
                <br>
                <input type="submit" name="submit" value="Eliminar" class="button" />
            </form><iframe  name="eli" width="250" height="250"> </iframe>
        </div>                                                                                                         
        <div id="tabs-3">
            <form name="modificarCliente" action="FrmModificarClientes.jsp" target="mod" method="post">  
                Ingrese la cédula del cliente que desea modificar
                <br>
                <input id="cedulaModificar" name="cedulaModificar" type="text" placeholder="Cédula" class="text" required="true" />                                
                <br>                          
                <input type="submit" name="submit" value="Buscar" class="button" />
            </form><iframe  name="mod" width="1000" height="1000"> </iframe>

        </div>
        <div id="tabs-4">
            <%
                try {
                    controlador.Conexion conexion = new controlador.Conexion();
                    ResultSet rs = conexion.buscar("select * from tbl_clientes");
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
                    // conexion.getCon().close();
                } catch (Exception e) {
                    out.println("Excepcion " + e);
                }
            %>

        </div>
        <div id="tabs-5">
            <center>
                <b>Volver al menú principal</b>
                <br>
                <a href="../index.html">
                    <button>Volver al menú</button>
                </a>   
            </center>              
        </div>
    </div>
</body>
</html>
