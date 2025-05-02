package dao;

/**
 *
 * @author bianca, pedroGabriel, pedroOliveira, pedroRodrigues
 */

import Models.Login;
import java.sql.*;

public class UsuarioDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/softpaper", "root", "");
    }

    public boolean salvar(Login usuario) throws Exception {
        String sql = "INSERT INTO usuarios (nome, email, senha, rua, num, cep) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getSenha());
            ps.setString(4, usuario.getRua());
            ps.setString(5, usuario.getNum());
            ps.setString(6, usuario.getCep());
            
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public Login autenticar(String email, String senha) throws Exception {
        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, email);
            ps.setString(2, senha);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");       
                String emailDB = rs.getString("email");    
                
                return new Login(id, nome, email, senha);
            } else {
                return null;
            }
        }
    }
}
