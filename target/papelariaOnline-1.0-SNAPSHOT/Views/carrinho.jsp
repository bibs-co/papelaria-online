<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Soft Paper</title>
  <link rel="icon" href="${pageContext.request.contextPath}/Views/img/ico.png">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/CSS/swiper-bundle.min.css">
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/CSS/style.css">
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
          <li>
            <a href="${pageContext.request.contextPath}/index.jsp#home" class="nav-link active-navlink">início</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/Views/produtos.jsp" class="nav-link active-navlink">comprar</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/index.jsp#sobre" class="nav-link active-navlink">sobre</a>
          </li>
          <li class="login-header">
            <c:choose>
              <c:when test="${empty sessionScope.usuario}">
                <a href="${pageContext.request.contextPath}/Views/login.jsp" class="nav-link active-navlink">login</a>
              </c:when>
              <c:otherwise>
                <a href="${pageContext.request.contextPath}/logout" class="nav-link">logout</a>
              </c:otherwise>
            </c:choose>
          </li>
        </ul>
        <div class="media-icons flex">
          <a href="https://wa.me" target="_blank"><i class='bx bxl-whatsapp'></i></a>
          <a href="https://www.instagram.com" target="_blank"><i class='bx bxl-instagram-alt'></i></a>
        </div>
        <i class='bx bx-x navclose-btn'></i>
        <a href="${pageContext.request.contextPath}/Views/carrinho.jsp">
          <i class='bx bxs-cart cartnav'></i>
        </a>
      </div>
      
      <div class="cart-content flex" style="align-items: center;">
        <c:if test="${not empty sessionScope.usuario}">
          <span class="nav-link" style="color: white; margin-right: 5px;">
            Olá, ${sessionScope.usuario.nome}
          </span>
          <a href="${pageContext.request.contextPath}/logout" title="Logout" style="margin-right: 10px;">
            <i class="bx bx-log-out" style="color: white; font-size: 1.5rem;"></i>
          </a>
        </c:if>
        <a href="${pageContext.request.contextPath}/Views/carrinho.jsp">
          <i class='bx bxs-cart cart-icon'></i>
        </a>
        <c:if test="${empty sessionScope.usuario}">
          <a href="${pageContext.request.contextPath}/Views/login.jsp" class="nav-link">Login</a>
        </c:if>
      </div>
      
      <i class='bx bx-menu-alt-right navopen-btn'></i>
    </nav>
  </header>
  <script src="${pageContext.request.contextPath}/Views/js/menu.js"></script>
</body>
</html>
