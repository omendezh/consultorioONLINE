<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : Grupo 6 MISION TIC S52

--%>


<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Paciente"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarpaciente", //no funciona
        "eliminarpaciente", // no funciona
        "listarpaciente",
        "guardarPaciente",
    });
    
    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // --------------------------------- //
        // -----------FIN PROCESOS---------- //
        // --------------------------------- //
        
        if (proceso.equals("guardarPaciente")) {
            int ident = Integer.parseInt(request.getParameter("identificacion"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String celular = request.getParameter("celular");
            String direccion = request.getParameter("direccion");
            String email = request.getParameter("email");
            boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
            //p.llenarPaciente (ident, nombre, apellido, genero, tipoident, celular, direccion, email);
            //su codigo acá
            Paciente p = new Paciente();
            p.setIdentificacion(ident);
            p.setNombre(nombre);
            p.setApellido(apellido);
            p.setGenero(genero);
            p.setTipoIdentificacion(tipoident);
            p.setCelular(celular);
            p.setDireccion(direccion);
            p.setEmail(email);
            if (p.guardarPaciente()){
                    respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarpaciente")) {
            int identificacion = Integer.parseInt(request.getParameter("identificacion"));
            //su codigo acá
            Paciente p= new Paciente();
            if (p.borrarPaciente(identificacion)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            } 

        } else if (proceso.equals("listarpaciente")) {
            //su codigo acá
            Paciente p= new Paciente();
            try {
                List<Paciente> lista = p.listarPacientes();
                respuesta += "\"" + proceso + "\": true,\"Pacientes\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Pacientes\":[]";
                Logger.getLogger(Paciente.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizarpaciente")) {
            int ident = Integer.parseInt(request.getParameter("identificacion"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String celular = request.getParameter("celular");
            String direccion = request.getParameter("direccion");
            String email = request.getParameter("email");
            boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
            //su codigo acá
           
            Paciente p= new Paciente(); 
            p.setNombre(nombre);
            p.setIdentificacion(ident);
            p.setApellido(apellido);
            p.setGenero(genero);
            p.setTipoIdentificacion(tipoident);
            p.setCelular(celular);
            p.setDireccion(direccion);
            p.setEmail(email);                   
                
            if (p.actualizarPaciente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            } 
        }

        // --------------------------------- //
        // -----------FIN PROCESOS---------- //
        // --------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"NOoooo Error otra vez -> los datos que ha enviado,"
                + " son inválidos. Corregir y volver a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>

