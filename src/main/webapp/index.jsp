<%-- 
    Document   : index
    Created on : 24/09/2021, 01:18:34 AM
    Author     : Grupo 6 MINTIC S52
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consultorio Online</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
       
    </head>
    <body>
        <div class="container-fluid" ng-app = "consultorio" ng-controller = "pacientesController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>consultorio</h1></center> 
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                   <h3>Sección 1</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Identificacion</label>
                            <input class="form-control" type="number" min="0" ng-model="cn.identificacion" required>
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="cn.nombre" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" ng-model="cn.apellido" required>
                        </div>
                        <div class="col-6">
                            <label>Genero</label>
                            <select class="form-control" ng-model="cn.genero" required>
                                <option>Masculino</option>
                                <option>Femenino</option>
                                <option>No Definido</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo identificacion</label>
                            <select class="form-control" ng-model="cn.tipoIdentificacion" required>
                                <option>CC</option>
                                <option>TI</option>
                                <option>CE</option>
                                <option>RC</option><!-- comment -->
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Celular</label>
                            <input class="form-control" type="text" ng-model="cn.celular" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" ng-model="cn.direccion" required>
                        </div>
                        <div class="col-6">
                            <label>Email</label>
                            <input class="form-control" type="text" ng-model="cn.email" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="cn.guardarPaciente()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="cn.listarPacientes()">Listar Pacientes</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="cn.eliminarPaciente()">Eliminar Pacientes</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="cn.actualizarPaciente()">Actualizar Pacientes</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Sección 2</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Identificacion</label>
                            <input class="form-control" type="text" value="{{cn.identificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{cn.nombre}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" value="{{cn.apellido}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Genero</label>
                            <input class="form-control" type="text" value="{{cn.genero}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo identificacion</label>
                            <input class="form-control" type="text" value="{{cn.tipoIdentificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label> Celular</label>
                            <input class="form-control" type="text" value="{{cn.celular}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" value="{{cn.direccion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Email</label>
                            <input class="form-control" type="text" value="{{cn.email}}" disabled="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" >
                <div class="col-12 table-responsive-xl">
                    <h3>Sección 3</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Id</th>  
                                <th>Nombre</th>  
                                <th>Apellido</th>  
                                <th>Genero</th>  
                                <th>Tipo id</th>  
                                <th>Celular</th>  
                                <th>Direccion</th>  
                                <th>Email</th>  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "paciente in cn.pacientes">  
                            <td>{{ paciente.identificacion}}</td>  
                            <td>{{ paciente.nombre}}</td>  
                            <td>{{ paciente.apellido}}</td>  
                            <td>{{ paciente.genero}}</td>  
                            <td>{{ paciente.tipoIdentificacion}}</td>  
                            <td>{{ paciente.celular}}</td>  
                            <td>{{ paciente.direccion}}</td>  
                            <td>{{ paciente.email}}</td>    
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
    </body>
    <script>
        var app = angular.module('consultorio', []);
        app.controller('pacientesController', ['$http', controladorPacientes]);
        function controladorPacientes($http) {
            var cn = this;
            cn.listarPacientes = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarpaciente"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.pacientes = res.data.Pacientes;
                });
            };
            cn.guardarPaciente = function () {
                var paciente = {
                    proceso: "guardarPaciente",
                    identificacion: cn.identificacion,
                    nombre: cn.nombre,
                    apellido: cn.apellido,
                    genero: cn.genero,
                    tipoIdentificacion: cn.tipoIdentificacion,
                    celular: cn.celular,
                    direccion: cn.direccion,
                    email: cn.email
                };
                console.log(paciente);
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: paciente
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[paciente.proceso] === true) {
                            alert("Guardado con éxito");
                           cn.listarPacientes();
                        } else {
                            alert("No se guardo Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.eliminarPaciente = function () {
                var paciente = {
                    proceso: "eliminarpaciente",
                    identificacion: cn.identificacion
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: paciente
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[paciente.proceso] === true) {
                            alert("Registro Eliminado con éxito");
                            //                                cn.listarpacientes();
                        } else {
                            alert("Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.actualizarPaciente = function () {

                var paciente = {
                    proceso: "actualizarpaciente",
                    identificacion: cn.identificacion,
                    nombre: cn.nombre,
                    apellido: cn.apellido,
                    genero: cn.genero,
                    tipoIdentificacion: cn.tipoIdentificacion,
                    celular: cn.celular,
                    direccion: cn.direccion,
                    email: cn.email
                
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: paciente
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[paciente.proceso] === true) {
                            alert("Se Actualizó Datos de Paciente con éxito");
                            //                                cn.listarpacientes();
                        } else {
                            alert("Favor vefifique los datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
           
        }
    </script>  
</html>
