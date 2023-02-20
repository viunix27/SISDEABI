

<%@page import="Sql.AccesoDatos"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Sql.Encriptar"%>
<%@page import="Sql.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="images/Logo_corto.jpg">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>SISDEABI</title>     
    </head>

    <body class="bg-dark text-white">        
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-sm">
                        <div class="row justify-content-center">
                            <div class="col-lg-3">
                                <div class="shadow-lg border-0 container-sm">
                                    <div class="card-header container-sm">  
                                         <div class="justify-content-center"> 
                                        <img src="images/logo2.png" alt="..." class="rounded img-fluid"/> 
                                          </div>
                                            </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="idCuenta" type="usuario" placeholder="Usuario" />
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="idContra" type="password" placeholder="Contraseña" />
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <div class="col text-center">
                                                    <button type="submit" class="btn btn-light" name="login">Ingresar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="https://conagan.org/">CONAGAN</a></div>
                                    </div>
                                </div>
                                <%    try {
                                       Encriptar encri= new Encriptar();                                                             
                                       ResultSet rs = null;
                                       AccesoDatos listaU = new AccesoDatos();
                                       rs = listaU.ListadoUser(1);
                                      
                                       int IDBandera = 0;
                                       while (rs.next()) {
                                        if (request.getParameter("login") != null) {
                                            String user = request.getParameter("idCuenta");
                                            String contra = encri.getMD5(request.getParameter("idContra"));      
                                            int ID = rs.getInt(1);
                                            HttpSession sesion = request.getSession();
                                            if (user.equals(rs.getString(2)) && contra.equals(rs.getString(3)) && rs.getInt(5)==1 && (rs.getInt(6) ==1 || rs.getInt(6)==3)) {
                                                sesion.setAttribute("logueado", 1);
                                                sesion.setAttribute("idCuenta", user);
                                                sesion.setAttribute("ID", ID);
                                                IDBandera =1;
                                                response.sendRedirect("Dashboard.jsp");
                                            } else {
                                                    IDBandera = 1;
                                                    }
                                                                                    }                                 
                                                    }
                                                    if(IDBandera == 1){
                                            %>
                                            
                                           <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                                    <strong>Oh rayos!</strong> su contraseña es incorrecta.
                                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                      <span aria-hidden="true">&times;</span>
                                                    </button>
                                                  </div>
                                           
                                            <%
                                             }
                                    } catch (Exception e) {
                                        out.write("Error" + e.getMessage());
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <div class="overflowV">
      <div class="contenidoV">
                <footer class="py-3 mt-auto" style="background-color: rgba(0, 0, 0, 0.2);position: absolute;">
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
      </div>
        </div>
        <script src="js/jquery-3.6.3.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script> 
        $('.button').bind('click', function() {
	$('.modal').addClass('hide');
            });
        </script>
    </body>

</html>

