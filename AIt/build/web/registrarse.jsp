<%-- 
    Document   : registrarse
    Created on : 20/11/2019, 12:04:05 AM
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
                <form action="/AIt/Registrarse">
                    <div class="campo">
                        <label for="nombre-is">Nombre</label>
                        <input type="text" name= "nombre" id="nombre-is" placeholder="Tu Nombre">
                    </div>
                    <div class="campo">
                        <label for="email-is">E-mail</label>
                        <input type="email" name="correo" id="email-is" placeholder="Tu E-mail">
                    </div>
                    <div class="campo">
                            <label for="email-is">E-mail (de nuevo)</label>
                            <input type="email" id="email-is" placeholder="Tu E-mail">
                        </div>
                    <div class="campo">
                        <label for="Contraseña-is">Contraseña</label>
                        <input type="text" name="pass"id="Contraseña-is" placeholder="Tu Contraseña" minlength="8">
                    </div>
                    <div class="campo enviar">
                        <input type="submit" value="Registar" class="boton boton-naranja">
                    </div>
                </form>
                <div class="registro">
                    <p>¿Ya tienes una cuenta?</p>
                    <a href="iniciar_sesion.jsp">Ingresa aquí</a>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer-content">
        <p class="contenedor right-texto">Todos los derechos reservados</p>
    </footer>
</body>
</html>