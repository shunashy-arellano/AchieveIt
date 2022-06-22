<%-- 
    Document   : tutorial-obj
    Created on : 28/11/2019, 03:22:30 AM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tutorial</title>
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
                    <a href="/AIt/Objetivos/objetivos.jsp">Objetivos</a>
                    <a href="/AIt/Estrategias/estrategia.jsp">Estrategias</a>
                    <a href="/AIt/Usuario/usuario.jsp">Perfil</a>
                </nav>
            </div>
        </div>
    </header>
    <main class="contenedor seccion">
        <h2 class="fw-300 centrar-texto">¡Comienza tus objetivos!</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="/AIt/img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-oe">
                <form action="#">
                    <h3 class="centrar-texto fw-300">Cumple tus objetivos con SMART</h3>
                    <p>Para que un objetivo sea inteligente debe cumplir con lo siguiente:</p>
                    <div class="margen-left-2">
                        <p>Tiene que ser...</p>
                        <div class="margen-left-1">
                            <p class="margen-texto">Especifico (Specific)</p>
                            <p class="margen-texto">Mediable (Measurable)</p>
                            <p class="margen-texto">Alcanzable (Attainable)</p>
                            <p class="margen-texto">Realista (Relevant)</p>
                            <p class="margen-texto">A tiempo (Time Based)</p>
                        </div>
                    </div>
                    <p>Un objeto SMART seria el siguiente:</p>
                    <blockquote>
                        “Bajar 40 kilogramos de masa en 6 meses”
                    </blockquote>
                    <p>Para llenar el siguiente formulario debes tomar en cuenta lo siguiente:</p>
                    <div class="margen-left-2">
                        <div class="margen-left-1">
                            <p>Objetivo: Bajar 40 kilogramos de masa en 6 meses</p>
                            <p class="margen-texto">Acción: Bajar (Es lo que quieres hacer)</p>
                            <p class="margen-texto">Cantidad: 40 (Es un número que cuantifica a la acción)</p>
                            <p class="margen-texto">Descripción de la cantidad: Kg (Describe lo que significa el número)  </p>
                            <p class="margen-texto">Tiempo: 1 año (En cuanto tiempo lo vas a finalizar)</p>
                        </div>
                        <p>Otro ejemplo:</p>
                        <div class="margen-left-1">
                            <p>Objetivo: Meditar 60 minutos al día por 3 meses </p>
                            <p class="margen-texto">Acción: Meditar</p>
                            <p class="margen-texto">Cantidad: 60</p>
                            <p class="margen-texto">Descripción de la cantidad: minutos al dia</p>
                            <p class="margen-texto">Tiempo: 3 meses</p>
                        </div>
                    </div>
                    <div class="campo enviar">
                        <div class="margen-right">
                            <a class="boton boton-naranja" href="/AIt/Objetivos/objetivo-registro.jsp">Volver</a><br>
                        </div>
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
