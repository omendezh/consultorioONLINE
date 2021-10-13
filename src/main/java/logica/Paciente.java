/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;


/**
 *
 * @author grupo 6  - MINTIC s52
 */
public class Paciente {

    private int identificacion;
    private String nombre;
    private String apellido;
    private String genero;
    private String tipoIdentificacion;
    private String celular;
    private String direccion;
    private String email;
    

    public Paciente() {
    }
    
    public Paciente getPaciente(int identificacion) throws SQLException {
        this.identificacion= identificacion;
        return this.getPaciente();
    }

    public int getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(int identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

    public boolean guardarPaciente() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO `pacientes` (identificacion, nombre, apellido, genero, tipoIdentificacion, celular, direccion, email) "
                + " VALUES ( '" + this.identificacion + "','" + this.nombre + "',"
                + "'" + this.apellido + "','" + this.genero + "','" + this.tipoIdentificacion + "',"
                + "'" + this.celular + "','" + this.direccion + "','" + this.email +  "');  ";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean borrarPaciente(int identificacion) {
        String Sentencia = "DELETE FROM `pacientes` WHERE `identificacion`='" + identificacion + "'";
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(Sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarPaciente() {
        ConexionBD conexion = new ConexionBD();
        String Sentencia = "UPDATE `pacientes` SET nombre='" + this.nombre + "',apellido='" + this.apellido + "',genero='" + this.genero
                + "',tipoIdentificacion='" + this.tipoIdentificacion + "',celular='" + this.celular + "',direccion='" + this.direccion + "',email='" + this.email
                +  "' WHERE identificacion=" + this.identificacion + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(Sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public List<Paciente> listarPacientes() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        List<Paciente> listaPacientes = new ArrayList<>();
        String sql = "select * from pacientes order by identificacion asc";
        ResultSet rs = conexion.consultarBD(sql);
        Paciente p;
        while (rs.next()) {
            p = new Paciente();
            p.setIdentificacion(rs.getInt("identificacion"));
            p.setNombre(rs.getString("nombre"));
            p.setApellido(rs.getString("apellido"));
            p.setGenero(rs.getString("genero"));
            p.setTipoIdentificacion(rs.getString("tipoIdentificacion"));
            p.setCelular(rs.getString("celular"));
            p.setDireccion(rs.getString("direccion"));
            p.setEmail(rs.getString("email"));
            
            listaPacientes.add(p);

        }
        conexion.cerrarConexion();
        return listaPacientes;
    }

    public Paciente getPaciente() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from pacientes where identificacion='" + this.identificacion + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.identificacion = rs.getInt("identificacion");
            this.nombre = rs.getString("nombre");
            this.apellido = rs.getString("apellido");
            this.genero = rs.getString("genero");
            this.tipoIdentificacion = rs.getString("tipoIdentificacion");
            this.celular = rs.getString("celular");
            this.direccion = rs.getString("direccion");
            this.email = rs.getString("email");
            
            
            
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "Paciente{" + "identificacion=" + identificacion + ", nombre=" + nombre + ", apellido=" + apellido + ", genero=" + genero + ", tipoIdentificacion=" + tipoIdentificacion + ", celular=" + celular + ", direccion=" + direccion + ", email=" + email + '}';
    }
}