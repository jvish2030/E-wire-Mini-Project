<ul class="top-hnt-right-content col-lg-6">

    <% if (session.getAttribute("userid") == null) {%>
    <li class="button-log usernhy">
        <a class="btn-open" href="#">
            <span class="fa fa-user" aria-hidden="true"></span>
        </a>
    </li>
    <%} else {%>
    <li class="button-signout usernhy">
        <a class="btn-open"  href="${pageContext.request.contextPath}/Operation?operation=logout">
            <span class="fa fa-sign-out" aria-hidden="true"></span>
        </a>
    </li>
    <% }%>

    <li class="transmitvcart galssescart2 cart cart box_1">
        <form action="#" method="post" class="last">

            <button class="top_transmitv_cart" type="submit" name="submit" value="">
                <a href="cart.jsp">My Cart
                    <span class="fa fa-shopping-cart"></span>  </a>
            </button>
        </form>
    </li>
</ul>