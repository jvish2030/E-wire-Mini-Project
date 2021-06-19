<%-- 
    Document   : products
    Created on : Jun 2, 2021, 2:53:17 PM
    Author     : jatin
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>



<!doctype html>
<html lang="zxx">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>
            <%= request.getAttribute("title")%>
        </title>
        <jsp:include page="include/css_js.jsp"/>
        <style>

            p 
            { 
                color: #6c757d;
            } 
            a
            {
                text-decoration: none;
            } 
            a:hover
            { text-decoration: none;
            } 
            h2 { 
                font-size: 1.5rem; 
            } 
            .main_cart 
            { 
                background: #fff; 
            } 
            .card {
                border: none;
            } 
            .product_img img 
            {
                min-width: 200px;
                max-height: 200px;
            } 

            .product_name
            { 
                color: black;
                font-size: 1.4rem;
                text-transform: capitalize;
                font-weight: 500; 
            } 
            .card-title 
            p { 
                font-size: 0.9rem;
                font-weight: 500;
            } 
            .remove-and-wish
            p
            { 
                font-size: 0.8rem; 
                margin-bottom: 0; 
            }
            .price-money h3 
            {
                font-size: 1rem;
                font-weight: 600;
            } 
            .set_quantity
            {
                position: relative;
            } 
            .set_quantity::after {
                content: "(Note, 1 piece)";
                width: auto;
                height: auto;
                text-align: center;
                position: absolute; 
                bottom: -20px;
                right: 1.5rem;
                font-size: 0.8rem; 
            } 
            .page-link { 
                line-height: 16px;
                width: 45px;
                font-size: 1rem;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #495057;
            } 
            .page-item input {
                line-height: 22px;
                padding: 3px;
                font-size: 15px;
                display: flex;
                justify-content:center; 
                align-items: center;
                text-align: center;
            } 
            .page-link:hover
            { 
                text-decoration: none; 
                color: #495057; 
                outline: none !important;
            } 
            .page-link:focus { 
                box-shadow: none; 
            }
            .price_indiv p {
                font-size: 1.1rem;
            } 
            .fa-heart:hover { 
                color: red;
            }
        </style>


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
                                <jsp:include page="include/showUserName.jsp"/>
                                <!--    if user registered or login ,show username on screen-->
                                <!--//top-left-->

                                <!--/top-right-->
                                <!--  including user login & logout icon-->
                                <jsp:include page="include/user_icon.jsp"/>
                                <!--  including user login & logout icon-->
                                <!--/top-right-->

                                <!--//Including ogin- Register model here-->
                                <jsp:include page="include/login_register.jsp"/>
                                <!--//Including ogin- Register model here-->
                            </div>
                        </div>
                        <!--include navigation bar here-->
                        <jsp:include page="include/navbar.jsp"/>
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

        <div class="container-fluid pb-5">

            <div class="row">
                <div class="col-md-10 col-11 mx-auto">
                    <div class="row mt-5 gx-3">
                        <!-- left side div -->
                        <div class="col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow cart-body">

                            
                 
                        </div>
                        <!-- right side div -->
                        <div class="col-md-12 col-lg-4 col-11 mx-auto mt-lg-0 mt-md-5">
                            <div class="right_side p-3 shadow bg-white">
                                <h2 class="product_name mb-5">The Total Amount Of</h2>
                                <div class="price_indiv d-flex justify-content-between">
                                    <p>Product amount</p>
                                    <p>&#8377; <span id="product_total_amt">0.00</span></p>
                                </div>
                                <div class="price_indiv d-flex justify-content-between">
                                    <p>Shipping Charge</p>
                                    <p>&#8377; <span id="shipping_charge">50.0</span></p>
                                </div>
                                <hr />
                                <div class="total-amt d-flex justify-content-between font-weight-bold">
                                    <p>The total amount of (including VAT)</p>
                                    <p>&#8377; <span id="total_cart_amt">0.00</span></p>
                                </div>
                                <button class="btn btn-primary text-uppercase">Checkout</button>
                            </div>
                            <!-- discount code part -->
                            <div class="discount_code mt-3 shadow">
                                <div class="card">
                                    <div class="card-body">
                                        <a class="d-flex justify-content-between" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                            Add a discount code (optional)
                                            <span><i class="fas fa-chevron-down pt-1"></i></span>
                                        </a>
                                        <div class="collapse" id="collapseExample">
                                            <div class="mt-3">
                                                <input type="text" name="" id="discount_code1" class="form-control font-weight-bold" placeholder="Enter the discount code">
                                                <small id="error_trw" class="text-dark mt-3">code is thapa</small>
                                            </div>
                                            <button class="btn btn-primary btn-sm mt-3" onclick="discount_code()">Apply</button>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <!-- discount code ends -->
                            <div class="mt-3 shadow p-3 bg-white">
                                <div class="pt-4">
                                    <h5 class="mb-4">Expected delivery date</h5>
                                    <p>July 27th 2021 - July 29th 2021</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="include/footer.jsp"/>
