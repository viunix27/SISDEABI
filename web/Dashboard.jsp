<%-- 
    Document   : Dashboard
    Created on : 6 feb 2023, 21:19:05
    Author     : Victor
--%>
<%@page import="Sql.Conexion"%>
<%@page import="Sql.AccesoDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISDEABI</title>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />   
        <link rel="shortcut icon" href="images/Logo_corto.jpg">
        <script src="js/all.js" crossorigin="anonymous"></script>
        <script src="js/chart.js"></script>
        <script src="js/jquery_v2.min.js"></script>

                   
    </head>
   <body class="sb-nav-fixed" >
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
        <div class="loader-page"></div>
        <div id="layoutSidenav" >
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
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content" >
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body d-flex d-flex justify-content-center align-items-center"><h2>80</h2></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                       <h5><a class="small text-white stretched-link" href="Configuracion.jsp">Usuarios Activos</a></h5>
                                        <i class="fa-solid fa-users"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                   <div class="card-body d-flex d-flex justify-content-center align-items-center"><h2>20</h2></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h5><a class="small text-white stretched-link" href="Configuracion.jsp">Usuarios Nuevos</a></h5>
                                       <i class="fa-solid fa-user-plus"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body d-flex d-flex justify-content-center align-items-center"><h2>815</h2></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h5><a class="small text-white stretched-link" href="Informes.jsp">Abigeato, ultimos 6 meses</a></h5>
                                        <i class="fa-solid fa-user-secret"></i> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                   <div class="card-body d-flex d-flex justify-content-center align-items-center"><h2>55</h2></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <h5><a class="small text-white stretched-link" href="Configuracion.jsp">Usuarios Desactivos</a></h5>
                                      <i class="fa-solid fa-user-minus"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                       <i class="fa-solid fa-chart-pie"></i>
                                        Top 7 Departamento con Mayor Abigeato, ultimos 6 meses.
                                    </div>
                                    <div class="card-body">                                    
                                        <canvas id="myDonaChart2" width="100%" height="40">                                           
                                        </canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fa-solid fa-chart-column"></i>
                                        Abigeato en los Ultimos 7 Dias, del mes en curso.
                                    </div>                                  
                                    <div class="card-body">                                     
                                        <canvas id="myBarChar2" width="100%" height="40">                                           
                                        </canvas>
                                    </div>
                                    </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Lista de abigeato...
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="table table-striped">
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
        <script src="js/Chart.min.js" ></script>
        <script src="js/assets/demo/chart-bar-vs.js"></script>
        <script src="js/assets/demo/chart-dona-vs.js"></script>  
        <script src="js/simple-datatables2.js" ></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script>
          $(window).on('load', function () {
      setTimeout(function () {
    $(".loader-page").css({visibility:"hidden",opacity:"0"})
  }, 2000);
     
});
        </script>
    </body>
</html>
