
package Objetivo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author aramo
 */
public class EliminarObjetivo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
        ResultSet resultados = null;
        
        int idObj = Integer.parseInt(request.getParameter("datosObj"));
        int msj = 0;
       
        try{
            bd.conectar();
            bd.modificar("call EliminarObjetivo('"+idObj+"');");
            
            String mensaje = "Se ha eliminado el objetivo";
            out.println("<html>");
            out.println("<head></head>");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/AIt/Objetivos/objetivos.jsp'; \"></body>");
            out.println("</html>");
            
            bd.cierraConexion();
            
        }
        catch (SQLException e2) {
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
    }
}
