<!--
Author: W3layouts
Author URL: http://w3layouts.com
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>
            <%= request.getAttribute("title")%>
        </title>
        <link rel="stylesheet" href="assets/css/style-starter.css">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="//fonts.googleapis.com/css?family=Oswald:300,400,500,600&display=swap" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900&display=swap" rel="stylesheet">
    </head>
    <body>
        <section class="w3l-banner-slider-main inner-pagehny">
            <div class="breadcrumb-infhny">

                <div class="top-header-content">

                    <header class="tophny-header">
                        <div class="container-fluid">
                            <div class="top-right-strip row">
                                <!--/left-->
                                <div class="top-hny-left-content col-lg-6 pl-lg-0">
                                    <h6>Upto 30% off on All styles , <a href="#" target="_blank"> Click here for <span
                                                class="fa fa-hand-o-right hand-icon" aria-hidden="true"></span> <span class="hignlaite">More
                                                details</span></a></h6>
                                </div>
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
                                            <input type="hidden" name="cmd" value="_cart">
                                            <input type="hidden" name="display" value="1">
                                            <button class="top_transmitv_cart" type="submit" name="submit" value="">
                                                My Cart
                                                <span class="fa fa-shopping-cart"></span>
                                            </button>
                                        </form>
                                    </li>
                                </ul>
                                <!--//login- Register-->
                                <jsp:include page="login_register.jsp"/>

                                <!--//login- Register-->
                            </div>
                        </div>
                        <!--/nav-->
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="container-fluid serarc-fluid">
                                <a class="navbar-brand" href="index.jsp">
                                    Hari<span class="lohny">Om</span></a>
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


                    </header>
                    <div class="breadcrumb-contentnhy">
                        <div class="container">
                            <nav aria-label="breadcrumb">
                                <h2 class="hny-title text-center"><%= request.getAttribute("title")%></h2>
                                <ol class="breadcrumb mb-0">
                                    <li><a href="index.jsp">Home</a>
                                        <span class="fa fa-angle-double-right"></span></li>
                                    <li class="active"><%= request.getAttribute("title")%></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>