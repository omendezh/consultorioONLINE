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

    private int id_paciente;
    private String codpaciente;
    private String nombres;
    private String apellidos;
    private String fecha_nacimiento;
    private String email;
    private String telefono;
    private String celular;
    private String direccion;
    private String barrio;
    private String ciudad;
    private String genero;
    

    public Paciente() {
    }

    public Paciente getPaciente(int id_paciente) throws SQLException {
        this.id_paciente = id_paciente;
        return this.getPaciente();
    }

    public int getid_paciente() {
        return id_paciente;
    }

    public void setcodpaciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public String getnombres() {
        return nombres;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public void setnombres(String nombres) {
        this.nombres = nombres;
    }

    public String getapellidos() {
        return apellidos;
    }

    public void setapellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getcodpaciente() {
        return codpaciente;
    }

    public void setcodpaciente(String codpaciente) {
        this.codpaciente = codpaciente;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }


    public boolean guardarPaciente() {
        ConexionBD conexion = new ConexionBD();
        
        String sentencia = "INSERT INTO Pacientes(codpaciente, nombres, apellidos, genero, codpaciente, telefono, direccion, email) "
                + " VALUES ( '" + this.codpaciente + "','" + this.nombres + "',"
                + "'" + this.apellidos + "','" + this.genero + "','" + this.codpaciente + "',"
                + "'" + this.telefono + "','" + this.direccion + "','" + this.email +  "');  ";
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

    public boolean borrarPaciente(int codpaciente) {
        String Sentencia = "DELETE FROM `Pacientes` WHERE `codpaciente`='" + codpaciente + "'";
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
        String Sentencia = "UPDATE `Pacientes` SET nombres='" + this.nombres + "',apellidos='" + this.apellidos + "',genero='" + this.genero
                + "',codpaciente='" + this.codpaciente + "',telefono='" + this.telefono + "',direccion='" + this.direccion + "',email='" + this.email
                +  "' WHERE codpaciente=" + this.codpaciente + ";";
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
        String sql = "select * from Pacientes order by codpaciente asc";
        ResultSet rs = conexion.consultarBD(sql);
        Paciente c;
        while (rs.next()) {
            c = new Paciente();
            c.setcodpaciente(rs.getInt("codpaciente"));
            c.setnombres(rs.getString("nombres"));
            c.setapellidos(rs.getString("apellidos"));
            c.setGenero(rs.getString("genero"));
            c.setcodpaciente(rs.getString("codpaciente"));
            c.setTelefono(rs.getString("telefono"));
            c.setDireccion(rs.getString("direccion"));
            c.setemail(rs.getString("email"));
            listaPacientes.add(c);

        }
        conexion.cerrarConexion();
        return listaPacientes;
    }

    public Paciente getPaciente() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from pacientes where codpaciente='" + this.codpaciente + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.id_paciente = rs.getInt("id_paciente");
            this.nombres = rs.getString("nombres");
            this.apellidos = rs.getString("apellidos");
            this.genero = rs.getString("genero");
            this.codpaciente = rs.getString("codpaciente");
            this.telefono = rs.getString("telefono");
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
        return "Paciente{" + "codpaciente=" + codpaciente + ", nombres=" + nombres + ", apellidos=" + apellidos + ", genero=" + genero + ", codpaciente=" + codpaciente + ", telefono=" + telefono + ", direccion=" + direccion + ", email=" + email + '}';
    }
}