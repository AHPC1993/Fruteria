<%@page import="modelo.DAOVentas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Realizar una venta a un cliente</title>
        <meta charset="utf-8">
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400" rel="stylesheet">
        <script src = "https://code.jquery.com/jquery-1.12.4.js" ></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!--Script necesarios para las tab-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <style>
            .ui-controlgroup-vertical {
                width: 150px;
            }
            .ui-controlgroup.ui-controlgroup-vertical > button.ui-button,
            .ui-controlgroup.ui-controlgroup-vertical > .ui-controlgroup-label {
                text-align: center;
            }
            #car-type-button {
                width: 120px;
            }
            .ui-controlgroup-horizontal .ui-spinner-input {
                width: 20px;
            }
        </style>
        <script 

        <script>
            $(function () {
                $(".controlgroup").controlgroup()
                $(".controlgroup-vertical").controlgroup({
                    "direction": "vertical"
                });
            });
            </script>

            <script>
                $(function () {
                    $("#tabs").tabs();
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
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">Realizar venta</a></li>
                <li><a href="#tabs-2">Historial de ventas</a></li>
            </ul>
            <div id="tabs-1">
                <form name="compraProveedor" action="BeanVentaCliente.jsp" target="mod">  
                    <fieldset>
                        <legend>Realizar venta a un cliente</legend>
                        <div class="controlgroup">
                            <%
                                DAOVentas ventas = new DAOVentas();

                                try {
                                    controlador.Conexion conexion = new controlador.Conexion();
                                    ResultSet rs = conexion.buscar("select nombre, precio from tbl_productos");
                                    out.println("<select id='productos' name='productos'>");
                                    out.println("<optgroup label='Selecione un producto'>");
                                    while (rs.next()) {
                                        out.println(("<option value='" + rs.getObject("nombre") + "'>" + rs.getObject("nombre") + " - " + rs.getObject("precio") + "</option>"));
                                    }
                                    out.println("</optgroup>");
                                    out.println("</select>");
                                    // conexion.getCon().close();
                                } catch (Exception e) {
                                    out.println("Excepcion " + e);
                                }

                                try {
                                    controlador.Conexion conexion = new controlador.Conexion();
                                    ResultSet rs = conexion.buscar("select cedula, nombres, apellidos from tbl_clientes");
                                    out.println("<select id='clientes' name='clientes'>");
                                    out.println("<optgroup label='Selecione un cliente'>");
                                    while (rs.next()) {
                                        out.println(("<option value='" + rs.getObject("cedula") + "'>" + rs.getObject("cedula") + " - " + rs.getObject("nombres") + " - " + rs.getObject("apellidos") + "</option>"));
                                    }
                                    out.println("</optgroup>");
                                    out.println("</select>");
                                    // conexion.getCon().close();
                                } catch (Exception e) {
                                    out.println("Excepcion " + e);
                                }
                            %>
                            <label for="cantidadProducto" class="ui-controlgroup-label">Cantidad</label>
                            <input id="cantidadProducto" name="cantidadProducto" class="ui-spinner-input" required="true">
                            <input type="submit" name="submit" value="Vender" class="button" />
                        </div>
                    </fieldset>
                </form><iframe  name="mod" width="300" height="200"> </iframe>
            </div>
            <div id="tabs-2">
                <%
                    try {
                        controlador.Conexion conexion = new controlador.Conexion();
                        ResultSet rs = conexion.buscar("select * from tbl_ventas");
                        out.println("<table id='datosVentas'><tr><th scope='col'>Producto</th><th scope='col'>Cliente</th><th scope='col'>Cantidad</th><th scope='col'>Precio Unidad</th><th scope='col'>Total</th></tr>");
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getObject("producto") + "</td>");
                            out.println("<td>" + rs.getObject("cliente") + "</td>");
                            out.println("<td>" + rs.getObject("cantidad") + "</td>");
                            out.println("<td>" + rs.getObject("precio") + "</td>");
                            out.println("<td>" + rs.getObject("total") + "</td>");
                            out.println("</tr>");
                        }
                        out.println("</table>");
                        // conexion.getCon().close();
                    } catch (Exception e) {
                        out.println("Excepcion " + e);
                    }
                %>
            </div>

            <br>
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
