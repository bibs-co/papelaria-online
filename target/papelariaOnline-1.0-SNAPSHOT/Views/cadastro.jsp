<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Soft Paper</title>
  <link rel="icon" href="img/ico.png">
  <link rel="stylesheet" href="CSS/swiper-bundle.min.css">
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="CSS/style.css">
</head>
<body class="bodyp">
  <header class="header">
    <nav class="nav container flex">
      <a href="${pageContext.request.contextPath}/index.jsp#home" class="logo-content flex">
        <i class='bx bxs-book-alt logo-icon'></i>
        <span class="logo-text">soft paper.</span>
      </a>
      <div class="menu-content">
        <ul class="menu-list flex">
          <li><a href="../index.jsp#home" class="nav-link active-navlink">início</a></li>
          <li><a href="../index.jsp#produtos" class="nav-link active-navlink">comprar</a></li>
          <li><a href="../index.jsp#sobre" class="nav-link active-navlink" >sobre</a></li>
      </ul>
        <div class="media-icons flex">
          <a href="https://wa.me" target="_blank"><i class='bx bxl-whatsapp'></i></a>
          <a href="https://instagram.com" target="_blank"><i class='bx bxl-instagram-alt'></i></a>
        </div>
        <i class='bx bx-x navclose-btn'></i>
      </div>
      <div class="cart-content flex">
        <a href="login.jsp" class="nav-link">Login</a>
      </div>
      <i class='bx bx-menu-alt-right navopen-btn'></i>
    </nav>
  </header>
  
  <main class="main-cadastro">
    <div class="cadastrocard flex">
      <h2>Crie sua conta!</h2>
      <form id="cadastroForm" action="${pageContext.request.contextPath}/cadastro" method="post" class="cadastro-form">
      
        <label>Nome completo:</label>
        <input type="text" name="nome" class="input-normal" required>
        
        <label>Email:</label>
        <input type="email" name="email" class="input-normal" required>
        
        <label>Senha:</label>
        <input type="password" name="senha" class="input-normal" required
            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$"
            title="A senha deve ter pelo menos 8 caracteres, incluir 1 letra maiúscula, 1 letra minúscula e 1 caractere especial."
            onfocus="dica.showPasswordCriteria()"
            onblur="dica.hidePasswordCriteria()"
            oninput="this.setCustomValidity('')">

        <div id="passwordCriteria" style="color: white; display: none;">
          A senha deve ter pelo menos 8 caracteres,<br>
          incluir 1 letra maiúscula, 1 letra minúscula<br>
          e 1 caractere especial.
        </div>
        
        <label>Repita sua senha:</label>
        <input type="password" name="senhaRepeat" class="input-normal" required oninput="checkPasswordMatch()">
        
        <div class="forminput" style="display: flex; gap: 1rem;">
          <div class="formcoluna" style="flex: 1;">
            <label>Rua:</label><br>
            <input type="text" name="rua" class="input-medio" required>
          </div>
          <div class="formcoluna" style="flex: 2;">
            <label>Número:</label><br>
            <input type="number" name="numero" class="input-pequeno" required>
          </div>
        </div>
        
        <label>CEP:</label>
        <input type="number" name="cep" class="input-normal" required>
        <br>
        <button type="submit" class="form">Cadastrar</button>
      </form>
      <h4>Já tem uma conta? <a href="${pageContext.request.contextPath}/Views/login.jsp" style="text-decoration: underline;">Faça o login.</a></h4>
    </div>
  </main>
  
  
  <script src="${pageContext.request.contextPath}/Views/js/menu.js"></script>
  <script src="js/outros.js"></script>
</body>
</html>
