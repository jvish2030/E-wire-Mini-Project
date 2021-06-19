<%-- 
    Document   : products
    Created on : Jun 2, 2021, 2:53:17 PM
    Author     : jatin
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.java.ConPool.DBUtils"%>
<%@page import="java.util.Set"%>
<%@ taglib uri="/WEB-INF/tlds/Helper.tld" prefix="helper"%>




<!--        header area-->




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
        <link rel="stylesheet" href="categoryAssets/css/style.css"/>
        <link rel="stylesheet" href="assets/css/ProductStyle.css"/>


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

        <!--        header area-->

        <%
            // getting SET of Key- value pair of Id and category
            Set CategorySet = DBUtils.getCategoriesSet();
            // Creating Iterators of CategorySet
            Iterator itr1 = CategorySet.iterator();//iterator to list category in addProduct from
        %>
        <!-- Header section end -->
        <!-- Page info -->
        <div class="page-top-info p-4">
            <div class="container">
                <c:choose>
                    <c:when test="${param.pcat eq null}">
                        <h4>${param.value}</h4>      
                    </c:when>
                    <c:otherwise>
                        <h4>${param.pcat}</h4>      
                    </c:otherwise>
                </c:choose>    

                <div class="site-pagination">
                    <a href="">Home</a>/
                    <c:if test="${param.pcat ne null}">
                        <a href="">${param.value}</a>/
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Page info end -->
        <!-- Category section -->
        <section class="category-section spad pt-3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-2 order-lg-1">
                        <div class="filter-widget">
                            <h2 class="fw-title">Categories</h2>
                            <ul class="category-menu" >
                                <!--                        OUTER LOOP-->
                                <%  
                                    while (itr1.hasNext()) {
                                        Map.Entry CategoryEntry = (Map.Entry) itr1.next();
                                        int id = (int) CategoryEntry.getKey();
                                        String value = CategoryEntry.getValue().toString();
                                %> 
                                <li style="list-style :none;">
                                    <a style="font-size: 15px;background-color: #f1eeee"><%= value%> <i id="listhover" class="fa fa-caret-down"></i></a>
                                  
                                    <ul class="sub-menu">
                                        <li ><a  href="${pageContext.request.contextPath}\home?page=category&id=<%=id%>&value=<%=value%>" style="font-size: 13px;"><%= value%></a></li>
                                        <!-- OUTER LOOP-->
                                        <% for (String subCat : DBUtils.getSubCategories((int) id)) {%>
                                        <li><a href="${pageContext.request.contextPath}\home?page=category&id=<%=id%>&pcat=<%=subCat%>&value=<%=value%>"><%= subCat%><span>(90)</span></a></li>
                                            <%}%>
                                        <!--                        OUTER LOOP-->
                                    </ul>
                                </li>
                                <%}%>
                                <!--                        OUTER LOOP ENDS-->
                            </ul>
                        </div>
                        <div class="filter-widget mb-0">
                            <h2 class="fw-title">refine by</h2>
                            <div class="price-range-wrap">
                                <h4>Price</h4>
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                     data-min="100" data-max="3550">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"
                                         style="left: 0%; width: 100%;"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"
                                          style="left: 0%;">
                                    </span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"
                                          style="left: 100%;">
                                    </span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0">
                        <div class="row">
                            <c:forEach var="product" items="${productsList}">

                                <div class="col-md-3 col-sm-6 py-2">
                                    <div class="product-grid">
                                        <div class="product-image">
                                            <a href="#">
                                                <img class="pic-1" src="images/products/${product.pId}.jpg">
                                            </a>
                                            <ul class="social">
                                                <li><a href="${pageContext.request.contextPath}\view?page=single&cat=${param.value}&pid=${product.pId}" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                                                <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                                <li><a data-tip="Add to Cart" onclick="addToCartCheck('${sessionScope.userid}',${product.pId}, '${product.pName}', '${product.getPriceAfterApplyingDiscount()}')"><i class="fa fa-shopping-cart" ></i></a></li>
                                            </ul>
                                            <span class="product-new-label">${product.pRemark}</span>
                                            <span class="product-discount-label">${product.pDiscount}% off</span>
                                        </div>
                                        <ul class="rating">
                                            <li class="fa fa-star"></li>
                                            <li class="fa fa-star"></li>
                                            <li class="fa fa-star"></li>
                                            <li class="fa fa-star"></li>
                                            <li class="fa fa-star"></li>
                                        </ul>
                                        <div class="product-content">
                                            <h3 class="title"><a href="${pageContext.request.contextPath}\view?page=single&cat=${param.value}&pid=${product.pId}">${helper:get10Words(product.pName)}</a></h3>
                                            <div class="price">${product.getPriceAfterApplyingDiscount()}/-
                                                <span>${product.pPrice}/-</span>
                                            </div>
                                            <a class="add-to-cart" style="cursor: pointer;" onclick="addToCartCheck('${sessionScope.userid}',${product.pId}, '${product.pName}', '${product.getPriceAfterApplyingDiscount()}')">+ Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            function link(i) {
                var loc = window.location.href;
                var test = loc.search("pageid");
                if (test !== -1) {
                    var n = loc.length;
                    var res = loc.slice(0, n - 1);
                    res = res + i;
                    window.location.assign(res);
                } else {
                    window.location.assign(loc + "&pageid=" + i);
                }
            }
        </script>
        <div class="text-center w-100 pb-5">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage != 1}">
                        <li class="page-item">
                            <a class="page-link"  style="cursor: pointer;" onclick="link(${currentPage -1})" aria-label="Previous" >
                                <span aria-hidden="true" >&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <c:choose>
                            <c:when test="${currentPage eq i}">
                                <li class="page-item active"><a class="page-link ">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="page-item"><a  style="cursor: pointer;" class="page-link " onclick="link(${i})">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${currentPage lt noOfPages}">
                        <li class="page-item">
                            <a class="page-link" style="cursor: pointer;"  onclick="link(${currentPage +1})" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>

      <script src="categoryAssets/js/jquery.slicknav.min.js"></script>
        <!--        <script src="categoryAssets/js/owl.carousel.min.js"></script>-->
        <script src="categoryAssets/js/jquery.nicescroll.min.js"></script>
        <!--        <script src="categoryAssets/js/jquery.zoom.min.js"></script>-->
        <!--        <script src="categoryAssets/js/jquery-ui.min.js"></script>-->
        <script src="categoryAssets/js/main.js"></script>
        <jsp:include page="include/footer.jsp"/>