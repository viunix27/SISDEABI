<%-- 
    Document   : Informes
    Created on : 6 feb 2023, 21:49:52
    Author     : Victor
--%>

<%@page import="Sql.Conexion"%>
<%@page import="Sql.AccesoDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informes</title>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />  
         <link rel="shortcut icon" href="images/Logo_corto.jpg">
        <script src="js/all.js" crossorigin="anonymous"></script>
        <script src="js/chart.js"></script>
    </head>
     <body class="sb-nav-fixed">
         <% 
            HttpSession sesion = request.getSession();
            sesion.setMaxInactiveInterval(60);
            if(sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals(0))
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
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
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
                        <h1 class="mt-4">Informes</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Informes</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <strong>CONAGAN,</strong> es una organización de carácter gremial ganadera, privada, sin fines de lucro, apolítica y tiene como objetivo representar y defender los intereses generales del sector ganadero nacional, de sus organizaciones miembros y de los productores, dedicados a la actividad ganadera.
                                <a target="_blank" href="https://conagan.org/">Sitio Oficial</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Historial de Abigueado en Nicaragua
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="table table-striped datatable-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Fecha</th>
                                            <th>Cantidad Denuncias</th>
                                            <th>Departamento</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <% 
                                       try {
                                       ResultSet rs = null;
                                       AccesoDatos listaU = new AccesoDatos();
                                       rs = listaU.ListadoUser(3);
                                       Conexion conn= new Conexion();  
                                       while (rs.next()) {  %> 
                                        <tr>
                                        <td><%out.print(rs.getInt(1));%></td> 
                                        <td><%out.print(rs.getDate(2));%></td>
                                        <td><%out.print(rs.getInt(3));%></td>
                                        <td><%out.print(rs.getString(4));%></td>
                                                                             
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
               <footer class="py-3 bg-light mt-auto">
                   <div class="container-fluid px-3">
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
        <script src="js/Chart.min.js" ></script>
        <script src="js/assets/demo/chart-bar-vs.js"></script>
        <script src="js/assets/demo/chart-area-vs.js"></script>  
        <script src="js/simple-datatables2.js" ></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
