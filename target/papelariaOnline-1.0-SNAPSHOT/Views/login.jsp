<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soft Paper - Login</title>
    <link rel="icon" href="${pageContext.request.contextPath}/Views/img/ico.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/CSS/swiper-bundle.min.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/CSS/style.css">
</head>
<body class="bodyp">
    <header class="header">
        <nav class="nav container flex">
            <a href="${pageContext.request.contextPath}/index.html#home" class="logo-content flex">
                <i class='bx bxs-book-alt logo-icon'></i>
                <span class="logo-text">soft paper.</span>
            </a>
            <div class="menu-content">
                <ul class="menu-list flex">
                    <li>
                        <a href="${pageContext.request.contextPath}/index.html#home" class="nav-link active-navlink">início</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Views/produtos.jsp" class="nav-link active-navlink">comprar</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/index.html#sobre" class="nav-link active-navlink">sobre</a>
                    </li>
                    <li class="login-header">
                        <a href="${pageContext.request.contextPath}/Views/login.jsp" class="nav-link active-navlink">login</a>
                    </li>
                </ul>
                <div class="media-icons flex">
                    <a href="https://wa.me" target="_blank">
                        <i class='bx bxl-whatsapp'></i>
                    </a>
                    <a href="https://instagram.com" target="_blank">
                        <i class='bx bxl-instagram-alt'></i>
                    </a>
                </div>
                <i class='bx bx-x navclose-btn'></i>
                <a href="${pageContext.request.contextPath}/Views/carrinho.jsp">
                    <i class='bx bxs-cart cartnav'></i>
                </a>
            </div>
            <div class="cart-content flex">
                <a href="${pageContext.request.contextPath}/Views/carrinho.jsp">
                    <i class='bx bxs-cart cart-icon'></i>
                </a>
                <a href="${pageContext.request.contextPath}/Views/login.jsp" class="nav-link">Login</a>
            </div>
            <i class='bx bx-menu-alt-right navopen-btn'></i>
        </nav>
    </header>
    
    <main class="main-login">
        <div class="logincard flex">
            <h2>Bem vindo de volta!</h2>
            <c:if test="${not empty erro}">
                <div class="alert alert-danger" style="color: red; font-weight: bold;">
                    ${erro}
                </div>
            </c:if>
            
            <form action="${pageContext.request.contextPath}/login" method="post" class="login-form">
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="senha" placeholder="Senha" required>
                <br>
                <button class="form" type="submit">Entrar</button>
            </form>
            
            <h4>Não tem uma conta? 
                <a href="${pageContext.request.contextPath}/Views/cadastro.jsp" style="text-decoration: underline;">Cadastre-se.</a>
            </h4>
        </div>
    </main>
    
    <script src="${pageContext.request.contextPath}/Views/js/menu.js"></script>
</body>
</html>
