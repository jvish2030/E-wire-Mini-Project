<!--   if user registered display success mesage-->
<%
    if (session.getAttribute("message") != null) {
%>  
<div class="row" id="register-alert">
    <div class="col-sm-5 mx-auto">
        <div id="success-alert" class=" alert alert-success alert-dismissible fade show" role="alert">
            <%= session.getAttribute("message")%>                             
        </div>
    </div>
</div>
<!--registeratin message-->
<script>
    $(document).ready(function () {
        $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
            $("#success-alert").slideUp(500);
        });
    });
</script>
<%
        session.removeAttribute("message");
    }
%>                    
<!--             //       if user registered display success mesage-->

<!--   If User not register and try to login , show error-->
<%
    if (session.getAttribute("errMessage") != null) {
%>  
<div class="row" id="register-alert">
    <div class="col-sm-5 mx-auto">
        <div id="danger-alert" class=" alert alert-danger alert-dismissible fade show" role="alert">
           <%= session.getAttribute("errMessage")%>                              
        </div>
    </div>
</div>
<!--registeratin message-->
<script>
    $(document).ready(function () {
        $("#danger-alert").fadeTo(2000, 500).slideUp(500, function () {
            $("#danger-alert").slideUp(500);
        });
    });
</script>
<%
        session.removeAttribute("errMessage");
    }
%>     
<!--   If User not register and try to login , show error-->