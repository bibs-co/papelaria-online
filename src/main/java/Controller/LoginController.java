package Controller;

import Models.Login;
import dao.UsuarioDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        System.out.println("Tentativa de login - Email: " + email + " | Senha: " + senha);

        try {
            UsuarioDAO dao = new UsuarioDAO();
            Login usuario = dao.autenticar(email, senha);

            if (usuario != null) {
                System.out.println("Login válido. Usuário: " + usuario.getNome());
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                
                response.sendRedirect(request.getContextPath() + "/Views/produtos.html");
            } else {
                System.out.println("Login inválido - Email ou senha incorretos.");
                request.setAttribute("erro", "Email ou senha incorretos.");
                request.getRequestDispatcher("/Views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Ocorreu um erro: " + e.getMessage());
            request.getRequestDispatcher("/Views/login.jsp").forward(request, response);
        }
    }
}
