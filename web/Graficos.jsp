<%-- 
    Document   : graficos
    Created on : 6 feb 2023, 21:38:03
    Author     : Victor
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graficos</title>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="shortcut icon" href="images/Logo_corto.jpg">
        <script src="js/all.js" crossorigin="anonymous"></script>
         <script src="js/jquery_v2.min.js"></script>
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
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Graficos</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Graficos</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                Muestra un conjunto de graficos en el cual puede observar varios panoramas con respecto al abigeato en Nicaragua, reportada por el APP MOVIL.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fa-solid fa-chart-pie"></i>
                                 Ultimos 6 meses de Abigueato, en toda Nicaragua.
                            </div>
                            <div class="card-body"><canvas id="myPieChart" width="100%" height="30"></canvas></div>                           
                            <div class="card-footer small text-muted"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fa-solid fa-chart-column"></i>
                                        Abigeato en los Ultimos 7 Dias, del mes en curso.
                                    </div>
                                    <div class="card-body"><canvas id="myBarChar2" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted"></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fa-solid fa-chart-line"></i>
                                        Top 7 Departamento con Mayor Abigeato, ultimos 6 meses.                                     
                                    </div>
                                    <div class="card-body"><canvas id="myDonaChart2" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted"></div>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/chart-dona-vs.js"></script>
        <script src="js/assets/demo/chart-bar-vs.js"></script>
        <script src="js/assets/demo/chart-area.js"></script>
   
    </body>
</html>
