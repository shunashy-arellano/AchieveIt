<%-- 
    Document   : Blog
    Created on : 28/11/2019, 03:05:13 AM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
   HttpSession sesion = request.getSession();
   String email;
   
%>

<!DOCTYPE html>
<html lang="en">
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
    <header>
        <div class="contenedor contenido-header">
            <div class="barra">
                <div class="logo">
                    <a href="/AIt/index.jsp">
                        <h2>ACHIEVE IT!</h2>
                    </a>
                </div>

                <nav class="navegacion">
                    <a href="/AIt/nosotros.jsp">Nosotros</a>
                    <a href="/AIt/Blog.jsp">Blog</a>
                    <a href="/AIt/contacto.jsp">Contacto</a>
                    <%
                        if(sesion.getAttribute("Usuario")!=null){
                            email = session.getAttribute("Usuario").toString();
                            BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
                            try{
                             bd.conectar();
                             ResultSet resultados = bd.consulta("call ConsultarUsuario('"+sesion.getAttribute("Usuario")+"');");
                             while(resultados.next()) {
                                 out.println("<a href='/AIt/Usuario/usuario.jsp'>"+resultados.getString("n")+"</a>");
                             }
                             bd.cierraConexion();
                            }catch(Exception xxxD){
                                out.println("<html><body>ERROR:"+xxxD.getMessage()+"</body></html>");
                            }
                        } else {
                            out.println("<a href='/AIt/iniciar_sesion.jsp'> Iniciar sesion</a>");
                        }
                        
                    %>
                </nav>
            </div>
        </div>
    </header>
    <main class="contenedor seccion">
        <h2 class="centrar-texto fw-300">Nuestro blog</h2>
        <div class="contenedor-blog seccion">
            <a href="divierte.html">
                <img src="img/blog-diviertete.jpg" alt="">
            </a>
            <a href="miedos.html">
                <img src="img/blog-miedos.jpg" alt="">
            </a>
            <a href="/AIt/camino.jsp">
                <img src="img/blog-camino.jpg" alt="">
            </a>
        </div>
        <div class="contenedor-blog seccion">
            <a href="inspirate.html">
                <img src="img/blog-inspirate.jpg" alt="">
            </a>
            <a href="tiempo.html">
                <img src="img/blog.tiempo.jpg" alt="">
            </a>
            <a href="enfocate.html">
                <img src="img/blog-enfocate.jpg" alt="">
            </a>
        </div>
    </main>
</body>
</html>