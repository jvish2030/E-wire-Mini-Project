<!--   if user registered display success mesage-->
<%
    if (request.getAttribute("message") != null) {
%>  
<div class="row" id="register-alert">
    <div class="col-sm-5 mx-auto">
        <div id="success-alert" class=" alert alert-success alert-dismissible fade show" role="alert">
            <strong><%= request.getAttribute("message")%></strong>                               
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
        request.setAttribute("message",null);
    }
%>                    
<!--             //       if user registered display success mesage-->

<!--   If User not register and try to login , show error-->
<%
    if (request.getAttribute("errMessage") != null) {
%>  
<div class="row" id="register-alert">
    <div class="col-sm-5 mx-auto">
        <div id="danger-alert" class=" alert alert-danger alert-dismissible fade show" role="alert">
            <strong><%= request.getAttribute("errMessage")%></strong>                                
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
        request.setAttribute("errMessage",null);
    }
%>     
<!--   If User not register and try to login , show error-->