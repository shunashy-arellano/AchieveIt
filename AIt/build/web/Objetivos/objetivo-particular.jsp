<%-- 
    Document   : objetivo-particular
    Created on : 25/11/2019, 12:59:24 AM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String ido = request.getParameter("idO");
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
        ResultSet res = bd.consulta("select * from ViewObjetivo where idO = '"+ido+"'");
        ResultSet res2 = bd.consulta("call ConsultarEstrategia('"+ido+"')");
        
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
    <header class="site-usuario">
        <div class="contenedor contenedor-usuario">
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
            <div>
                <% while(resultados.next()) {%>
                <h1 class="fw-300 centrar-texto"><%out.println(resultados.getString("n"));%></h1>
                <%}%>
            </div>
        </div>
    </header>

    <main class="contenedor">
        <h2 class="centrar-texto">
            <%
                while(res.next()){
                    out.println(res.getString("ao")); 
                    out.println(res.getInt("co")); 
                    out.println(res.getString("doo"));%>
                    en/durante
                    <%out.println(res.getInt("vT"));
                    out.println(res.getString("dT")); 
                
            %>
        </h2>
        <div class="contenido-plan">
            <div class="contenedor-info">
                <div class="centrar-texto texto-obj">
                    <h3>Información</h3>
                </div>
                <div>
                    <div class="interlineado info">
                        <label for="estado">Estado:</label>
                        <p class="margen-texto">
                            <%
                                out.println(res.getString("dE")); 
                            %>
                        </p>
                    </div>
                    <div class="interlineado info">
                        <label for="impacto">Impacto: </label>
                        <p class="margen-texto">
                            <%
                                out.println(res.getString("dI")); 
                            %>
                        </p>
                    </div>
                    <div class="interlineado info">
                        <label for="impacto">Cantidad: </label>
                        <p class="margen-texto">
                            <%
                                out.println(res.getString("co")); 
                            %>
                        </p>
                    </div>    
                    <div class="interlineado info">
                        <label for="medicion">Descripción de la cantidad:</label>
                        <p class="margen-texto">
                            <%
                                out.println(res.getString("doo")); 
                            %>
                        </p>
                    </div>
                    <div class="interlineado info">
                        <label for="tiempo">Tiempo de culminación:</label>
                        <p class="margen-texto">
                            <%
                                out.println(res.getString("vT")); 
                                out.println(res.getString("dT")); 
                            %>
                        </p>
                    </div>
                    <div class="interlineado info">
                        <label for="Acción">Acción:</label>
                        <p class="margen-texto">
                            <%
                                out.println(res.getString("ao")); 
                            %>
                        </p>
                    </div>
                        <%}%>
                </div>
                <div class="alinaer-boton">
                    <form action="/AIt/Objetivos/objetivo-modificar.jsp" method = "get">
                        <%
                            out.println("<input type=hidden name='datosObj' value= "+ido+">"); 
                        %>
                        <input type="submit" class="boton boton-naranja boton-grande margen-texto" value="Modificar"/>
                    </form>
                </div>
                <div class="alinaer-boton">
                    <form action="/AIt/EliminarObjetivo" method="get">
                        <input type="submit" onclick="if (!confirm('¿Seguro que deseas eliminar el objetivo?')) { return false }" class="boton boton-naranja boton-grande" value="Eliminar"/>
                        <%
                            out.println("<input type=hidden name='datosObj' value= "+ido+">"); 
                        %>
                    </form>
                </div>
            </div>
            <div class="contenedor-estrategias">
                <div class="centrar-texto texto-obj">
                    <h3>Estrategias</h3>
                </div>
                <div class="navegacion">
                    <div class="interlineado">
                    <% while(res2.next()) {
                            int idE = 0;
                            idE = res2.getInt("idE");
                            out.println("<a href='/AIt/Estrategias/estrategia-particular.jsp?idE="+idE+"' method ='get'>"); 
                            out.println(res2.getString("ae")); 
                            out.println(res2.getInt("ce")); 
                            out.println(res2.getString("de"));%>
                            durante/cada
                            <%out.println(res2.getInt("vT"));
                            out.println(res2.getString("dT"));
                    %>
                        </a><br>
                        <%}    %>
                    </div>
                </div>
                <div class="alinaer-boton">
                    <form action="/AIt/Estrategias/estrategia-registro.jsp" method = "get">
                        <%
                            out.println("<input type=hidden name='datosObj' value= "+ido+">"); 
                        %>
                        <input type="submit" class="boton boton-naranja boton-grande" value="Crear estrategia"/>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer-content">
        <div class="contenedor">
            <div class="barra padding-1">
                <nav class="navegacion usuario margen-texto">
                    <a href="/AIt/nosotros.jsp">Nosotros</a>
                    <a href="/AIt/Blog.jsp">Blog</a>
                    <a href="/AIt/contacto.jsp">Contacto</a>
                </nav>
                <p class="margen-texto">Todos los derechos reservados</p>
            </div>
        </div>
    </footer>
</body>
</html>
<% bd.cierraConexion();
            } catch(Exception xxxD){
                out.println("<html><body>ERROR:"+xxxD.getMessage()+"</body></html>");
            }
  %>
