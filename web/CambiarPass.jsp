<%-- 
    Document   : CambiarPass
    Created on : 8 feb 2023, 20:52:35
    Author     : Victor
--%>


<%@page import="Sql.AccesoDatos"%>
<%@page import="Sql.Conexion"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="Sql.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar contraseña</title>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
         <link rel="shortcut icon" href="images/Logo_corto.jpg">
        <script src="js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%
            
            Statement st = null;
            Encriptar encri= new Encriptar();
            HttpSession sesion = request.getSession();          
            sesion.setMaxInactiveInterval(60);
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals(0)) {
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
                                long longDuracion = sesion.getLastAccessedTime();
                                sesion.getCreationTime();
                                Date duracion = new Date(longDuracion);
                                out.println(sesion.getAttribute("idCuenta"));
                                SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
                                out.println(" " + format.format(duracion.getTime()));
                            %>
                        </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Cambiar contraseña</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Cambiar contraseña</li>
                        </ol>
                       
                        <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                     <div class="card-body">
                                     <i class="fas fa-user fa-fw"></i>
                                     <label>Cuenta a Cambiar: <strong><% out.println(sesion.getAttribute("idCuenta"));%></strong> </label>
                            </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form mb-3">
                                                <input class="form-control" name="idContra1" type="password" placeholder="Nueva Contraseña" />                                            
                                            </div>
                                            <div class="form mb-3">
                                                <input class="form-control" name="idContra2" type="password" placeholder="Repita Nueva Contraseña" />
                                            </div>

                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <div class="col text-center">
                                                    <button type="submit" class="btn btn-primary" name="idguardar">Guardar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div> 
                                </div>
                                <%  
                            if (request.getParameter("idguardar") != null) {
                             
                             String user = request.getParameter("idCuenta");
                             String contra1 = request.getParameter("idContra1");
                             String contraN = request.getParameter("idContra2");
                              if (contra1.equals(contraN) && contra1 != "") {
                             try {
                            ResultSet rs = null;
                            AccesoDatos actualizarU = new AccesoDatos();
                            String valor1=encri.getMD5(contra1);
                            String valor2 =String.valueOf(sesion.getAttribute("ID"));
                            String valor3 =String.valueOf(sesion.getAttribute("idCuenta"));
                            rs = actualizarU.ActualizarUser(1,valor1,valor2,valor3);
                            Conexion conn= new Conexion();                  
                            sesion.setAttribute("logueado", 1);
                            sesion.setAttribute("idCuenta", user);                                             
                            response.sendRedirect("login.jsp");   
                                    } catch (Exception e) {
                                        out.write("Error" + e.getMessage());
                                    }  
                                    }else {
                                    %>
                               <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                                    <strong>Oh rayos!</strong> su contraseña no es la misma.
                                <a href="CambiarPass.jsp" class="close" data-dismiss="alert" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                                </a>
                                 </div>
                                <%
                                    }
                                }
                                %>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

