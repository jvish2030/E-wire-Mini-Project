<div class="top-hny-left-content col-lg-6 pl-lg-0">
    <% if (session.getAttribute("userid") != null) {%>
    <h6 class="text-lowercase" style="font-family: 'Comic Neue';font-size: 22px;"> Welcome, <%= session.getAttribute("uname")%></h6>
    <% } else {%>

    <h6 class="text-lowercase" style="font-family: 'Comic Neue';font-size: 22px;"> E-Wire <a href="#" target="_blank"> Click here for <span
                class="fa fa-hand-o-right hand-icon" aria-hidden="true"></span> <span
                class="hignlaite">More details</span></a></h6>
            <% }%>
</div>