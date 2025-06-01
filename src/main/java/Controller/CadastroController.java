/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Models.Login;
import dao.UsuarioDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 *
 * @author bianca, pedroGabriel, pedroOliveira, pedroRodrigues
 */
@WebServlet("/cadastro")
public class CadastroController extends HttpServlet {

    // Método para validar a senha
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

        // Validação das senhas
        if (!senha.equals(senhaRepeat)) {
            request.setAttribute("erro", "As senhas não conferem.");
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
            return;
        }

        if (!isPasswordValid(senha)) {
            request.setAttribute("erro", "A senha deve ter pelo menos 8 caracteres, incluir 1 letra maiúscula, 1 minúscula e 1 caractere especial.");
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
            return;
        }
        
        try {
            // Criptografa a senha utilizando hash SHA-256
            String hashedSenha = EncryptionUtil.hashSHA256(senha);
            // Criptografa o e-mail utilizando AES
            String encryptedEmail = EncryptionUtil.encrypt(email);

            // Cria e popula o objeto para cadastro
            Login login = new Login();
            login.setNome(nome);
            login.setEmail(encryptedEmail);
            login.setSenha(hashedSenha);
            login.setRua(rua);
            login.setNum(numero);
            login.setCep(cep);

            UsuarioDAO dao = new UsuarioDAO();
            dao.salvar(login);

            response.sendRedirect(request.getContextPath() + "/Views/login.jsp");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro de criptografia: " + e.getMessage());
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao cadastrar: " + e.getMessage());
            request.getRequestDispatcher("/Views/cadastro.jsp").forward(request, response);
        }
    }
    
    // Classe interna para métodos de criptografia e hashing
    public static class EncryptionUtil {

        // Método para gerar hash SHA-256
        public static String hashSHA256(String input) throws NoSuchAlgorithmException {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(hash);
        }
        
        private static String bytesToHex(byte[] hash) {
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        }
        
        private static final String ALGORITHM = "AES";
        private static final byte[] keyValue = new byte[] { 'S','e','c','r','e','t','K','e','y','1','2','3','4','5','6','7' };
        
        public static String encrypt(String valueToEnc) throws Exception {
            Key key = generateKey();
            Cipher c = Cipher.getInstance(ALGORITHM);
            c.init(Cipher.ENCRYPT_MODE, key);
            byte[] encValue = c.doFinal(valueToEnc.getBytes());
            return Base64.getEncoder().encodeToString(encValue);
        }
        
        public static String decrypt(String encryptedValue) throws Exception {
            Key key = generateKey();
            Cipher c = Cipher.getInstance(ALGORITHM);
            c.init(Cipher.DECRYPT_MODE, key);
            byte[] decodedValue = Base64.getDecoder().decode(encryptedValue);
            byte[] decValue = c.doFinal(decodedValue);
            return new String(decValue);
        }
        
        // Gera a chave a partir do array de bytes definido
        private static Key generateKey() throws Exception {
            return new SecretKeySpec(keyValue, ALGORITHM);
        }
    }
}
