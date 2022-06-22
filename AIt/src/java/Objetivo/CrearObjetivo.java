
package Objetivo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aramo
 */
public class CrearObjetivo extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        
        BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
        ResultSet resultados = null;
        
        HttpSession sesion = request.getSession();
        String email = sesion.getAttribute("Usuario").toString();
        
        int idS, idI, co, vt, idDT, idU = 0;
        int res;
        String ao, doo;
        
        idS = Integer.parseInt(request.getParameter("signo"));
        idI = Integer.parseInt(request.getParameter("impacto"));
        co = Integer.parseInt(request.getParameter("cantidad"));
        vt = Integer.parseInt(request.getParameter("vt"));
        idDT = Integer.parseInt(request.getParameter("descT"));
        ao = request.getParameter("ao");
        doo = request.getParameter("dc");
        
        
        try{
            bd.conectar();
            resultados = bd.consulta("call ConsultarUsuario('"+email+"');");
            while(resultados.next()){
                idU = resultados.getInt("idU");
            }
            
            res = bd.insertar("Call CrearObjetivo('"+idS+"', '"+idI+"', '"+idDT+"', '"+vt+"', '"+ao+"', '"+co+"', '"+doo+"', 1,'"+idU+"');");
            if(res != 0){
                String mensaje = "Se ha creado el objetivo";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); window.location='/AIt/Objetivos/objetivos.jsp'; \"></body>");
                out.println("</html>");
            }
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
