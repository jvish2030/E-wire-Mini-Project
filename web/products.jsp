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
<jsp:include page="include/header.jsp"/>

<%
    // getting SET of Key- value pair of Id and category
    Set CategorySet = DBUtils.getCategoriesSet();
    // Creating Iterators of CategorySet
    Iterator itr1 = CategorySet.iterator();//iterator to list category in addProduct from
%>
<!-- Header section end -->
<!-- Page info -->
<div class="page-top-info">
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
<section class="category-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 order-2 order-lg-1">
                <div class="filter-widget">
                    <h2 class="fw-title">Categories</h2>
                    <ul class="category-menu">
                        <!--                        OUTER LOOP-->
                        <%                            while (itr1.hasNext()) {
                                Map.Entry CategoryEntry = (Map.Entry) itr1.next();
                                int id = (int) CategoryEntry.getKey();
                                String value = CategoryEntry.getValue().toString();
                        %> 
                        <li>
                            <a href="${pageContext.request.contextPath}\home?page=category&id=<%=id%>&value=<%=value%>"><%= value%></a>
                            <ul class="sub-menu">
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
                                        <li><a href="" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                                        <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                        <li><a href="" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                    <span class="product-new-label">Sale</span>
                                    <span class="product-discount-label">${product.pRemark}</span>
                                </div>
                                <ul class="rating">
                                    <li class="fa fa-star"></li>
                                    <li class="fa fa-star"></li>
                                    <li class="fa fa-star"></li>
                                    <li class="fa fa-star"></li>
                                    <li class="fa fa-star"></li>
                                </ul>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">${helper:get10Words(product.pName)}</a></h3>
                                    <div class="price">${product.getPriceAfterApplyingDiscount()}/-
                                        <span>${product.pPrice}/-</span>
                                    </div>
                                    <a class="add-to-cart" href="">+ Add To Cart</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="text-center w-100 pt-3">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link"  onclick="link(${currentPage -1})" aria-label="Previous" >
                                            <span aria-hidden="true" >&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${noOfPages}" var="i">
                                    <c:choose>
                                        <c:when test="${currentPage eq i}">
                                            <li class="page-item active"><a class="page-link " href="#">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li class="page-item"><a class="page-link" onclick="link(${i})">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${currentPage lt noOfPages}">
                                    <li class="page-item">
                                        <a class="page-link"  onclick="link(${currentPage +1})" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Category section end -->




<!-- Footer section -->
<section class="footer-section">
    <div class="container">
        <div class="footer-logo text-center">
            <a href="home.html"><img src="./img/logo-light.png" alt=""></a>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>About</h2>
                    <p>Hari Om Electricals & Appliances in Golibar Chowk has a wide range of products and / or
                        services to cater to the varied requirements of their customers. Pay for the product or
                        service with ease by using any of the available modes of payment, such as Cash. This
                        establishment is functional from 11:00 - 21:00.</p>
                    <img src="img/cards.png" alt="">
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>Questions</h2>
                    <ul>
                        <li><a href="">About Us</a></li>
                        <li><a href="">Track Orders</a></li>
                        <li><a href="">Returns</a></li>
                        <li><a href="">Jobs</a></li>
                        <li><a href="">Shipping</a></li>
                        <li><a href="">Blog</a></li>
                    </ul>
                    <ul>
                        <li><a href="">Partners</a></li>
                        <li><a href="">Bloggers</a></li>
                        <li><a href="">Support</a></li>
                        <li><a href="">Terms of Use</a></li>
                        <li><a href="">Press</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget about-widget">
                    <h2>Questions</h2>
                    <div class="fw-latest-post-widget">
                        <div class="lp-item">
                            <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/1.jpg"></div>
                            <div class="lp-content">
                                <h6>what shoes to wear</h6>
                                <span>Oct 21, 2018</span>
                                <a href="#" class="readmore">Read More</a>
                            </div>
                        </div>
                        <div class="lp-item">
                            <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/2.jpg"></div>
                            <div class="lp-content">
                                <h6>trends this year</h6>
                                <span>Oct 21, 2018</span>
                                <a href="#" class="readmore">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="footer-widget contact-widget">
                    <h2>Questions</h2>
                    <div class="con-info">
                        <span>C.</span>
                        <p>Your Company Ltd </p>
                    </div>
                    <div class="con-info">
                        <span>B.</span>
                        <p>1481 Creekside Lane Avila Beach, CA 93424, P.O. BOX 68 </p>
                    </div>
                    <div class="con-info">
                        <span>T.</span>
                        <p>+53 345 7953 32453</p>
                    </div>
                    <div class="con-info">
                        <span>E.</span>
                        <p>office@youremail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="social-links-warp">
        <div class="container">
            <div class="social-links">
                <a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
                <a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
                <a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
                <a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
                <a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
                <a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
                <a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
            </div>



            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            <p class="text-white text-center mt-5">Copyright &copy;
                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is
                made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                                 target="_blank">Colorlib</a>
            </p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </div>



    </div>



</section>
Footer section end



<!--====== Javascripts & Jquery ======-->
<!--<script src="categoryAssets/js/jquery-3.2.1.min.js"></script>-->
<!--<script src="categoryAssets/js/bootstrap.min.js"></script>-->
<script src="categoryAssets/js/jquery.slicknav.min.js"></script>
<script src="categoryAssets/js/owl.carousel.min.js"></script>
<script src="categoryAssets/js/jquery.nicescroll.min.js"></script>
<script src="categoryAssets/js/jquery.zoom.min.js"></script>
<script src="categoryAssets/js/jquery-ui.min.js"></script>
<script src="categoryAssets/js/main.js"></script>

</body>

</html>