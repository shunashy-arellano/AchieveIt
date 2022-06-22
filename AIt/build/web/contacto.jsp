<%-- 
    Document   : contacto
    Created on : 28/11/2019, 03:12:30 AM
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
    <title>Contacto</title>
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
    <main class="contenedor seccion">
        <h2 class="fw-300 centrar-texto">Contacto</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="img/iniciar-sesion.jpg" alt="imagen Registarse">
            </div>
            <div class="columnas-10 formulario-sesion">
                <form action="#">
                    <div class="campo">
                        <label for="nombre-cont">Nombre:</label>
                        <input type="text" id="nombre-cont" placeholder="Tu nombre">
                    </div>
                    <div class="campo">
                        <label for="email-cont">E-mail:</label>
                        <input type="email" id="email-cont" placeholder="Tu E-mail">
                    </div>
                    <div class="campo">
                        <label for="mensaje">Mensaje:</label>
                        <textarea id="mensaje" ></textarea>
                    </div>

                    <div class="campo enviar">
                        <input type="submit" value="Enviar" class="boton boton-naranja">
                    </div>
                </form>
            </div>
        </div>
    </main>
    <footer class="footer-content">
        <p class="contenedor right-texto">Todos los derechos reservados</p>
    </footer>
</body>
</html>