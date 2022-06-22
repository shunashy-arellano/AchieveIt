<%-- 
    Document   : estrategia-registro
    Created on : 28/11/2019, 12:34:59 AM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String ido = request.getParameter("datosObj");
%>

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
        ResultSet res1 = bd.consulta("select * from ViewCatSigno;");
        ResultSet res2 = bd.consulta("select * from ViewCatImpacto;");
        ResultSet res3 = bd.consulta("select * from ViewCatDTiempo;");
        
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Estrategia</title>
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
                    <a href="/AIt/Usuario/usuario.jsp">Perfil</a>
                </nav>
            </div>
        </div>
    </header>
    <main class="contenedor seccion">
        <h2 class="fw-300 centrar-texto">Registrar estrategia</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="/AIt/img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-sesion">
                <form action="/AIt/CrearEstrategia">
                    <div class="campo">
                        <label for="signo-est">Selecciona el signo de tu estrategia</label>
                        <select name='signo'> 
                            <option value disabled selected>Seleccionar</option>
                            <%
                                while(res1.next()){
                                    out.println("<option value='"+res1.getInt("idS")+"'>"+res1.getString("dS")+"</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="campo">
                        <label for="accion-est">¿Qué es lo que quieres hacer?</label>
                        <input type="text" name="aE" id="accion-est" placeholder="Escribe la acción">
                    </div>
                    <div class="campo">
                        <label for="cantidad-est">¿Cuanto de esa acción quieres hacer?</label>
                        <input type="number" name="cantidad" id="cantidad-est" min="1" max="1000"><br>
                    </div>
                    <div class="campo">
                        <label for="descripcion-est">Describe la cantidad</label>
                        <input type="text" name = "dc" id="descripcion-est" placeholder="Introduce la cantidad">
                    </div>
                    <div class="campo">
                        <label for="timepo-est">¿Cuantas veces vas a realizar esta estrategia?</label>
                        <input type="number" name="vt" id="tiempo-obj" min="1" max="31"><br>
                        <select name='descT'> 
                            <option value disabled selected>Seleccionar</option>
                            <%
                                while(res3.next()){
                                    out.println("<option value='"+res3.getInt("idTD")+"'>"+res3.getString("dT")+"</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="campo enviar">
                        <%
                            out.println("<input type=hidden name='datosObj' value= "+ido+">"); 
                        %>
                        <div class="margen-right">
                            <a class="boton boton-naranja" href="/AIt/Estrategias/tutorial-est.jsp">Tutorial</a><br>
                        </div>
                        <input type="submit" value="Registar" class="boton boton-naranja">
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
<% bd.cierraConexion();
            } catch(Exception xxxD){
                out.println("<html><body>ERROR:"+xxxD.getMessage()+"</body></html>");
            }
  %>