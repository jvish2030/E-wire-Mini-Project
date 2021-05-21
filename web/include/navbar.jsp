<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid serarc-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}\home?page=home">
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
        <!--//search-right-->
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon fa fa-bars"> </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}\home?page=home">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}\view?page=about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}\view?page=contact">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}\view?page=faq">Faq's</a>
                </li>
            </ul>

        </div>
    </div>
</nav>