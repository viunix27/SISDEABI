<%-- 
    Document   : Configuracion
    Created on : 8 feb 2023, 20:35:45
    Author     : Victor
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Sql.Conexion"%>
<%@page import="Sql.AccesoDatos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración</title>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
         <link rel="shortcut icon" href="images/Logo_corto.jpg">
        <script src="js/all.js" crossorigin="anonymous"></script>
     
    </head>
     <body class="sb-nav-fixed">
         <% 
            HttpSession sesion = request.getSession();
            sesion.setMaxInactiveInterval(60);
            if(sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0"))
            {
            response.sendRedirect("login.jsp");
            }
       %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="Dashboard.jsp">SISDEABI</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
              
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="true"><i class="fas fa-user fa-fw"></i></a>
                   <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="CambiarPass.jsp">Cambiar contraseña</a></li>
                        <li><a class="dropdown-item" href="Configuracion.jsp">Configuración</a></li>                     
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.jsp">Salir</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                           
                            <a class="nav-link" href="Dashboard.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>                                             
                            <a class="nav-link" href="Graficos.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Graficos
                            </a>
                            <a class="nav-link" href="Informes.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Informes
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Usuario:
                        <%                                                    
                            Calendar fechahoy = Calendar.getInstance();
                            fechahoy.getTime();                           
                            long longDuracion=sesion.getLastAccessedTime(); 
                            sesion.getCreationTime();
                            Date duracion=new Date(longDuracion);
                            out.println(sesion.getAttribute("idCuenta")); 
                            SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");                       
                            out.println(" "+format.format(duracion.getTime()) );                                               
                        %>
                        </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Configuración</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Configuración</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                               En este apartado se verifican y aprueban los usuarios nuevos que se crean mediante el APP Movil.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Cuentas
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Usuario</th>                                           
                                            <th scope="col">Correo</th>
                                            <th scope="col">Rol</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>                                      
                                    <tbody>                                       
                                        <% 
                                       try {
                                       ResultSet rs = null;
                                       AccesoDatos listaU = new AccesoDatos();
                                       rs = listaU.ListadoUser(2);
                                         
                                       while (rs.next()) {  %> 
                                        <tr>
                                        <td><%out.print(rs.getString(1));%></td> 
                                        <td><%out.print(rs.getString(2));%></td>
                                        <td><%out.print(rs.getString(3));%></td>
                                        <td><%out.print(rs.getString(4));%></td>
                                        <td><%out.print(rs.getString(5));%></td>
                                        <td>
                                            <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="abroModalProducto('idU','<%=rs.getString(1)%>','<%=rs.getString(5)%>')"><i class="fa fa-pencil"></i></button>                                     
                                        </td>
                                        </tr>
                                        <%
                                            }                                                                                
                                            } catch (Exception e) {
                                        out.write("Error" + e.getMessage());
                                            }
                                        %>
                                    </tbody>                                  
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
 <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar Estado Cuenta APP MOVIL</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cancelar"></button>
      </div>
      
                                    <div class="card-body">
                                        <form name="miActualizar">
                                            <div class="mb-3">
                                                 <i class="fas fa-user fa-fw"></i> 
                                                 <label>Cuenta a modificar:</label>  
                                                <input id="UpdateUser" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">                                     
                                            </div>
                                           <div class="form-check">
                                               <input class="form-check-input" type="radio" name="miCheck" id="idCheck" value="option1" >
                                                <label class="form-check-label" for="idCheckA">
                                                  Activo
                                                </label>
                                            </div>
                                            <div class="form-check">
                                            <input class="form-check-input" type="radio" name="miCheck" id="idCheckN" value="option2" >
                                            <label class="form-check-label" for="idCheckN">
                                              Nuevo
                                            </label>
                                          </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="miCheck" id="idCheckD" value="option3" >
                                                <label class="form-check-label" for="idCheckD">
                                                  Desactivo
                                                </label>
                                              </div>                                          
                                        </form>
                                    </div>
                                             <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="button" class="btn btn-primary">Guardar cambios</button>
                         </div>
                        </div>
                              </div>
                            </div>
                          </div>
                        </div>            
                                                                      
                <footer class="py-4 bg-light mt-auto">
                   <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright © 2023 SISDEABI</div>
                            <div>                              
                                <a href="https://www.uni.edu.ni/#/computacion">Desarrollado por Estudiantes UNI-RUSB.</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="js/bootstrap.bundle2.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="js/Chart.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/chart-area-demo.js"></script>
        <script src="js/assets/demo/chart-bar-demo.js"></script>
        <script src="js/simple-datatables2.js" ></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script>
                        
            function abroModalProducto(id, producto,estado){
                if(id == 'idU'){
                        document.getElementById("idCheckA").checked= false
                        document.getElementById("idCheckN").checked= false
                        document.getElementById("idCheckD").checked= false
                        
                        document.getElementById("UpdateUser").value= producto
                        if(estado=='Activo'){
                            document.getElementById("idCheckA").checked=true}
                        else if (estado =='Nuevo'){document.getElementById("idCheckN").checked = true}
                        else {document.getElementById("idCheckD").checked = true}
                            }
                        }
            
        
        </script>
        
    </body>
</html>
