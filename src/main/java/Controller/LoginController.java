/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author bianca, pedroGabriel, pedroOliveira, pedroRodrigues
 */

import Models.Login;
import dao.UsuarioDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        // Recupera os dados do formulário
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        System.out.println("Tentativa de login - Email: " + email + " | Senha: " + senha);

        try {
            // Criptografa o email e gera o hash da senha
            String encryptedEmail = CadastroController.EncryptionUtil.encrypt(email);
            String hashedSenha = CadastroController.EncryptionUtil.hashSHA256(senha);

            UsuarioDAO dao = new UsuarioDAO();
            Login usuario = dao.autenticar(encryptedEmail, hashedSenha);

            if (usuario != null) {
                System.out.println("Login válido. Usuário: " + usuario.getNome());
                // Descriptografa o e-mail para exibição em formato legível
                try {
                    String decryptedEmail = CadastroController.EncryptionUtil.decrypt(usuario.getEmail());
                    usuario.setEmail(decryptedEmail);
                } catch (Exception ex) {
                    ex.printStackTrace();
                    // Opcional: definir um valor padrão ou tentar outra ação se a descriptografia falhar
                }
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                response.sendRedirect(request.getContextPath() + "/index.jsp#produtos");
            } else {
                System.out.println("Login inválido - Email ou senha incorretos.");
                request.setAttribute("erro", "Email ou senha incorretos.");
                request.getRequestDispatcher("/Views/login.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro de criptografia: " + e.getMessage());
            request.getRequestDispatcher("/Views/login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Ocorreu um erro: " + e.getMessage());
            request.getRequestDispatcher("/Views/login.jsp").forward(request, response);
        }
    }
}
