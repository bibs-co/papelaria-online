package Controller;

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
            String encryptedEmail = CadastroController.EncryptionUtil.encrypt(email);
            String hashedSenha = CadastroController.EncryptionUtil.hashSHA256(senha);

            UsuarioDAO dao = new UsuarioDAO();
            Login usuario = dao.autenticar(encryptedEmail, hashedSenha);

            if (usuario != null) {
                System.out.println("Login válido. Usuário: " + usuario.getNome());
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                response.sendRedirect(request.getContextPath() + "/Views/produtos.jsp");
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
