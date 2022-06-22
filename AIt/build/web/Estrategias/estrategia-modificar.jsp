<%-- 
    Document   : estrategia-modificar
    Created on : 28/11/2019, 02:08:37 AM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String ide = request.getParameter("datosEst");
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
        int idS = 0, idS2 = 0;
        String ae = null, desce = null;
        int cant = 0;
        int vt = 0, idDT = 0;
        bd.conectar();
        ResultSet resultados = bd.consulta("select * from ViewEstrategia where idE = "+ ide +";");
        ResultSet res1 = bd.consulta("select * from ViewCatSigno;");
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
        <h2 class="fw-300 centrar-texto">Modificar estrategia</h2>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="/AIt/img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-sesion">
                <form action="/AIt/ModificarEstrategia">
                    <div class="campo">
                        <label for="signo-est">Selecciona el signo de tu estrategia</label>
                        <select name='signo'> 
                            <option value disabled selected>Seleccionar</option>
                            <%
                                while(resultados.next()){
                                    idS = resultados.getInt("idS");
                                }
                                while(res1.next()){
                                    idS2 = res1.getInt("idS");
                                    if(idS == idS2){
                                        out.println("<option value='"+res1.getInt("idS")+"' selected>"+res1.getString("dS")+"</option>");
                                    }else{
                                        out.println("<option value='"+res1.getInt("idS")+"'>"+res1.getString("dS")+"</option>");
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="campo">
                        <label for="accion-est">¿Qué es lo que quieres hacer?</label>
                        <%
                            resultados = bd.consulta("select * from ViewEstrategia where idE = "+ ide +";");
                            while(resultados.next()){
                                ae = resultados.getString("ae");
                            }
                        %>
                        <input type="text" value="<%out.println(ae);%>" name="aE" id="accion-est" placeholder="Escribe la acción">
                    </div>
                    <div class="campo">
                        <label for="cantidad-est">¿Cuanto de esa acción quieres hacer?</label>
                        <%
                            resultados = bd.consulta("select * from ViewEstrategia where idE = "+ ide +";");
                            while(resultados.next()){
                                cant = resultados.getInt("ce");
                            }
                        %>
                        <input type="number" value="<%out.print(cant);%>" name="cantidad" id="cantidad-est" min="1" max="2000"><br>
                    </div>
                    <div class="campo">
                        <label for="descripcion-est">Describe la cantidad</label>
                        <%
                            resultados = bd.consulta("select * from ViewEstrategia where idE = "+ ide +";");
                            while(resultados.next()){
                                desce = resultados.getString("de");
                            }
                        %>
                        <input type="text" value="<%out.println(desce);%>" name = "dE" id="descripcion-est" placeholder="Introduce la cantidad">
                    </div>
                    <div class="campo">
                        <label for="timepo-est">¿Cuantas veces vas a realizar esta estrategia?</label>
                        <%
                            resultados = bd.consulta("select * from ViewEstrategia where idE = "+ ide +";");
                            while(resultados.next()){
                                vt = resultados.getInt("vT");
                            }
                        %>
                        <input type="number" value="<%out.print(vt);%>" name="vt" id="tiempo-obj" min="1" max="31"><br>
                        <select name='descT'> 
                            <option value disabled selected>Seleccionar</option>
                            <%
                                int idtd = 0, idtd2 = 0;        
                                resultados = bd.consulta("select * from ViewEstrategia where idE = "+ ide +";");
                                while(resultados.next()){
                                    idtd = resultados.getInt("idDT");
                                }
                                while(res3.next()){
                                    idtd2 = res3.getInt("idTD");
                                    if(idtd == idtd2){
                                        out.println("<option value='"+res3.getInt("idTD")+"' selected>"+res3.getString("dT")+"</option>");
                                    }else{
                                        out.println("<option value='"+res3.getInt("idTD")+"'>"+res3.getString("dT")+"</option>");
                                    }
                                }  
                            %>
                        </select>
                    </div>
                    <div class="campo enviar">
                        <%
                            out.println("<input type=hidden name='datosEst' value= "+ide+">"); 
                        %>
                        <input type="submit" value="Modificar" class="boton boton-naranja">
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