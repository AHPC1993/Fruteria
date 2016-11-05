/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;

/**
 *
 * @author allan
 */
public class DAOProductos extends Productos {

    controlador.Conexion conectar;

    public DAOProductos() {
        conectar = new controlador.Conexion();
    }

    /**
     * Método encargado de insertar productos en la base de datos del sistema.
     *
     * @return
     */
    public boolean insertarProducto() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_INSERTAR = "INSERT INTO tbl_productos(id, nombre, precio, cantidad) VALUES (" + "'" + super.getId()+ "','" + super.getNombre() + "','" + super.getPrecio()+ "','" + super.getCantidad()+  "');";
        System.out.println(SQL_INSERTAR);
        boolean resultado = conectar.insertarSql(SQL_INSERTAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de eliminar un producto.
     *
     * @return
     */
    public boolean eliminarProducto() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_ELIMINAR = "DELETE FROM tbl_productos WHERE UPPER(id) = UPPER('" + super.getId()+ "');";
        boolean resultado= conectar.eliminar(SQL_ELIMINAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de modificar un producto.
     *
     * @return
     */
    public boolean modificarProducto() throws SQLException {
        conectar = new controlador.Conexion();
     
           final String SQL_ACTUALIZAR = "UPDATE  tbl_productos SET nombre='" + super.getNombre()+ "', precio='" + super.getPrecio()+ "', cantidad='" + super.getCantidad() + "' WHERE id='" + super.getId()+ "'";
            boolean resultado =  conectar.actualizar(SQL_ACTUALIZAR);
             conectar.cerrarConexion();
             return resultado;
    }


    /**
     * Consulta un producto en específico y lo devuelve en forma de lista.
     *
     * @return
     */
    public java.util.ArrayList consultarProductosArray() {
        String sql = "SELECT * FROM tbl_productos WHERE id='" + super.getId()+ "'";
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
