<%-- 
    Document   : objetivo-registro
    Created on : 26/11/2019, 11:46:43 PM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
   String ido = request.getParameter("datosObj");
   
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
        int idI = 0, idI2 = 0;
        String ao = null, desco = null;
        int cant = 0;
        bd.conectar();
        ResultSet resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
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
        <h2 class="fw-300 centrar-texto">Modificar objetivo</h2>
        <h3 class="fw-300 centrar-texto">Cambia los campos que necesites</h3>
        <div class="grid centrar-columnas">
            <div class="columnas-12">
                <img src="/AIt/img/iniciar-sesion.jpg" alt="imagen iniciar sesion">
            </div>
            <div class="columnas-10 formulario-sesion">
                <form action="/AIt/ModificarObjetivo">
                    <div class="campo">
                        <label for="signo-obj">Selecciona el signo de tu objetivo</label>
                        <select name='signo'> 
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
                        <label for="impacto-obj">¿Cuál es el impacto de tu objetivo?</label>
                        <select name='impacto'> 
                            <option value disabled selected>Seleccionar</option>
                            <%
                                resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
                                while(resultados.next()){
                                    idI = resultados.getInt("idI");
                                }
                                while(res2.next()){
                                    idI2 = res2.getInt("idI");
                                    if(idI == idI2){
                                        out.println("<option value='"+res2.getInt("idI")+"' selected>"+res2.getString("dI")+"</option>");
                                    }else{
                                        out.println("<option value='"+res2.getInt("idI")+"'>"+res2.getString("dI")+"</option>");
                                    }
                                }  
                            %>
                        </select>
                    </div>
                    <div class="campo">
                        <label for="accion-obj">¿Qué es lo que quieres hacer?</label>
                        <%
                            resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
                            while(resultados.next()){
                                ao = resultados.getString("ao");
                            }
                        %>
                        <input type='text' value="<%out.println(ao);%>" name='ao' id='accion-obj' required minlength="3" maxlenght="15">
                    </div>
                    <div class="campo">
                        <label for="cantidad-obj">¿Cuanto de esa acción quieres hacer?</label>
                        <%
                            resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
                            while(resultados.next()){
                                cant = resultados.getInt("co");
                            }
                        %>
                        <input type='number' value="<%out.print(cant);%>" name='cantidad' id="cantidad-obj" min="1" max="31"><br>
                    </div>
                    <div class="campo">
                        <label for="descripcion-obj">Describe la cantidad</label>
                        <%
                            resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
                            while(resultados.next()){
                                desco = resultados.getString("doo");
                            }
                        %>
                        <input type="text" name = "dc" id="descripcion-obj" value="<%out.println(desco);%>">
                    </div>
                    <div class="campo">
                        <label for="timepo-obj">¿En cuanto tiempo quieres cumplir tu objetivo?</label>
                        <%
                            int vt = 0;
                            resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
                            while(resultados.next()){
                                vt = resultados.getInt("vT");
                            }
                        %>
                        <input type="number" value="<%out.print(vt);%>" name="vTT" id="tiempo-obj" min="1" max="31"><br>
                        <select name='descTi'> 
                            <%
                                int idtd = 0, idtd2 = 0;        
                                resultados = bd.consulta("select * from viewobjetivo where idO = "+ ido +";");
                                while(resultados.next()){
                                    idtd = resultados.getInt("idDT");
                                }
                                while(res3.next() && res3.getInt("idTD") != 5){
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
                            out.println("<input type=hidden name='datosObj' value= "+ido+">"); 
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