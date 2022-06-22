
package Estrategia;

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
public class Monedas extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        
        BaseDatos.Achieveit bd = new BaseDatos.Achieveit();
        ResultSet resultados = null;
        
        int idU, ide = 0;
        
        HttpSession sesion = request.getSession();
        String email;
        email = sesion.getAttribute("Usuario").toString();
        
        idU = Integer.parseInt(request.getParameter("signo"));
        
        try{
            bd.conectar();
            resultados = bd.consulta("call ConsultarUsuario('"+email+"');");
            while(resultados.next()){
                idU = resultados.getInt("idU");
            }
            
            resultados = bd.consulta("call ModificarMonedas('"+idU+"');");
            
            out.println("<html>");
            out.println("<head></head>");
            //out.println("<h1> '"+idDT+"' y '"+vt+"'");
            out.println("<body onload= window.location='/AIt/Usuario/usuario.jsp'; \"></body>");
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
