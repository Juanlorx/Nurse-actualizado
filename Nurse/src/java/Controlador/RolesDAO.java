package Controlador;

import Modelo.Roles;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RolesDAO {
    // Configura tus datos de conexión aquí
    private final String URL = "jdbc:mysql://localhost:3306/tu_base_de_datos";
    private final String USER = "root";
    private final String PASS = "password";

    public void insertar(Roles rol) {
        String sql = "INSERT INTO roles (descripcion) VALUES (?)";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            // Usando el nuevo nombre del método: getDescripcion()
            ps.setString(1, rol.getDescripcion());
            ps.executeUpdate();
            System.out.println(">> Éxito: Rol guardado correctamente.");
            
        } catch (SQLException e) {
            System.err.println("Error al insertar: " + e.getMessage());
        }
    }

    public List<Roles> consultar() {
        List<Roles> lista = new ArrayList<>();
        String sql = "SELECT idRoles, descripcion FROM roles";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Roles r = new Roles();
                // Usando los nuevos setters de tu imagen
                r.setIdRoles(rs.getInt("idRoles"));
                r.setDescripcion(rs.getString("descripcion"));
                lista.add(r);
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar: " + e.getMessage());
        }
        return lista;
    }
}