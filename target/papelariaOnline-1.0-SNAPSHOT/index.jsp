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
<body class="bodyindex">
    <header class="header" >
        <nav class="nav container flex">
            <a href="#" class="logo-content flex">
                <i class='bx bxs-book-alt logo-icon'></i>
                <span class="logo-text">soft paper.</span>
            </a>

            <div class="menu-content">
                <ul class="menu-list flex">
                    <li><a href="#home" class="nav-link active-navlink">início</a></li>
                    <li><a href="#produtos" class="nav-link active-navlink">comprar</a></li>
                    <li><a href="#sobre" class="nav-link active-navlink" >sobre</a></li>
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
                    <a href="wa.me" target="_blank"><i class='bx bxl-whatsapp'></i></a>
                    <a href="instagram.com" target="_blank"><i class='bx bxl-instagram-alt'></i></a>
                </div>
                <i class='bx bx-x navclose-btn'></i>
            </div>
            
            <div class="cart-content flex">
                <!-- Se o usuário estiver logado exibe nome e logout; senão ele mostra link para login -->
                <c:if test="${not empty sessionScope.usuario}">
                  <span class="nav-link" style="color: white; margin-right: 5px;">
                    Olá, ${sessionScope.usuario.nome}
                  </span>
                  <a href="${pageContext.request.contextPath}/logout" title="Logout">
                    <i class="bx bx-log-out" style="color: white; font-size: 1.5rem;"></i>
                  </a>
                </c:if>
                <span class="cartopen">
                  <i class='bx bxs-cart cart-icon'></i>
                </span>
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
                                <img src="Views/img/sobre.png" alt="" class="homeimg">
                                <div class="home-details">
                                    <div class="home-text">
                                        <h4 class="homesub">a sua personalidade em folhas</h4>
                                        <h2 class="hometitle">qualidade e beleza</h2>
                                    </div>
                                    <button class="btn"><a href="#produtos">Produtos</a></button>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <img src="Views/img/img2.png" alt="" class="homeimg">
                                <div class="home-details">
                                    <div class="home-text">
                                        <h4 class="homesub">a sua personalidade em folhas</h4>
                                        <h2 class="hometitle">qualidade e beleza</h2>
                                    </div>
                                    <button class="btn"><a href="#produtos">Produtos</a></button>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <img src="Views/img/img3.png" alt="" class="homeimg">
                                <div class="home-details">
                                    <div class="home-text">
                                        <h4 class="homesub">a sua personalidade em folhas</h4>
                                        <h2 class="hometitle">qualidade e beleza</h2>
                                    </div>
                                    <button class="btn"><a href="#produtos">Produtos</a></button>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-next swiper-navbtn"></div>
                        <div class="swiper-button-prev swiper-navbtn"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
        </section>
        <section class="product1" id="produtos">
            <h2>Nossos produtos</h2>
            <p>Feitos com muito carinho</p>
            <br>
            <div class="pro-container">
                <div class="pro" id="pro1-cat">
                  <img src="Views/img/pro1.webp" alt="">
                  <div class="des">
                        <span>agenda</span>
                        <h5>White space cat</h5>
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <h4>R$59,89</h4>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.usuario}">
                          <!-- Usuário não logado, redireciona para a página de login -->
                          <a href="javascript:void(0);" class="pro-cart" data-logged="true" onclick="adicionaProdutoAoCarrinho()">
                            <i class='bx bx-cart'></i>
                          </a>
                        
                        </c:when>
                        <c:otherwise>
                          <!-- Usuário logado, chama a função JavaScript para adicionar o item -->
                          <a href="Views/login.jsp" class="pro-cart" data-logged="false">
                            <i class='bx bx-cart'></i>
                          </a>
                        
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="pro" id="pro2-scarlet">
                    <img src="Views/img/pro2.webp" alt="">
                    <div class="des">
                        <span>agenda</span>
                        <h5>Scarlet moonlight</h5>
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <h4>R$59,89</h4>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.usuario}">
                          <!-- não logado -->
                          <a href="javascript:void(0);" class="pro-cart" data-logged="true" onclick="adicionaProdutoAoCarrinho()">
                            <i class='bx bx-cart'></i>
                          </a>
                        
                        </c:when>
                        <c:otherwise>
                          <!-- logado -->
                          <a href="Views/login.jsp" class="pro-cart" data-logged="false">
                            <i class='bx bx-cart'></i>
                          </a>    
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="pro" id="pro3-dream">
                    <img src="Views/img/pro3.png" alt="">
                    <div class="des">
                        <span>agenda</span>
                        <h5>That's my dream</h5>
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <h4>R$59,89</h4>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.usuario}">
                          <a href="javascript:void(0);" class="pro-cart" data-logged="true" onclick="adicionaProdutoAoCarrinho()">
                            <i class='bx bx-cart'></i>
                          </a>
                        </c:when>
                        <c:otherwise>
                          <a href="Views/login.jsp" class="pro-cart" data-logged="false">
                            <i class='bx bx-cart'></i>
                          </a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="pro" id="pro4-cosmic">
                    <img src="Views/img/pro4.png" alt="">
                    <div class="des">
                        <span>caderno</span>
                        <h5>Cosmic heart</h5>
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <h4>R$79,89</h4>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.usuario}">
                          <a href="javascript:void(0);" class="pro-cart" data-logged="true" onclick="adicionaProdutoAoCarrinho()">
                            <i class='bx bx-cart'></i>
                          </a>
                        </c:when>
                        <c:otherwise>
                          <a href="Views/login.jsp" class="pro-cart" data-logged="false">
                            <i class='bx bx-cart'></i>
                          </a>                        
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="pro" id="pro5-revenge">
                    <img src="Views/img/pro5.png" alt="">
                    <div class="des">
                        <span>caderno</span>
                        <h5>Sweet revenge</h5>
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <h4>R$79,89</h4>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.usuario}">
                          <a href="javascript:void(0);" class="pro-cart" data-logged="true" onclick="adicionaProdutoAoCarrinho()">
                            <i class='bx bx-cart'></i>
                          </a>                   
                        </c:when>
                        <c:otherwise>
                          <a href="Views/login.jsp" class="pro-cart" data-logged="false">
                            <i class='bx bx-cart'></i>
                          </a>
                        
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="pro" id="pro6-rabbit">
                    <img src="Views/img/pro6.png" alt="">
                    <div class="des">
                        <span>caderno</span>
                        <h5>Rabbit hole</h5>
                        <div class="star">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                        <h4>R$79,89</h4>
                    </div>
                    <c:choose>
                        <c:when test="${empty sessionScope.usuario}">
                          <a href="javascript:void(0);" class="pro-cart" data-logged="true" onclick="adicionaProdutoAoCarrinho()">
                            <i class='bx bx-cart'></i>
                          </a>
                        </c:when>
                        <c:otherwise>
                          <a href="Views/login.jsp" class="pro-cart" data-logged="false">
                            <i class='bx bx-cart'></i>
                          </a>
                        
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
        <section class="section about" id="sobre">
            <div class="about-content container">
                <div class="about-imagecontent">
                    <img src="Views/img/sobre.jpg" alt="" class="about-img">
                    <div class="aboutimg-textbox">
                        <i class='bx bxs-heart-circle hearticon flex'></i>
                        <p class="content-description">Produtos maravilhosos, não dá pra escolher só um!</p>
                    </div>
                </div>
                <div class="about-details">
                    <div class="about-text">
                        <h4 class="content-subs">Nossa loja</h4>
                        <h2 class="content-title">Papelaria Alternativa</h2>
                        <p class="content-description">com a missão de levar produtos <b>personalizados</b> pra quem tem a <b>personalidade</b> forte.</p>
                        <ul class="about-lists flex">
                            <li class="about-list">Cadernos</li>
                            <li class="about-list dot">.</li>
                            <li class="about-list">Planners</li>
                            <li class="about-list dot">.</li>
                            <li class="about-list">Agendas</li>
                        </ul>
                        <div class="about-icon">
                            <a href="https://wa.me" target="_blank"><i class='bx bxl-whatsapp'></i></a>
                            <a href="https:/instagram.com" target="_blank"><i class='bx bxl-instagram-alt'></i></a>
                        </div>
                    </div>                
                </div>
            </div>
        </section>

        <div class="cart" id="shopping-cart">
            <i class='bx bx-x close-cart' id="close-cart"></i>
            <h2>Carrinho</h2>
            <ul id="cart-items">
            </ul>
            <div class="cart-footer">
                <h4>Total: <span id="cart-total">R$0,00</span></h4>
                <a href="javascript:void(0);" class="finalize-btn">
                    Finalizar
                </a>  
            </div>
        </div>
          
    </main>

    <script src="Views/js/swiper-bundle.min.js"></script>
    <script src="Views/js/menu.js"></script>
    <script src="Views/js/swiper.js"></script>
    <script src="Views/js/cart.js"></script>
</body>
</html>