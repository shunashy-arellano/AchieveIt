
package Estrategia;

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
public class ModificarEstrategia extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        
        BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
        ResultSet resultados = null;
        
        int idS, ce, vt, idDT, idE, msj = 0;
        String ae, de;
        
        idS = Integer.parseInt(request.getParameter("signo"));
        ce = Integer.parseInt(request.getParameter("cantidad"));
        vt = Integer.parseInt(request.getParameter("vt"));
        idDT = Integer.parseInt(request.getParameter("descT"));
        ae = request.getParameter("aE");
        de = request.getParameter("dE");
        
        idE = Integer.parseInt(request.getParameter("datosEst"));
        
        try {
            bd.conectar();
                 
            resultados = bd.consulta("Call ModificarEstrategia('"+idS+"', '"+idDT+"', '"+vt+"', '"+ae+"', '"+ce+"', '"+de+"', '"+idE+"');");

            String mensaje = "Se ha modificado la estrategia";
            out.println("<html>");
            out.println("<head></head>");
            //out.println("<h1> '"+idDT+"' y '"+vt+"'");
            out.println("<body onload=\"alert('"+mensaje+"'); window.location='/AIt/Objetivos/objetivos.jsp'; \"></body>");
            out.println("</html>");
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
    }// </editor-fold>

}
