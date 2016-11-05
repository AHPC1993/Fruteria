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
public class DAOUsuarios extends Usuarios {

    controlador.Conexion conectar;

    public DAOUsuarios() {
        conectar = new controlador.Conexion();
    }

    /**
     * Método encargado de insertar usuarios en la base de datos del sistema.
     *
     * @return
     */
    public boolean insertarUsuario() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_INSERTAR = "INSERT INTO tbl_usuarios(cedula, nombres, apellidos, direccion, usuario, contrasena) VALUES (" + "'" + super.getCedula() + "','" + super.getNombre() + "','" + super.getApellido() + "','" + super.getDireccion() + "','" + super.getUsuario() + "','" + super.getContrasena() + "');";
        System.out.println("Estoy en el insertar usuario");
        System.out.println(SQL_INSERTAR);
        boolean resultado = conectar.insertarSql(SQL_INSERTAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de eliminar un usuario.
     *
     * @return
     */
    public boolean eliminarUsuario() throws SQLException {
        conectar = new controlador.Conexion();
        final String SQL_ELIMINAR = "DELETE FROM tbl_usuarios WHERE UPPER(cedula) = UPPER('" + super.getCedula() + "');";
        boolean resultado= conectar.eliminar(SQL_ELIMINAR);
        conectar.cerrarConexion();
        return resultado;
    }

    /**
     * Método encargado de modificar un usuario.
     *
     * @return
     */
    public boolean modificarUsuario() throws SQLException {
        conectar = new controlador.Conexion();
        if (verificarUsuario(super.getUsuario()) == true) {
           final String SQL_ACTUALIZAR = "UPDATE  tbl_usuarios SET cedula='" + super.getCedula() + "', nombres='" + super.getNombre() + "', apellidos='" + super.getApellido() + "', direccion='" + super.getDireccion() + "', contrasena='" + super.getContrasena()  + "' WHERE usuario='" + super.getUsuario() + "'";
            boolean resultado =  conectar.actualizar(SQL_ACTUALIZAR);
             conectar.cerrarConexion();
             return resultado;
        }
        return false;
    }

    /**
     * Método encargado de verificar que un usuario exista.
     *
     * @return
     */
    public boolean verificarUsuario(String usuario) {
        final String SQL_VERIFICAR_USUARIO = "SELECT * FROM tbl_usuarios where usuario='" + usuario + "'";
        return conectar.verificar(SQL_VERIFICAR_USUARIO);
    }

    /**
     * Método encargado de verificar la contraseña de un usuario.
     *
     * @return
     */
    public boolean verificarContrasena(String contrasena) {
        final String SQL_VERIFICAR_CONTRASENA = "SELECT * FROM tbl_usuarios where contrasena='" + contrasena + "'";
        return conectar.verificar(SQL_VERIFICAR_CONTRASENA);
    }

    /**
     * Se valida que el usuario haya ingresado correctamente el usuario y le contraseña.
     *
     * @return
     */
    public boolean aprobarUsuario() throws SQLException {
        if ((verificarUsuario(super.getUsuario()) == true) && (verificarContrasena(super.getContrasena()) == true)) {
            System.out.println("El usuario ha sido aprobado");
             conectar.cerrarConexion();
            return true;
        } else {
            System.out.println("No fue aprobado el usuario");
             conectar.cerrarConexion();
            return false;
        }

    }

    /**
     * Consulta un usuario en específico y lo devuelve en forma de lista.
     *
     * @return
     */
    public java.util.ArrayList consultarUsuariosArray() {
        String sql = "SELECT * FROM tbl_usuarios WHERE usuario='" + super.getUsuario() + "'";
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
