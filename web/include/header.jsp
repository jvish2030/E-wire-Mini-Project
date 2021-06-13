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
        <jsp:include page="css_js.jsp"/>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet"/>
    </head>
    <body>
        <section class="w3l-banner-slider-main inner-pagehny">
            <div class="breadcrumb-infhny" style="min-height:6em;">

                <div class="top-header-content">

                    <header class="tophny-header">
                        <div class="container-fluid">
                            <div class="top-right-strip row">

                                <!--/top-left-->
                                <!--    if user registered or login ,show username on screen-->
                                <jsp:include page="showUserName.jsp"/>
                                <!--    if user registered or login ,show username on screen-->
                                <!--//top-left-->

                                <!--/top-right-->
                                <!--  including user login & logout icon-->
                                <jsp:include page="user_icon.jsp"/>
                                <!--  including user login & logout icon-->
                                <!--/top-right-->

                                <!--//Including ogin- Register model here-->
                                <jsp:include page="login_register.jsp"/>
                                <!--//Including ogin- Register model here-->
                            </div>
                        </div>
                        <!--include navigation bar here-->
                        <jsp:include page="navbar.jsp"/>
                        <!--include navigation bar here-->
                    </header>
                    <div class="breadcrumb-contentnhy " style="padding-top: 100px;">
                        <div class="container py-4">
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
        <jsp:include page="common_modals.jsp"/>

