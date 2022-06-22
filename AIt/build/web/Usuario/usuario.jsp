<%-- 
    Document   : usuario
    Created on : 24/11/2019, 05:58:10 PM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
   Lo siguiente es para la sesión del usuario. A weno pa' saber jajaja salu2
--%>
<%@page import="java.sql.*"%>

<%
   HttpSession sesion = request.getSession();
   String email;
   
   if(sesion.getAttribute("Usuario")!=null){
       email = session.getAttribute("Usuario").toString();
   } else {
       out.println("<script> location.replace('/AIt/index.jsp'); </script>");
   }
   BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
    try{
        bd.conectar();
        ResultSet resultados = bd.consulta("call ConsultarUsuario('"+sesion.getAttribute("Usuario")+"');");
        ResultSet res2 = bd.consulta("select * from ViewEstrategia");
        while(resultados.next()) {
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link href="https://fonts.googleapis.com/css?family=Dosis:300,400,500,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Gudea:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/AIt/css/normalize.css">
        <link rel="stylesheet" href="/AIt/css/styles.css">
    </head>
    <body>
        <header class="site-usuario">
        <div class="contenedor contenedor-usuario">
            <div class="barra">
                <div class="logo">
                    <a href="/AIt/index.jsp">
                        <h2>ACHIEVE IT!</h2>
                    </a>
                </div>
                <nav class="navegacion">
                    <a href="/AIt/Objetivos/objetivos.jsp">Objetivos</a>
                    <a href="/AIt/Usuario/usuario.jsp">Perfil</a>
                    <a href ="../CerrarSesion">Cerrar sesión</a>
                </nav>
            </div>
            <div>
                <h1 class="fw-300 centrar-texto"><%out.println(resultados.getString("n"));%></h1>
            </div>
        </div>
    </header>
           
    <main class="contenedor">
        <div class="contenido-plan">
            <div class="contenedor-plan">
                <div class="centrar-texto texto-plan">
                    <h2>Plan de dia</h2>
                    <p>2019/Noviembre/28</p>
                </div>
                <div>
                    <% while(res2.next()) {
                            int idE = 0;
                            idE = res2.getInt("idE"); 
                            out.println("<input class='interlineado' type='radio' name='actividad1' value='"+idE+"'>"); 
                            out.println(res2.getString("ae")); 
                            out.println(res2.getInt("ce")); 
                            out.println(res2.getString("de"));%>
                            durante/cada
                            <%out.println(res2.getInt("vT"));
                            out.println(res2.getString("dT"));
                    }
                    %>
                </div>
                <div class="alinear-boton">
                    
                </div>
            </div>
            <div class="contenedor-calendario">
                <div class="coins centrar-texto">
                    <h3 class="fw-300 centrar-texto margen-texto">AIT! Coins:</h3>
                    <p class="margen-texto"><%out.println(resultados.getString("monedas"));%></p>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="footer-content">
        <div class="contenedor">
            <div class="barra padding-1">
                <nav class="navegacion usuario">
                    <a href="/AIt/nosotros.jsp">Nosotros</a>
                    <a href="/AIt/Blog.jsp">Blog</a>
                    <a href="/AIt/contacto.jsp">Contacto</a>
                </nav>
                <p>Todos los derechos reservados</p>
            </div>
        </div>
    </footer>
    </body>
    
</html>

 <% }bd.cierraConexion();
            } catch(Exception xxxD){
                out.println("<html><body>ERROR:"+xxxD.getMessage()+"</body></html>");
            }
  %>
