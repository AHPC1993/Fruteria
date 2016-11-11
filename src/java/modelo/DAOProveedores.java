/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;

/**
 *
 * @author 
 */
public class DAOProveedores extends Proveedores {

    controlador.Conexion conectar;

    public DAOProveedores() {
        conectar = new controlador.Conexion();
    }

    /**
     * Método encargado de insertar productos en la base de datos del sistema.
     *
     * @return
     */
    public boolean insertarProveedor() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_INSERTAR = "INSERT INTO tbl_proveedores(nit, nombre, direccion, telefono, producto, precio) VALUES (" + "'" + super.getNit() + "','" + super.getNombre() + "','" + super.getDireccion() + "','" + super.getTelefono() + "','" + super.getProducto() + "','" + super.getPrecio() + "');";
        boolean resultado = conectar.insertarSql(SQL_INSERTAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de eliminar un proveedor.
     *
     * @return
     */
    public boolean eliminarProveedor() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_ELIMINAR = "DELETE FROM tbl_proveedores WHERE UPPER(nit) = UPPER('" + super.getNit() + "');";
        boolean resultado = conectar.eliminar(SQL_ELIMINAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de modificar un proveedor.
     *
     * @return
     */
    public boolean modificarProveedor() throws SQLException {
        conectar = new controlador.Conexion();

        final String SQL_ACTUALIZAR = "UPDATE  tbl_proveedores SET nombre='" + super.getNombre() + "', direccion='" + super.getDireccion() + "', telefono='" + super.getTelefono() + "', producto='" + super.getProducto() + "', precio='" + super.getPrecio() + "' WHERE nit='" + super.getNit() + "'";
        boolean resultado = conectar.actualizar(SQL_ACTUALIZAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Consulta un proveedor en específico y lo devuelve en forma de lista.
     *
     * @return
     */
    public java.util.ArrayList consultarProveedoresArray() {
        String sql = "SELECT * FROM tbl_proveedores WHERE nit='" + super.getNit()+ "'";
        java.util.ArrayList resultado = new java.util.ArrayList();
        java.sql.ResultSet rs = null;
        try {
            rs = conectar.buscar(sql);
            if (rs.next()) {
                resultado.add(rs.getString(1));
                resultado.add(rs.getString(2));
                resultado.add(rs.getString(3));
                resultado.add(rs.getString(4));
                resultado.add(rs.getString(5));
                resultado.add(rs.getString(6));
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
