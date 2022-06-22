<%-- 
    Document   : nosotros
    Created on : 28/11/2019, 03:16:17 AM
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
    <title>Nostros</title>
    <link href="https://fonts.googleapis.com/css?family=Dosis:300,400,500,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Gudea:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/styles.css">
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
    <main class="contenedor-nosotros interlineado">
        <h1 class="centrar-texto fw-300">Conoce sobre nosotros</h1>
        <div class="contenido-nosotros seccion">
            <div>
                <img src="img/nosotros.jpg" alt="Imagen Sobre Nosotros">
            </div>
            <div class="texto-nosotros margen-bottom">
                <blockquote>Con una larga experiencia</blockquote>
                <p>ACHIEVE IT! te ayuda a entender en qué parte de la vida debes concentrarte. 
                    Te ayudamos a establecer objetivos y te enseñamos formas de sentirse 
                    bien, ser productivo y mantenerse motivado.
                </p>
                <p>                    
                    Vive una vida plena y saludable con un sistema de herramientas de desarrollo 
                    personal para ayudar a enfocarte y ser organizado, así como a ser 
                    orientado a metas y acciones. ¡Perfecto para una resolución de año nuevo! La 
                    habilidad y el conocimiento proporcionados te ayudarán a mantener tu bienestar 
                    mental y te permitirán vivir una vida plena y saludable con mayor autoestima, 
                    amor propio y menos estrés y ansiedad.
                </p>
            </div>
        </div>
    </main>
    <footer class="footer-content">
        <p class="contenedor right-texto">Todos los derechos reservados</p>
    </footer>
</body>
</html>