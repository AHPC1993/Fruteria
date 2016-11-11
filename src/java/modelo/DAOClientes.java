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
public class DAOClientes extends Clientes {

    controlador.Conexion conectar;

    public DAOClientes() {
        conectar = new controlador.Conexion();
    }

    /**
     * Método encargado de insertar clientes en la base de datos del sistema.
     *
     * @return
     */
    public boolean insertarCliente() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_INSERTAR = "INSERT INTO tbl_clientes(cedula, nombres, apellidos, direccion, telefono) VALUES (" + "'" + super.getCedula() + "','" + super.getNombre() + "','" + super.getApellido() + "','" + super.getDireccion() + "','" + super.getTelefono() + "');";
        System.out.println("Estoy en el insertar usuario");
        System.out.println(SQL_INSERTAR);
        boolean resultado = conectar.insertarSql(SQL_INSERTAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de eliminar un cliente.
     *
     * @return
     */
    public boolean eliminarCliente() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_ELIMINAR = "DELETE FROM tbl_clientes WHERE UPPER(cedula) = UPPER('" + super.getCedula() + "');";
        boolean resultado= conectar.eliminar(SQL_ELIMINAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de modificar un cliente.
     *
     * @return
     */
    public boolean modificarCliente() throws SQLException {
        conectar = new controlador.Conexion();     
            final String SQL_ACTUALIZAR = "UPDATE  tbl_clientes SET nombres='" + super.getNombre() + "', apellidos='" + super.getApellido() + "', direccion='" + super.getDireccion() + "', telefono='" + super.getTelefono()+ "' WHERE cedula='" + super.getCedula()+ "'";
            boolean resultado =  conectar.actualizar(SQL_ACTUALIZAR);
             conectar.cerrarConexion();
             return resultado;
    }




    /**
     * Consulta un usuario en específico y lo devuelve en forma de lista.
     *
     * @return
     */
    public java.util.ArrayList consultarClientesArray() {
        String sql = "SELECT * FROM tbl_clientes WHERE cedula='" + super.getCedula()+ "'";
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
