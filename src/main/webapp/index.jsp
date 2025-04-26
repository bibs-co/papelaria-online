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
  <link rel="stylesheet" href="Views/CSS/swiper-bundle.min.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="Views/CSS/style.css">
</head>
<body class="bodyindex">
  <header class="header">
    <nav class="nav container flex">
      <a href="#home" class="logo-content flex">
        <i class='bx bxs-book-alt logo-icon'></i>
        <span class="logo-text">soft paper.</span>
      </a>

      <div class="menu-content">
        <ul class="menu-list flex">
          <li><a href="#home" class="nav-link active-navlink">início</a></li>
          <li><a href="Views/produtos.jsp" class="nav-link active-navlink">comprar</a></li>
          <li><a href="#sobre" class="nav-link active-navlink">sobre</a></li>
          <li class="login-header">
            <c:choose>
              <c:when test="${empty sessionScope.usuario}">
                <a href="Views/login.jsp" class="nav-link active-navlink">login</a>
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
        <a href="Views/carrinho.jsp"><i class='bx bxs-cart cartnav'></i></a>
      </div>

      <div class="cart-content flex">
        <!-- Se o usuário estiver logado, exibe nome e logout; senão, mostra link para login -->
        <c:if test="${not empty sessionScope.usuario}">
          <span class="nav-link" style="color: white; margin-right: 5px;">
            Olá, ${sessionScope.usuario.nome}
          </span>
          <a href="${pageContext.request.contextPath}/logout" title="Logout">
            <i class="bx bx-log-out" style="color: white; font-size: 1.5rem;"></i>
          </a>
        </c:if>
        <a href="Views/carrinho.jsp">
          <i class='bx bxs-cart cart-icon'></i>
        </a>
        <c:if test="${empty sessionScope.usuario}">
          <a href="Views/login.jsp" class="nav-link">Login</a>
        </c:if>
      </div>

      <i class='bx bx-menu-alt-right navopen-btn'></i>
    </nav>
  </header>

  <main>
    <section class="home" id="home">
      <div class="home-content">
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img src="Views/img/img1.png" alt="" class="homeimg">
              <div class="home-details">
                <div class="home-text">
                  <h4 class="homesub">a sua personalidade em folhas</h4>
                  <h2 class="hometitle">qualidade e beleza</h2>
                </div>
                <button class="btn">
                  <a href="Views/produtos.jsp">Produtos</a>
                </button>
              </div>
            </div>
            <div class="swiper-slide">
              <img src="Views/img/img2.png" alt="" class="homeimg">
              <div class="home-details">
                <div class="home-text">
                  <h4 class="homesub">a sua personalidade em folhas</h4>
                  <h2 class="hometitle">qualidade e beleza</h2>
                </div>
                <button class="btn">
                  <a href="Views/produtos.jsp">Produtos</a>
                </button>
              </div>
            </div>
            <div class="swiper-slide">
              <img src="Views/img/img3.png" alt="" class="homeimg">
              <div class="home-details">
                <div class="home-text">
                  <h4 class="homesub">a sua personalidade em folhas</h4>
                  <h2 class="hometitle">qualidade e beleza</h2>
                </div>
                <button class="btn">
                  <a href="Views/produtos.jsp">Produtos</a>
                </button>
              </div>
            </div>
          </div>
          <div class="swiper-button-next swiper-navbtn"></div>
          <div class="swiper-button-prev swiper-navbtn"></div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>

    <section class="section about" id="sobre">
      <div class="about-content container">
        <div class="about-imagecontent">
          <img src="Views/img/sobre.jpg" alt="" class="about-img">
          <div class="aboutimg-textbox">
            <i class="bx bxs-heart-circle hearticon flex"></i>
            <p class="content-description">
              Produtos maravilhosos, não dá pra escolher só um!
            </p>
          </div>
        </div>
        <div class="about-details">
          <div class="about-text">
            <h4 class="content-subs">Nossa loja</h4>
            <h2 class="content-title">Papelaria Alternativa</h2>
            <p class="content-description">
              com a missão de levar produtos <b>personalizados</b> pra quem tem a <b>personalidade</b> forte.
            </p>
            <ul class="about-lists flex">
              <li class="about-list">Cadernos</li>
              <li class="about-list dot">.</li>
              <li class="about-list">Planners</li>
              <li class="about-list dot">.</li>
              <li class="about-list">Agendas</li>
            </ul>
            <div class="about-icon">
              <a href="https://wa.me" target="_blank"><i class="bx bxl-whatsapp"></i></a>
              <a href="https://www.instagram.com" target="_blank"><i class="bx bxl-instagram-alt"></i></a>
            </div>
          </div>                
        </div>
      </div>
    </section>
  </main>

  <script src="Views/js/swiper-bundle.min.js"></script>
  <script src="Views/js/menu.js"></script>
  <script src="Views/js/swiper.js"></script>
</body>
</html>
