
package Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author aramo
 */
public class Registrarse extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet resultados = null;
        
        String cadenaConexion = "jdbc:mysql://127.0.0.1:3306/Achieveit";
        String usuarioBD= "root";
        String clave ="d4t4b4s3_m1sql";
        
        String correo, contrasena, mensaje, nombre;
            correo = request.getParameter("correo"); //email es del jsp
            contrasena = request.getParameter("pass");//psw es del jsp
            nombre = request.getParameter("nombre");
            
        int idU = 0;
        int msjbd = 0;
        
        try {
            HttpSession sesion = request.getSession();
            
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection (cadenaConexion,usuarioBD,clave);
            sentencia = conexion.createStatement();
            
            resultados = sentencia.executeQuery("Call RegistrarUsuario('"+nombre+"', '"+correo+"','"+contrasena+"');");
            
            while(resultados.next()){
                idU = resultados.getInt("idU");
                msjbd = resultados.getInt("msj");
            }
                
            if(msjbd == 0){
                sesion.setAttribute("Usuario", nombre);
                mensaje = "Cuenta creada exitosamente";
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); window.location='index.jsp'; \"></body>");
                out.println("</html>");
                //response.sendRedirect("Usuario/MiPerfil.jsp");
            }
            mensaje = "Ya existe el usuario, inicia sesión con tus datos";
            
            if(idU ==0){
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body onload=\"alert('"+mensaje+"'); javascript:history.back(); \"></body>");
                out.println("</html>");
                response.sendRedirect("iniciar_sesion.jsp");
            }
            
        }
        catch (ClassNotFoundException e1){
            out.println("ERROR:No encuentro el driver de la BD: "+ e1.getMessage());
        }
        catch (SQLException e2) {
                //Error SQL: login/passwd mal
		out.println("ERROR:Fallo en SQL: "+e2.getMessage());
	}
        finally {
                //Finalmente desconecto de la BD
		try {
			if (conexion!=null)
				conexion.close();
		} catch (SQLException e3) {
			out.println("ERROR:Fallo al desconectar de la BD: "+
				e3.getMessage());
		}
	
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
