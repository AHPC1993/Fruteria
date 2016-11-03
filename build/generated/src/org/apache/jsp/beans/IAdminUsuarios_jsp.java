package org.apache.jsp.beans;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;

public final class IAdminUsuarios_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Adminitración de clientes</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <link href=\"http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!--Script necesarios para las tab-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css\">\n");
      out.write("        <script src=\"//code.jquery.com/jquery-1.10.2.js\"></script>\n");
      out.write("        <script src=\"//code.jquery.com/ui/1.11.2/jquery-ui.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\n");
      out.write("        <script>\n");
      out.write("            $(function () {\n");
      out.write("                $(\"#tabs\").tabs({\n");
      out.write("                    collapsible: true\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <!--Utilizado para darle estilo a la tabla creada-->\n");
      out.write("        <style>\n");
      out.write("            table, th, td, tr {\n");
      out.write("                border: 1px solid black;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("            }\n");
      out.write("            th, td, tr {\n");
      out.write("                padding: 5px;\n");
      out.write("                text-align: left;    \n");
      out.write("            }\n");
      out.write("        </style>  \n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div id=\"tabs\" style=\" overflow: scroll; width: available\" >\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"#tabs-1\">Ingresar usuario</a></li>\n");
      out.write("            <li><a href=\"#tabs-2\">Eliminar usuario </a></li>\n");
      out.write("            <li><a href=\"#tabs-3\">Modificar usuario</a></li>\n");
      out.write("            <li><a href=\"#tabs-4\">Mostrar datos</a></li>\n");
      out.write("            <li><a href=\"#tabs-5\">Menú principal</a></li>\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("        <div id=\"tabs-1\">\n");
      out.write("            <center><article id=\"me\" class=\"panel\">\n");
      out.write("                    <form name=\"AddUsuarios\" action=\"BeanAdminUsuarios.jsp\" method=\"post\" target=\"add\" >        \n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"4u\">\n");
      out.write("                                <table>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td><B>Cédula</B><input id=\"cedula\" name=\"cedula\" type=\"text\"  class=\"text\" required=\"true\" /> </td>\n");
      out.write("                                        <td><B>Nombre</B> <input id=\"nombres\"  name=\"nombres\" type=\"text\" class=\"text\" required=\"true\"/>   </td>                    \n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td><B>Apellido</B> <input id=\"apellidos\" name=\"apellidos\" type=\"text\"  class=\"text\"  required=\"true\"/>   </td>               \n");
      out.write("                                        <td><B>Dirección</B> <input id=\"direccion\" name=\"direccion\" type=\"text\" class=\"text\" />   </td>               \n");
      out.write("\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td><B>Usuario</B> <input id=\"usuario\"  name=\"usuarior\" type=\"text\" title=\"Usuario\" class=\"text\" required=\"true\"/></td>\n");
      out.write("                                        <td><B>Contraseña</B> <input id=\"contrasena\"  name=\"contrasenar\" type=\"password\"  title=\"Contrasena\" class=\"text\" required=\"true\" /></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </table>                                    \n");
      out.write("                                <input  type=\"submit\" name=\"submit\" value=\"Registrarse\"  class=\"button\"/>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form><iframe  name=\"add\" width=\"250\" height=\"250\"></iframe>\n");
      out.write("                </article>\n");
      out.write("            </center>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"tabs-2\">\n");
      out.write("            <form name=\"eliminarUser\" action=\"BeanAdminUsuarios.jsp\" method=\"post\" target=\"eli\">  \n");
      out.write("                <div class=\"5grid\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"4u\"> \n");
      out.write("                            Ingrese la cédula del usuario a eliminar\n");
      out.write("                            <br>\n");
      out.write("                            <input id=\"codigoEliminar\" name=\"codigoEliminar\" type=\"text\" title=\"cédula\" class=\"text\"  /> \n");
      out.write("                        </div> \n");
      out.write("                        <br>\n");
      out.write("                    </div>     \n");
      out.write("                    <input type=\"submit\" name=\"submit\" value=\"Eliminar\" class=\"button\" />\n");
      out.write("                </div>\n");
      out.write("            </form><iframe  name=\"eli\" width=\"250\" height=\"250\"> </iframe>\n");
      out.write("        </div>                                                                                                         \n");
      out.write("        <div id=\"tabs-3\">\n");
      out.write("            <form name=\"modificarUser\" action=\"FrmModificarUsuarios.jsp\" target=\"mod\" method=\"post\">  \n");
      out.write("                <div class=\"5grid\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"4u\"> \n");
      out.write("                            Ingrese el nombre de usuario que desea modificar\n");
      out.write("                            <br>\n");
      out.write("                            <input id=\"usuarioModificar\" name=\"usuarioModificar\" type=\"text\" placeholder=\"Usuario\" class=\"text\" required=\"true\" />                                \n");
      out.write("                        </div> \n");
      out.write("                        <br>                          \n");
      out.write("                    </div>     \n");
      out.write("                    <input type=\"submit\" name=\"submit\" value=\"Buscar\" class=\"button\" />\n");
      out.write("                </div>                \n");
      out.write("            </form><iframe  name=\"mod\" width=\"1000\" height=\"1000\"> </iframe>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div id=\"tabs-4\">\n");
      out.write("            ");

                try {
                    controlador.Conexion conexion = new controlador.Conexion();
                    ResultSet rs = conexion.buscar("select * from tbl_usuarios");
                    out.println("<table id='datosUsuarios'><tr><th scope='col'>Cédula</th><th scope='col'>Nombre</th><th scope='col'>Apellido</th><th scope='col'>Dirección</th><th scope='col'>Usuario</th><th scope='col'>Contraseña</th></tr>");
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
                    // conexion.getCon().close();
                } catch (Exception e) {
                    out.println("Excepcion " + e);
                }
            
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div id=\"tabs-5\">\n");
      out.write("            <center>\n");
      out.write("                <b>Volver al menú principal</b>\n");
      out.write("                <br>\n");
      out.write("                <a href=\"../index.html\">\n");
      out.write("                    <button>Volver al menú</button>\n");
      out.write("                </a>   \n");
      out.write("            </center>              \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
