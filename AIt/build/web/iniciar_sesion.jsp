<%-- 
    Document   : iniciar_sesion
    Created on : 19/11/2019, 11:28:48 PM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a href="iniciar_sesion.jsp">Iniciar Sesión</a>
                </nav>
            </div>
        </div>
    </header>
    <main class="contenedor seccion">
        <h2 class="fw-300 centrar-texto">Iniciar Sesion</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-sesion">
                <form action="/AIt/IniciarSesion">
                    <div class="campo">
                        <label for="email-is">E-mail</label>
                        <input type="email" name="email" id="email-is" placeholder="Tu E-mail">
                    </div>
                    <div class="campo">
                        <label for="Contraseña-is">Contraseña</label>
                        <input type="text" name="psw" id="Contraseña-is" placeholder="Tu Contraseña">
                    </div>
                    <div class="campo enviar">
                        <input type="submit" value="Ingresar" class="boton boton-naranja">
                    </div>
                </form>
                <div class="registro">
                    <p>¿Aún no tienes cuenta?</p>
                    <a href="registrarse.jsp">Registrate aquí</a>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer-content">
        <p class="contenedor right-texto">Todos los derechos reservados</p>
    </footer>
</body>
</html>