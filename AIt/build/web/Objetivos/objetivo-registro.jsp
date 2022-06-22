<%-- 
    Document   : objetivo-registro
    Created on : 26/11/2019, 11:46:43 PM
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
    <title>Objetivos</title>
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
        <h2 class="fw-300 centrar-texto">Registrar objetivo</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="/AIt/img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-sesion">
                <form action="/AIt/CrearObjetivo">
                    <div class="campo">
                        <label for="signo-obj">Selecciona el signo de tu objetivo</label>
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
                        <label for="impacto-obj">¿Cuál es el impacto de tu objetivo?</label>
                        <select name='impacto'> 
                            <option value disabled selected>Seleccionar</option>
                            <%
                                while(res2.next()){
                                    out.println("<option value='"+res2.getInt("idI")+"'>"+res2.getString("dI")+"</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="campo">
                        <label for="accion-obj">¿Qué es lo que quieres hacer?</label>
                        <input type="text" name="ao" id="accion-obj" placeholder="Ej. 'caminar', 'bajar'">
                    </div>
                    <div class="campo">
                        <label for="cantidad-obj">¿Cuanto de esa acción quieres hacer?</label>
                        <input type="number" name="cantidad" id="cantidad-obj" min="1" max="1000"><br>
                    </div>
                    <div class="campo">
                        <label for="descripcion-obj">Describe la cantidad</label>
                        <input type="text" name = "dc" id="descripcion-obj" placeholder="Ej. 'kg', 'minutos'">
                    </div>
                    <div class="campo">
                        <label for="timepo-obj">¿En cuanto tiempo quieres cumplir tu objetivo?</label>
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
                        <div class="margen-right">
                            <a class="boton boton-naranja" href="/AIt/Objetivos/tutorial-obj.jsp">Tutorial</a><br>
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