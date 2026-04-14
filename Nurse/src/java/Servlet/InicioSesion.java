/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import Controlador.UsuariosDAO;
import Modelo.Usuarios;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

/**
 *
 * @author Aprendiz
 */
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/Iniciar")
public class InicioSesion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Captura los datos del formulario
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("pass");

        // Consulta el usuario en la base de datos
        UsuariosDAO miDao = new UsuariosDAO();
        Usuarios usuarioBD = miDao.ConsultaUsuarios(usuario);

        if (usuarioBD == null) {
            // Usuario no existe
            request.setAttribute("mensaje", "El usuario no existe");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else if (!usuarioBD.getClave().equals(password)) {
            // Contraseña incorrecta
            request.setAttribute("mensaje", "Clave incorrecta");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else {
            // Login exitoso
            request.setAttribute("mensaje", "Bienvenido: " 
                + usuarioBD.getNombre() + " " + usuarioBD.getApellido());

            request.setAttribute("idUsuario", usuarioBD.getDocumento());
            // Redirecciona al menú principal
            request.getRequestDispatcher("Vista/MenuPrincipal.jsp")
                   .forward(request, response);
        }
    }
}
