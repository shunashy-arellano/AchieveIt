<%-- 
    Document   : objetivos
    Created on : 24/11/2019, 11:35:05 PM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        ResultSet objetivos = bd.consulta("call ConsultarObjetivo('"+sesion.getAttribute("Usuario")+"');");
        ResultSet objetivos2 = bd.consulta("call ConsultarObjetivo('"+sesion.getAttribute("Usuario")+"');");
        
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Objetivos</title>
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
                </nav>
            </div>
            <div>
                <% while(resultados.next()) {%>
                <h1 class="fw-300 centrar-texto"><%out.println(resultados.getString("n"));%></h1>
                <%}%>
            </div>
        </div>
    </header>

    <main class="contenedor">
        <h2 class="centrar-texto">Objetivos</h2>
        <div class="alinaer-boton">
            <form action="/AIt/Objetivos/objetivo-registro.jsp">
                <input type="submit" class="boton boton-naranja" value="Crear objetivo"/>          
            </form>
        </div>
        <div class="contenido-plan">
            <div class="contenedor-progreso">
                <div class="centrar-texto texto-obj">
                    <h3>Objetivos en progreso</h3>
                </div>
                <div class="navegacion">
                    <div class="interlineado">  
                        <% while(objetivos.next()) {
                            int idEs = 0;
                            int idO = 0;
                            idEs = objetivos.getInt("idE");
                            idO = objetivos.getInt("idO");
                                if(idEs == 1){
                                    out.println("<a href='/AIt/Objetivos/objetivo-particular.jsp?idO="+idO+"' method ='get'>"); 
                                    out.println(objetivos.getString("ao")); 
                                    out.println(objetivos.getInt("co")); 
                                    out.println(objetivos.getString("doo"));%>
                                    en/durante
                                    <%out.println(objetivos.getInt("vT"));
                                    out.println(objetivos.getString("dT")); 
                                } %>
                        </a><br>
                        <%}    %>
                    </div>
                </div>
            </div>
            <div class="contenedor-completos">
                <div class="centrar-texto texto-obj">
                    <h3>Objetivos completados</h3>
                </div>
                <div class="navegacion">
                        <div class="interlineado">
                            <%while(objetivos2.next()){%>
                            <a href="/AIt/Objetivos/objetivo-particular.jsp">
                                <%
                                    int idEs = objetivos2.getInt("idE");
                                    if(idEs == 2){
                                        out.println(objetivos.getString("ao")); 
                                        out.println(objetivos.getInt("co")); 
                                        out.println(objetivos.getString("doo"));%>
                                        en/durante
                                        <%out.println(objetivos.getInt("vT"));
                                        out.println(objetivos.getString("dT")); 
                                   } %>
                        </a><br>
                        <%}    %>
                        </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer-content">
        <div class="contenedor">
            <div class="barra padding-1">
                <nav class="navegacion usuario margen-texto">
                    <a href="/AIt/nosotros.jsp">Nosotros</a>
                    <a href="/AIt/Blog.jsp">Blog</a>
                    <a href="/AIt/contacto.jsp">Contacto</a>
                </nav>
                <p class="margen-texto">Todos los derechos reservados</p>
            </div>
        </div>
    </footer>
</body>
</html>
<% bd.cierraConexion();
            } catch(Exception xxxD){
                out.println("<html><body>ERROR:"+xxxD.getMessage()+"</body></html>");
            }
  %>
