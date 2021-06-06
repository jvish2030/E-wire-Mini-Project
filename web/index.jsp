<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.java.ConPool.DBUtils"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!doctype html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Hari Om Electricals</title>
        <!-- Template CSS Aman Gupta Performing Chsnges ,Adiing Some more changes by jatin
        Adding one more line-->
        <jsp:include page="include/css_js.jsp"/>
    </head>
    <body>

        <%
//            response.setHeader("Cache-Control", "no-cache");
//            response.setHeader("Cache-Control", "no-store");
//            response.setHeader("Pragma", "no-cache");
//            response.setDateHeader("Expires", 0);
        %> 

        <!--w3l-banner-slider-main-->
        <section class="w3l-banner-slider-main">

            <div class="top-header-content">
                <header class="tophny-header">
                    <div class="container-fluid">
                        <div class="top-right-strip row">

                            <!--/left-->
                            <!--    if user registered or login ,show username on screen-->
                            <jsp:include page="include/showUserName.jsp"/>
                            <!--    if user registered or login ,show username on screen-->
                            <!--//left-->

                            <!--/top-right-->
                            <!--  including user login & logout icon-->
                            <jsp:include page="include/user_icon.jsp"/>
                            <!--  including user login & logout icon-->
                            <!--/top-right-->

                            <!--//including login- Register here-->
                            <jsp:include page="include/login_register.jsp"/>
                            <!--//including login- Register here-->
                        </div>
                    </div>	

                    <!--/search-right-->
                    <!--include navigation bar here-->
                    <jsp:include page="include/navbar.jsp"/>       
                    <!--include navigation bar here-->

                    <!-- include login register message here-->
                    <jsp:include page="include/message.jsp"/>
                    <!-- include login register message here-->

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
                                        <h3 style="color: white;">ROUND CABLE COPPER<br>
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
                                        <h3 style="color: white;">Single Core
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
                                        <h3 style="color: white;">Submersible
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
                                        <h3 style="color: white;">1/18 VIR
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

        <%
            int getid = 0;
            // getting SET of Key- value pair of Id and category
            Set CategorySet = DBUtils.getCategoriesSet();
            // Creating Iterators of CategorySet
            Iterator itr = CategorySet.iterator();//iterator to list category in addProduct from

        %>


        <section class="w3l-grids-hny-2" id="Products-display">
            <!-- /content-6-section -->
            <div class="grids-hny-2-mian py-5 ">
                <div class="container py-lg-5 ">

                    <h3 class="hny-title mb-0 text-center">Shop 🛒 With <span>Us Onilne</span> To Get Best Deal
                        <span>Everyday</span> 🧬🔌
                    </h3>
                    <p class="mb-4 text-center">Handpicked Favourites just for you</p>
                    <div class="welcome-grids row mt-5 justify-content-center">
                        <%       while (itr.hasNext()) {
                                Map.Entry CategoryEntry = (Map.Entry) itr.next();
                                String id = CategoryEntry.getKey().toString();
                                String value = CategoryEntry.getValue().toString();
                        %>
                        <div class="col-lg-2 col-md-4 col-6 welcome-image">
                            <div class="boxhny13">
                                <a href="${pageContext.request.contextPath}\home?page=category&id=<%=id%>&value=<%=value%>" >
                                    <img src="images/category/<%=CategoryEntry.getKey()%>.jpg" class="img-fluid" alt="" />
                                    <div class="boxhny-content">
                                        <h3 class="title">Product</h3>
                                    </div>
                                </a>
                            </div>
                            <h4><a href="${pageContext.request.contextPath}\home?page=category"> <%= CategoryEntry.getValue()%></a></h4>
                        </div>
                        <%}%>                   
                    </div>
                </div>
            </div>
        </section>
        <!-- //content-6-section -->


        <section class="w3l-content-w-photo-6">
            <!-- /specification-6-->
            <div class="content-photo-6-mian py-5">
                <div class="container py-lg-5">
                    <div class="align-photo-6-inf-cols row">

                        <div class="photo-6-inf-right col-lg-6">
                            <h3 class="hny-title text-left">Multi Strand House Wire are upto <span>30% Discount</span></h3>
                            <p>Whole range of multi strand wire with varied Length and Gauge are available. So what are you
                                waiting for the deal is for limited time period🕒. <span>HURRY UP TO GET BEST DEAL</span>
                            </p>
                            <p><b>It can even be Customized as per the order. Customer satisfaction is our first
                                    priority.😊</b></p>
                            <a href="#" class="read-more btn">
                                Shop Now
                            </a>
                        </div>
                        <div class="photo-6-inf-left col-lg-6">
                            <img src="assets/images/1.jpg" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //specification-6-->

        <section class="w3l-video-6">
            <!-- /video-6-->
            <div class="video-66-info">
                <div class="container-fluid">
                    <div class="video-grids-info row">
                        <div class="video-gd-right col-lg-8">
                            <div class="video-inner text-center">
                                <!--popup-->
                                <a class="play-button btn popup-with-zoom-anim" href="#small-dialog">
                                    <span class="fa fa-play" aria-hidden="true"></span>
                                </a>
                                <div id="small-dialog" class="mfp-hide">
                                    <div class="search-top notify-popup">
                                        <iframe src="https://player.vimeo.com/video/246139491" frameborder="0"
                                                allow="autoplay; fullscreen" allowfullscreen></iframe>
                                    </div>
                                </div>
                                <!--//popup-->
                            </div>
                        </div>
                        <div class="video-gd-left col-lg-4 p-lg-5 p-4">
                            <div class="p-xl-4 p-0 video-wrap" id="amount">
                                <h3 class="hny-title text-left">Single Core Aluminium Wire are upto <span>40%
                                        Discount</span>
                                </h3>
                                <p>Whole range from 2.5mm to 25 mm is available for order.We take full responsibily to
                                    provide you the best material</p>
                                <p><b>It can even be Customized as per the order. Customer satisfaction is our first
                                        priority.😊</b></p>
                                <a href="#" class="read-more btn">
                                    Shop Now
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- //video-6-->


        <jsp:include page="include/footer.jsp"/>
