/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author
 */
public class DAOVentas extends Ventas {

    controlador.Conexion conectar;

    public DAOVentas() {
        conectar = new controlador.Conexion();
    }

    /**
     * Método encargado de insertar una venta en la base de datos del sistema.
     *
     * @return
     */
    public boolean insertarVenta() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_INSERTAR = "INSERT INTO tbl_ventas(id, producto, cliente, cantidad, precio, total) VALUES (NULL,'" + super.getProducto() + "','" + super.getCliente() + "','" + super.getCantidad() + "','" + super.getPrecio() + "','" + super.getTotal() + "');";
        System.out.println(SQL_INSERTAR);
        boolean resultado = conectar.insertarSql(SQL_INSERTAR);
        conectar.cerrarConexion();
        return resultado;
    }
    
        /**
     * Método encargado de actualizar la cantidad de un producto al realizar una venta.
     *
     * @return
     */
    public boolean actualizarCantidadProducto(String nombreProducto, int cantidad) throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_ACTUALIZAR = "UPDATE  tbl_productos SET cantidad=cantidad-'" + cantidad + "' WHERE nombre='" + nombreProducto + "'";
        System.out.println(SQL_ACTUALIZAR);
        boolean resultado = conectar.insertarSql(SQL_ACTUALIZAR);
        conectar.cerrarConexion();
        return resultado;
    }


    /**
     * Método encargado de devolver el precio de un producto específico.
     *
     * @param producto
     * @return
     */
    public int precioProducto(String producto) throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_PRECIO_PRODUCTO = "SELECT precio FROM tbl_productos where nombre='" + producto + "' LIMIT 1";
        ResultSet resultado = null;
        resultado = conectar.buscar(SQL_PRECIO_PRODUCTO);
        if (resultado.next()) {
            return Integer.parseInt(resultado.getString(1));
        }
        return 0;
    }

    /**
     * Método encargado de verificar que un producto exista.
     *
     * @param producto
     * @return
     */
    public boolean verificarProducto(String producto) {
        final String SQL_VERIFICAR_PRODUCTO = "SELECT * FROM tbl_productos where nombre='" + producto + "'";
        return conectar.verificar(SQL_VERIFICAR_PRODUCTO);
    }

    /**
     * Método encargado de actualizar la cantidad existente de un producto a
     * través de la compra a un proveedor.
     *
     * @return
     */
    public boolean compraProductoProveedor(String nombre, String cantidad) throws SQLException {
        conectar = new controlador.Conexion();

        final String SQL_ACTUALIZAR = "UPDATE  tbl_productos SET cantidad=cantidad+'" + cantidad + "' WHERE nombre='" + nombre + "'";
        boolean resultado = conectar.actualizar(SQL_ACTUALIZAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Consulta un producto en específico y lo devuelve en forma de lista.
     *
     * @return
     */
    public java.util.ArrayList consultarVentasArray() {
        String sql = "SELECT * FROM tbl_ventas WHERE producto='" + super.getProducto() + "'";
        java.util.ArrayList resultado = new java.util.ArrayList();
        java.sql.ResultSet rs = null;
        try {
            rs = conectar.buscar(sql);
            if (rs.next()) {
                resultado.add(rs.getString(1));
                resultado.add(rs.getString(2));
                resultado.add(rs.getString(3));
                resultado.add(rs.getString(4));
                return resultado;

            } else {
                return null;
            }
        } catch (Exception e) {

            System.out.println("Error consultando: " + e);
            return null;
        }
    }
}
