<%-- 
    Document   : error
    Created on : May 5, 2021, 2:26:15 PM
    Author     : jatin
--%>

<%@page contentType="text/html" isErrorPage="true" pageEncoding="UTF-8"%>
<jsp:include page="include/header.jsp"/>

<div class="alert  my-5" role="alert">
    <h4 class="alert-heading">Something went Wrong!</h4>
    <p></p>
    <hr>
    <p class="mb-0"> <h3 class="text-danger">Error : <%= exception.getMessage()%></h3></p>
</div>
<jsp:include page="include/footer.jsp"/>