/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Clase encargada de crear las conexiones pertinentes a MySQL y a la base de
 * datos db_fruteria, con el fin de realizar diersas operaciones
 *
 * @author
 */
public class Conexion {

    ResultSet resultado = null;
    private Connection conexion = null;
    Statement estado = null;
    //Driver que permite conectar a Mysql
    String driver = "com.mysql.jdbc.Driver";
    //Url de la base de datos.
    String url = "jdbc:mysql://localhost/db_fruteria";
    //Usuario de la base de datos
    String usuario = "fruteria";
    //Contraseña de la base de datos
    String contrasena = "fruteria";

    public Conexion() {
        conectar();
    }

    /**
     * Método que abre la conexión a la base de datos y carga el driver de
     * MySQL.
     */
    public final void conectar() {
        //Se valida que no haya una conexión abierta
        if (getConexion() == null) {
            try {
                //Se carga el driver
                Class.forName(driver);
                System.out.println("Se ha cargado el driver");
            } catch (Exception e) {
                System.out.println("No se ha podido cargar el driver: " + e);
            }

            try {
                //Se conecta a la base de datos.
                conexion = DriverManager.getConnection(url, usuario, contrasena);
                System.out.println("Se ha conectado correctamente");
            } catch (SQLException e) {
                System.out.println("No se ha podido conectar: " + e);
            }
        }
    }

    /**
     * Método que permite realizar una insersión a la base de datos, es un
     * método booleano, si se inserta exisosamente devuelve true, de lo
     * contrario muestra una excepción y retorna false.
     */
    public boolean insertarSql(String consultaSql) {
        try {
            estado = getConexion().createStatement();
            estado.executeUpdate(consultaSql);
            estado.close();
            System.out.println("Insertó correctamente");
            cerrarConexion();
            return true;

        } catch (SQLException e) {
            System.out.println("Error insertando" + e);
            return false;
        }
    }

    /**
     * Método que permite verificar un dato en la base de datos, verifica que
     * exista un registro que entra por consulta; retorna true si encuentra el
     * dato.
     */
    public boolean verificar(String consultaSql) {
        try {
            estado = getConexion().createStatement();
            resultado = estado.executeQuery(consultaSql);
            if (resultado.next()) {
                return true;
            }
            estado.close();
            cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Error verificando:" + e);

        }
        return false;
    }

    /**
     * Método que permite eliminar uno o varios registros de la base de datos,
     * retorna booleano si se elimina correctamente, de lo contrario retorna
     * false.
     */
    public boolean eliminar(String sql) {
        try {
            estado = getConexion().createStatement();
            estado.executeUpdate(sql);
            estado.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            System.out.println("Error eliminando..." + e);
            return false;
        }
    }

    /**
     * Método que permite buscar registros en la base de datos a partir de una
     * consulta SQL que entra por parámetro, retorna un resultSet que contiene
     * todos los registros encontrados.
     */
    public ResultSet buscar(String sql) {
        try {
            estado = getConexion().createStatement();
            return estado.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("Error consultando" + e);
            return null;
        }
    }

    /**
     * Método que permite actualizar un registro en la base de datos entra una
     * consulta SQL por parámetro, retorna un resultSet que contiene todos los
     * registros encontrados.
     */
    public boolean actualizar(String consultaSql) {
        try {
            estado = conexion.createStatement();
            System.out.println(consultaSql);
            estado.executeUpdate(consultaSql);
            estado.close();
            return true;
        } catch (SQLException e) {
            System.out.println("Error actualizando: " + e);
            return false;

        }
    }

    /**
     * Cierra la conexión que está abierta a la base de datos.
     */
    public void cerrarConexion() throws SQLException {
        if (getConexion() != null) {
            getConexion().close();
        }
    }

    public Connection getConexion() {
        return conexion;
    }

}
