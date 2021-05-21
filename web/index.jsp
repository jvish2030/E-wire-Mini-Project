<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!doctype html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Hari Om Electricals</title>
        <!-- Template CSS -->
       
        <jsp:include page="include/css_js.jsp"/>
        
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <!--w3l-banner-slider-main-->
        <section class="w3l-banner-slider-main">
            <div class="top-header-content">
                <header class="tophny-header">
                    <div class="container-fluid">

                        <div class="top-right-strip row">
                            <div class="top-hny-left-content col-lg-6 pl-lg-0">
                                <h6>Upto 30% off on All styles , <a href="#" target="_blank"> Click here for <span
                                            class="fa fa-hand-o-right hand-icon" aria-hidden="true"></span> <span
                                            class="hignlaite">More details</span></a></h6>
                            </div>
                            <!--/left-->

                            <!--    if user registered or login ,show username on screen-->
                            <%
                                if (session.getAttribute("userid") != null) {
                            %>
                            <div class="top-hny-left-content col-lg-6 pl-lg-0">
                                <h6 class="">Welcome, <%= session.getAttribute("uname")%> <a href="#" target="_blank"> Click here for <span
                                            class="fa fa-hand-o-right hand-icon" aria-hidden="true"></span> <span
                                            class="hignlaite">More details</span></a></h6>
                            </div>
                            <% }%>
                            <!--    if user registered or login ,show username on screen-->

                            <!--//left-->
                            <!--/right-->
                            <ul class="top-hnt-right-content col-lg-6">
                                <li class="button-log usernhy">
                                    <a class="btn-open" href="#">
                                        <span class="fa fa-user" aria-hidden="true"></span>
                                    </a>
                                </li>
                                <li class="transmitvcart galssescart2 cart cart box_1">
                                    <form action="#" method="post" class="last">

                                        <button class="top_transmitv_cart" type="submit" name="submit" value="">
                                            <a href="cart.jsp">My Cart
                                                <span class="fa fa-shopping-cart"></span>  </a>
                                        </button>


                                    </form>
                                </li>
                            </ul>
                            <!--//login- Register-->
                            <jsp:include page="include/login_register.jsp"/>

                        </div>
                    </div>	

                    <!--/nav-->
                    <!--/nav-->
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="container-fluid serarc-fluid">
                            <a class="navbar-brand" href="${pageContext.request.contextPath}\home?page=home">
                                Hari<span class="lohny">Om</span>
                            </a>
                            <!-- if logo is image enable this   
                                            <a class="navbar-brand" href="#index.html">
                                                    <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
                                            </a> -->
                            <!--/search-right-->
                            <div class="search-right">

                                <a href="#search" title="search"><span class="fa fa-search mr-2" aria-hidden="true"></span>
                                    <span class="search-text">Search here</span></a>
                                <!-- search popup -->
                                <div id="search" class="pop-overlay">
                                    <div class="popup">

                                        <form action="#" method="post" class="search-box">
                                            <input type="search" placeholder="Keyword" name="search" required="required"
                                                   autofocus="">
                                            <button type="submit" class="btn">Search</button>
                                        </form>

                                    </div>
                                    <a class="close" href="#">×</a>
                                </div>
                                <!-- /search popup -->
                            </div>
                            <!--//search-right-->
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon fa fa-bars"> </span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}\home?page=home">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#Products-display">Products</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}\view?page=about">About</a>
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link" href="${pageContext.request.contextPath}\view?page=contact">Contact</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath}\view?page=faq">Faq's</a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </nav>
                    <!--//nav-->

                    <!--                    if user registered display success mesage-->
                    <%
                        if (session.getAttribute("message") != null) {
                    %>  
                    <div class="row" id="register-alert">
                        <div class="col-sm-5 mx-auto">
                            <div id="success-alert" class=" alert alert-success alert-dismissible fade show" role="alert">
                                <strong>User!</strong> Registered                               
                            </div>
                        </div>
                    </div>
                    <!--registeratin message-->
                    <script>
                        $(document).ready(function () {
                            $("#success-alert").fadeOut(2000);

                        });
                    </script>
                    <%
                            session.removeAttribute("message");
                        }
                    %>                    
                    <!--             //       if user registered display success mesage-->
                </header>

            </div>
            <div class="bannerhny-content">

                <!--/banner-slider-->
                <div class="content-baner-inf">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>ROUND CABLE COPPER<br>
                                            30% Off</h3>
                                        <a href="#" class="shop-button btn">
                                            Shop Now
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item item2">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>Single Core
                                            Aluminium
                                            <br>40% Off</h3>
                                        <a href="#" class="shop-button btn">
                                            Shop Now
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item item3">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>Submersible
                                            Copper Wire
                                            <br>50% Off</h3>
                                        <a href="#" class="shop-button btn">
                                            Shop Now
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item item4">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>1/18 VIR
                                            Copper wire
                                            <br>40% Off</h3>
                                        <a href="#" class="shop-button btn">
                                            Shop Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <!--//banner-slider-->
                <!--//banner-slider-->
                <div class="right-banner">
                    <div class="right-1">
                        <h4>
                            Multi Strand  Wire
                            <br>
                            30% Off</h4>
                        <a href="#" class="shop-button btn">
                            Shop Now
                        </a>
                    </div>
                </div>

            </div>
        </section>

        <section class="w3l-grids-hny-2" id="Products-display">
            <!-- /content-6-section -->
            <div class="grids-hny-2-mian py-5">
                <div class="container py-lg-5">

                    <h3 class="hny-title mb-0 text-center">Shop With <span>Us</span></h3>
                    <p class="mb-4 text-center">Handpicked Favourites just for you</p>
                    <div class="welcome-grids row mt-5">
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid1.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">Multi Strand Copper</a></h4>

                        </div>

                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid3.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">
                                    Industrial Round Cable Copper</a></h4>


                        </div>
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid2.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">Submersible Wire Copper</a></h4>


                        </div>
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid4.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">1/18 VIR Copper & Alu Wire</a></h4>

                        </div>
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid5.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">
                                    Aluminium Single Core Heavy</a></h4>


                        </div>
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid6.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">
                                    Service Wire 2 Core Aluminium</a></h4>


                        </div>
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="#URL">
                                    <img src="assets/images/grid7.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="#URL">
                                    Flexible Wire Copper & Aluminium</a></h4>


                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- //content-6-section -->

        <jsp:include page="include/footer.jsp"/>
