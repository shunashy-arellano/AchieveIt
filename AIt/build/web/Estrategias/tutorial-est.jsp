<%-- 
    Document   : tutorial-est
    Created on : 28/11/2019, 03:28:15 AM
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
        <h2 class="fw-300 centrar-texto">¡Establece tus estrategias!</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="/AIt/img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-oe">
                <form action="#">
                    <h3 class="centrar-texto fw-300">Cumple tus objetivos creando estrategias con SMART</h3>
                    <p>Para que una estrategia sea inteligente debe cumplir con lo siguiente:</p>
                    <div class="margen-left-2">
                        <p>Tiene que ser...</p>
                        <div class="margen-left-1">
                            <p class="margen-texto">Especifica (Specific)</p>
                            <p class="margen-texto">Mediable (Measurable)</p>
                            <p class="margen-texto">Alcanzable (Attainable)</p>
                            <p class="margen-texto">Realista (Relevant)</p>
                            <p class="margen-texto">A tiempo (Time Based)</p>
                        </div>
                    </div>
                    <p>Una estrategia te ayudara a cumplir un objetivo en específico, por lo tanto debe 
                        ser coherente con el objetivo al que pertenecer.</p>
                    <p>Si el objetivo es por ejemplo:</p>
                    <blockquote>
                        “Bajar 40 kilogramos de masa en 6 meses”
                    </blockquote>
                    <p>Una estrategia SMART seria la siguiente:</p>
                    <blockquote>
                        Corre 30 minutos una vez al dia
                    </blockquote>
                    <p>Para llenar el siguiente formulario debes tomar en cuenta lo siguiente:</p>
                    <div class="margen-left-2">
                        <div class="margen-left-1">
                            <p>Estrategia: Correr 30 minutos una vez al dia</p>
                            <p class="margen-texto">Acción: Correr (Es lo que quieres hacer)</p>
                            <p class="margen-texto">Cantidad: 30 (Es un número que cuantifica a la acción)</p>
                            <p class="margen-texto">Descripción de la cantidad: minutos (Describe lo que significa el número)  </p>
                            <p class="margen-texto">Tiempo: 1 vez por dia(Cuantas veces vas a realiazar esta estrategia)</p>
                        </div>
                    </div>
                    <p>Para que tu objetivo se realice con el mayor éxito posible establece varias estrategias.</p>
                    <div class="campo enviar">
                        <div class="margen-right">
                            <a class="boton boton-naranja" href="/AIt/Objetivos/estrategia-registro.jsp">Volver</a><br>
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