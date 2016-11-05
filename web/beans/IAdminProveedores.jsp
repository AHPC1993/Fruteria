<%-- 
    Document   : IAdminOperarios
    Created on : 11/11/2014, 02:08:49 PM
    Author     : allan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Adminitración de proveedores</title>
        <meta charset="utf-8">
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400" rel="stylesheet">

        <!--Script necesarios para las tab-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
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
            <li><a href="#tabs-1">Ingresar proveedor</a></li>
            <li><a href="#tabs-2">Eliminar proveedor </a></li>
            <li><a href="#tabs-3">Modificar proveedor</a></li>
            <li><a href="#tabs-4">Mostrar datos</a></li>
            <li><a href="#tabs-5">Menú principal</a></li>
        </ul>

        <div id="tabs-1">
            <center><article id="me" class="panel">
                    <form name="AddProveedor" action="BeanAdminProveedores.jsp" method="post" target="add" >        
                        <table>
                            <tr>
                                <td><B>nit   </B><input id="nit" name="nit" type="text"  class="text" required="true" /> </td>
                                <td><B>Nombre</B> <input id="nombre"  name="nombre" type="text" class="text" required="true"/>   </td>                    
                            </tr>
                            <tr>
                                <td><B>Dirección</B> <input id="direccion" name="direccion" type="text"  class="text"  required="true"/>   </td>               
                                <td><B>Teléfono</B> <input id="telefono" name="telefono" type="text" class="text" />   </td>               
                            </tr>
                            <tr>
                                <td><B>Producto</B> <input id="producto" name="producto" type="text"  class="text"  required="true"/>   </td>               
                                <td><B>Precio</B> <input id="precio" name="precio" type="text" class="text" required="true"/>   </td>               
                            </tr>
                        </table>                                    
                        <input  type="submit" name="submit" value="Registrarse"  class="button"/>
                    </form><iframe  name="add" width="250" height="250"></iframe>
                </article>
            </center>
        </div>
        <div id="tabs-2">
            <form name="eliminarProveedor" action="BeanAdminProveedores.jsp" method="post" target="eli">  
                Ingrese el nit del proveedor a eliminar
                <br>
                <input id="codigoEliminar" name="codigoEliminar" type="text" title="Nit" class="text"  /> 
                <br>
                <input type="submit" name="submit" value="Eliminar" class="button" />
            </form><iframe  name="eli" width="250" height="250"> </iframe>
        </div>                                                                                                         
        <div id="tabs-3">
            <form name="modificarProveedor" action="FrmModificarProveedores.jsp" target="mod" method="post">  
                Ingrese el nit del proveedor a modificar
                <br>
                <input id="nitModificar" name="nitModificar" type="text" placeholder="Id" class="text" required="true" />                                
                <br>                          
                <input type="submit" name="submit" value="Buscar" class="button" />
            </form><iframe  name="mod" width="1000" height="1000"> </iframe>

        </div>
        <div id="tabs-4">
            <%
                try {
                    controlador.Conexion conexion = new controlador.Conexion();
                    ResultSet rs = conexion.buscar("select * from tbl_proveedores");
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
