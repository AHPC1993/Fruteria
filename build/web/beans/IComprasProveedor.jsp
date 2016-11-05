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
        <title>Realizar una compra a un proveedor</title>
        <meta charset="utf-8">
        <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400" rel="stylesheet">

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
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $(".controlgroup").controlgroup()
                $(".controlgroup-vertical").controlgroup({
                    "direction": "vertical"
                });
            });
        </script>

    </script>

</head>
<body>
    <form name="compraProveedor" action="BeanCompraProveedor.jsp" target="mod">  

        <fieldset>
            <legend>Realizar compra a un proveedor</legend>
            <div class="controlgroup">
                <%
                    try {
                        controlador.Conexion conexion = new controlador.Conexion();
                        ResultSet rs = conexion.buscar("select nombre, producto, precio from tbl_proveedores");
                        out.println("<select id='proveedores'>");
                        out.println("<optgroup label='Selecione un proovedor'>");
                        while (rs.next()) {
                            out.println(("<option value='" + rs.getObject("nombre") + "'>" + rs.getObject("nombre") + " - " + rs.getObject("producto") + " - " + rs.getObject("precio") + "</option>"));
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
                 <input type="submit" name="submit" value="Comprar" class="button" />
            </div>
        </fieldset>
    </form><iframe  name="mod" width="300" height="200"> </iframe>

    <br>
    <div>

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
