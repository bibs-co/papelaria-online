package Controller;

import Models.Login;
import dao.UsuarioDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/cadastro")
public class CadastroController extends HttpServlet {

    private boolean isPasswordValid(String senha) {
        if (senha == null) {
            System.out.println("Senha nula recebida.");
            return false;
        }
        boolean valido = senha.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$");
        System.out.println("Senha testada: " + senha + " | Válida? " + valido);
        return valido;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String senhaRepeat = request.getParameter("senhaRepeat");
        String rua = request.getParameter("rua");
        String numero = request.getParameter("numero");
        String cep = request.getParameter("cep");

        // Valida se as senhas coincidem
        if (!senha.equals(senhaRepeat)) {
            request.setAttribute("erro", "As senhas não conferem.");
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
            return;
        }

        // Valida o padrão da senha
        if (!isPasswordValid(senha)) {
            request.setAttribute("erro",
                "A senha deve ter pelo menos 8 caracteres, incluir 1 letra maiúscula, 1 letra minúscula e 1 caractere especial.");
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
            return;
        }
        
        try {
            Login login = new Login();
            login.setNome(nome);
            login.setEmail(email);
            login.setSenha(senha);
            login.setRua(rua);
            login.setNum(numero);  
            login.setCep(cep);

            UsuarioDAO dao = new UsuarioDAO();
            dao.salvar(login);

            response.sendRedirect(request.getContextPath() + "/Views/login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao cadastrar: " + e.getMessage());
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
        }
    }
}
