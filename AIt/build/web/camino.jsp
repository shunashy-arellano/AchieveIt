<%-- 
    Document   : camino
    Created on : 28/11/2019, 03:08:54 AM
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
        <div class="grid centrar-columnas">
            <div class="columnas-10 seccion">
                <img src="img/blog-camino.jpg" alt="imagen historia">
            </div>
            <div class="contenido-centrado seccion">
                <p>Escrito el: 20/10/2019 por: Admin</p>
                <p>Es increíble ver cómo tu forma de ver el mundo va evolucionando conforme 
                    a tus experiencias.
                </p>
                <p>No te das cuenta hasta que te detienes a pensar y analizar todo lo que has 
                    ido aprendiendo durante los últimos años.
                </p>
                <p>Al igual que la gran mayoría de jóvenes de hoy en día, yo también pasé por 
                    esa etapa de la vida en la que nos encontramos más perdidos que nunca.
                </p>
                <p>
                    Sé perfectamente lo que se siente.
                </p>
                <p>
                    La idea de tomarme un año sabático, entendiendo este como ese tiempo en 
                    el que te sitúas al margen de todo el el círculo académico y laboral, 
                    donde la prioridad es terminar una homologada formación para seguido comenzar 
                    con otra y seguir así hasta encontrar ese trabajo fijo tan “ansiado”, me 
                    parecía entonces una locura.
                </p>
                <p>
                    Sin embargo, ahora lo veo desde una perspectiva totalmente opuesta.
                </p>
                <p>
                    Si tú también estás pasando por esa desesperante situación personal en la 
                    que no tienes ni idea de qué camino deberías tomar, permíteme el lujo de 
                    convencerte de por qué no sería tan mala idea tomarse ese mal visto año sabático.
                </p>
                <p>
                    Todo esto es lo que yo haría si no supiese qué hacer con mi vida.
                </p>
                <p>
                    Sé que puede resultar muy frustrante el hecho de que siempre 
                    estés leyendo o escuchando eso de: “persigue tu pasión y sé feliz”.
                </p>
                <p>
                    Es muy fácil decirlo, aunque no tanto asimilarlo cuando realmente 
                    no tienes claro cuál es esa pasión.
                </p>
                <p>
                    Vivimos en una sociedad donde todo está programado. Desde que naces hasta 
                    el momento en que terminas tus estudios y llega el momento de encontrar el 
                    trabajo que te dará de comer durante el resto de tus días.
                </p>
                <p>
                    Tendemos a tomar decisiones y a actuar de manera precipitada, sin apenas 
                    detenernos a pensar el por qué de lo que estamos haciendo.
                </p>
                <p>
                    Decisiones que van a tener un fuerte impacto en nuestra vida, tanto a 
                    nivel económico como temporal, tomadas en unos pocos días.
                </p>
                <p>
                    Mi filosofía es la siguiente:
                </p>
                <p>
                    Busca algo que te guste hacer y a lo que no te importaría dedicarte durante 
                    los próximos 5 años de tu vida. Averigua si hay gente que se dedique 
                    profesionalmente a ello y analiza su labor, toma nota de las ventajas y desventajas 
                    de su trabajo y observa su forma de generar ingresos.
                </p>
            </div>
        </div>
    </main>

    <footer class="footer-content">
        <p class="contenedor right-texto">Todos los derechos reservados</p>
    </footer>
</body>
</html>