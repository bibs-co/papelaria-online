/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Models.Login;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author henri
 */
    
    @WebServlet("/login") // Mapeia este servlet para a URL "/login". Essa URL deve ser usada no atributo "action" do seu formulário.
    public class LoginController extends HttpServlet {

        // Lista dummy de usuários para simular uma base de dados.
        private List<Login> usuarios;

        // O método init() é chamado quando o servlet é iniciado.
        @Override
        public void init() throws ServletException {
            super.init();
            usuarios = new ArrayList<>();
            // Adiciona um usuário dummy (id, email, senha) usando o construtor que recebe apenas esses parâmetros.
            usuarios.add(new Login(1, "pedro@example.com", "12345"));
            // Você pode adicionar mais usuários se desejar.
        }

        // O método doPost() trata as requisições HTTP do tipo POST enviadas pelo formulário.
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            // Recupera os parâmetros "email" e "senha" do formulário.
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            // Variável que indica se o login foi efetuado com sucesso.
            boolean loginValido = false;
            // Percorre a lista dummy de usuários para verificar as credenciais.
            for (Login usuario : usuarios) {
                if (usuario.getEmail().equals(email) && usuario.getSenha().equals(senha)) {
                    loginValido = true;
                    break;
                }
            }

            // Configura o tipo de conteúdo da resposta.
            response.setContentType("text/html;charset=UTF-8");

            // Se as credenciais forem válidas, exibe mensagem de sucesso; caso contrário, exibe mensagem de erro.
            if (loginValido) {
                // Aqui você pode redirecionar para outra página ou criar uma sessão, por exemplo.
                response.getWriter().println("<h1>Login realizado com sucesso!</h1>");
            } else {
                response.getWriter().println("<h1>Email ou senha incorretos.</h1>");
            }
        }
    }

    

