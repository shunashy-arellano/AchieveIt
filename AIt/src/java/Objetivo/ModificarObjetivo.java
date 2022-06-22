
package Objetivo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aramo
 */
public class ModificarObjetivo extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        
        BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
        ResultSet resultados = null;
        
        int idS, idI, co, vt, idDT, idO, msj = 0;
        String ao, doo;
        
        idS = Integer.parseInt(request.getParameter("signo"));
        idI = Integer.parseInt(request.getParameter("impacto"));
        co = Integer.parseInt(request.getParameter("cantidad"));
        vt = Integer.parseInt(request.getParameter("vTT"));
        idDT = Integer.parseInt(request.getParameter("descTi"));
        ao = request.getParameter("ao");
        doo = request.getParameter("dc");
        
        idO = Integer.parseInt(request.getParameter("datosObj"));
            
        try{
            bd.conectar();
                 
            resultados = bd.consulta("Call ModificarObjetivo('"+idS+"', '"+idI+"', '"+idDT+"', '"+vt+"', '"+ao+"', '"+co+"', '"+doo+"', '"+idO+"');");

            String mensaje = "Se ha modificado el objetivo";
            out.println("<html>");
            out.println("<head></head>");
            //out.println("<h1> '"+idDT+"' y '"+vt+"'");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/AIt/Usuario/usuario.jsp'; \"></body>");
            out.println("</html>");
            
        }catch (SQLException e2) {
                //Error SQL: login/passwd mal
		out.println("ERROR:Fallo en SQL: "+e2.getMessage());
	}
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
