


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
        <link rel="stylesheet" href="assets/css/SinglePageStyle.css"/>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet"/>
        <style>

            .product_price {
                display: inline-block;
                font-size: 30px;
                font-weight: 500;
                margin-top: 9px;
                clear: left
            }

            .product_discount {
                display: inline-block;
                font-size: 17px;
                font-weight: 300;
                margin-top: 9px;
                clear: left;
                margin-left: 10px;
                color: red
            }

            .product_saved {
                display: inline-block;
                font-size: 15px;
                font-weight: 200;
                color: #999999;
                clear: left
            }

            .singleline {
                margin-top: 1rem;
                margin-bottom: .40rem;
                border: 0;
                border-top: 1px solid rgba(0, 0, 0, .1)
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
        <jsp:include page="include/common_modals.jsp"/>


        
        <link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
        <div class="container-fluid mt-2 mb-3">
            <div class="row no-gutters">
                <div class="col-md-3 pr-2">
                    <div class="card">
                        <div class="demo">
                            <img src="images/products/${product.pId}.jpg" />
                        </div>
                    </div>
                    <div class="card mt-2">
                        <h6>Reviews</h6>
                        <div class="d-flex flex-row">
                            <div class="stars"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="ml-1 font-weight-bold">4.6</span>
                        </div>
                        <hr>
                        <div class="badges"> <span class="badge bg-dark ">All (230)</span> <span class="badge bg-dark "> <i class="fa fa-image"></i> 23 </span> <span class="badge bg-dark "> <i class="fa fa-comments-o"></i> 23 </span> <span class="badge bg-warning"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <span class="ml-1">2,123</span> </span> </div>
                        <hr>
                        <div class="comment-section">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/o5uMfKo.jpg" class="rounded-circle profile-image">
                                    <div class="d-flex flex-column ml-1 comment-profile">
                                        <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Lori Benneth</span>
                                    </div>
                                </div>
                                <div class="date"> <span class="text-muted">2 May</span> </div>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/tmdHXOY.jpg" class="rounded-circle profile-image">
                                    <div class="d-flex flex-column ml-1 comment-profile">
                                        <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Timona Simaung</span>
                                    </div>
                                </div>
                                <div class="date"> <span class="text-muted">12 May</span> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="offset-1 col-md-7">
                    <div class="card">
                        <div class="d-flex flex-row align-items-center">
                            <div class="p-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="ml-1">5.0</span>
                        </div>
                        <div class="about"> <span class="font-weight-bold">${product.pName}</span>

                        </div>

                        <div> <span class="product_price"><span class="mr-1">&#8377;</span>${product.getPriceAfterApplyingDiscount()}</span> <strike class="product_discount"> <span style='color:black'><span class="mr-1">&#8377;</span>${product.pPrice}<span> </strike> </div>
                                        <div> <span class="product_saved">You Saved:</span> <span style='color:black'>${product.pPrice-product.getPriceAfterApplyingDiscount()}&#8377;<span> </div>
                                                    <hr class="singleline">

                                                    <div class="buttons"> <button class="btn btn-outline-warning btn-long cart "  onclick="addToCartCheck('${sessionScope.userid}',${product.pId}, '${product.pName}', '${product.getPriceAfterApplyingDiscount()}')">Add to Cart</button> <button class="btn btn-warning btn-long buy">Buy it Now</button> <button class="btn btn-light wishlist"> <i class="fa fa-heart"></i> </button> </div>
                                                    <hr>
                                                    <div class="product-description">
                                                        <div><span class="font-weight-bold">Color:</span><span> blue</span></div>
                                                        <div class="my-color"> <label class="radio"> <input type="radio" name="gender" value="MALE" checked> <span class="red"></span> </label> <label class="radio"> <input type="radio" name="gender" value="FEMALE"> <span class="blue"></span> </label> <label class="radio"> <input type="radio" name="gender" value="FEMALE"> <span class="green"></span> </label> <label class="radio"> <input type="radio" name="gender" value="FEMALE"> <span class="orange"></span> </label> </div>
                                                        <div class="d-flex flex-row align-items-center"> <i class="fa fa-calendar-check-o"></i> <span class="ml-1">Delivery from sweden, 15-45 days</span> </div>
                                                        <div class="mt-2"> <span class="font-weight-bold">Description</span>
                                                            <p>${product.pDescription}</p>
                                                            <div class="bullets">
                                                                <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Best in Quality</span> </div>
                                                                <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Anti-creak joinery</span> </div>
                                                                <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Sturdy laminate surfaces</span> </div>
                                                                <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Relocation friendly design</span> </div>
                                                                <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">High gloss, high style</span> </div>
                                                                <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Easy-access hydraulic storage</span> </div>
                                                            </div>
                                                        </div>
                                                        <div class="mt-2"> <span class="font-weight-bold">Store</span> </div>
                                                        <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/N2fYgvD.png" class="rounded-circle store-image">
                                                            <div class="d-flex flex-column ml-1 comment-profile">
                                                                <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Rare Boutique</span> <small class="followers">25K Followers</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    <div class="card mt-2"> <span>Similar items:</span>
                                                        <div class="similar-products mt-2 d-flex flex-row">
                                                            <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="images/products/136.jpg" class="card-img-top" alt="...">
                                                                <div class="card-body">
                                                                    <h6 class="card-title">$1,999</h6>
                                                                </div>
                                                            </div>
                                                            <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="images/products/137.jpg" class="card-img-top" alt="...">
                                                                <div class="card-body">
                                                                    <h6 class="card-title">$1,699</h6>
                                                                </div>
                                                            </div>
                                                            <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="images/products/138.jpg" class="card-img-top" alt="...">
                                                                <div class="card-body">
                                                                    <h6 class="card-title">$2,999</h6>
                                                                </div>
                                                            </div>
                                                            <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="images/products/139.jpg" class="card-img-top" alt="...">
                                                                <div class="card-body">
                                                                    <h6 class="card-title">$3,999</h6>
                                                                </div>
                                                            </div>
                                                            <div class="card border p-1" style="width: 9rem;"> <img src="images/products/144.jpg" class="card-img-top" alt="...">
                                                                <div class="card-body">
                                                                    <h6 class="card-title">$999</h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </div>


                                                    <jsp:include page="include/footer.jsp"/>