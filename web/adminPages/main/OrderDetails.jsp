<%-- 
    Document   : OrderDetails
    Created on : Jul 22, 2021, 9:06:27 PM
    Author     : jatin
--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="../include/header.jsp"/>



    <div class="content-wrapper">
        <div class="text-center bg-primary p-3" style="margin-bottom:0;padding-top:5px;">
            <h1 class="">Order details of user id : ${param.uid}</h1>
            <p>Order details</p> 
        </div>
        <jsp:useBean id="DeliveryDetails" class="com.mvc.dao.AdminDao"/>
        <c:set var="obj" value="${DeliveryDetails.getDeliveryAddress(param.uid)}"></c:set>
            <fieldset>
                <div class="table-responsive ">

                    <table class="table table-bordered table-dark table-striped">
                        <tr>
                            <td class="text-light">First Name : </td>
                            <td class="font-weight-bold text-white">${obj.getFname()}</td>
                        <td class="text-light">Last Name  : </td>
                        <td class="font-weight-bold text-white">${obj.getLname()}</td>
                    </tr>
                    <tr>
                        <td class="text-light">State: </td>
                        <td class="font-weight-bold text-white">${obj.getState()}</td>
                        <td class="text-light">City  : </td>
                        <td class="font-weight-bold text-white">${obj.getCity()}</td>
                    </tr>
                    <tr>
                        <td class="text-light">Country :</td>
                        <td class="font-weight-bold text-white">${obj.getCountry()}</td>
                        <td class="text-light">Pin  : </td>
                        <td class="font-weight-bold text-white">${obj.getPin()}</td>
                    </tr>
                    <tr>
                        <td class="text-light">Email : </td>
                        <td class="font-weight-bold text-white">${obj.getEmail()}</td>
                        <td class="text-light">Mobile  : </td>
                        <td class="font-weight-bold text-white">${obj.getMobile()}</td>
                    </tr>

                    <tr>
                        <td class="text-light">Address type : </td>
                        <td class="font-weight-bold text-white">${obj.getAddType()}</td>
                    </tr>

                </table>
            </div>

        </fieldset>

        <fieldset>
            <div class="table-responsive ">

                <table class="table table-bordered table-dark table-striped">
                    <tr>
                        <td class="text-light">Address 1 : </td>
                        <td class="font-weight-bold text-white">${obj.getAddress1()}</td>
                    </tr>
                    <tr>
                        <td class="text-light">Address 2 : </td>
                        <td class="font-weight-bold text-white">${obj.getAddress2()}</td>
                    </tr>
                </table>
            </div>
        </fieldset>

        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <th>Sr. No.</th>
            <th>Product Name</th>
            <th>Photo</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Amount</th>                    
            </thead>
            <tbody>
                <c:set var="count" value="${1}"/>
                <c:forEach items="${DeliveryDetails.getUserCart(param.oid)}" var="element">
                    <tr>
                        <td></td>
                    </tr>
                </c:forEach>
                <%
                    int counter = 1, total = 0;
                    while (rs.next()) {
                %>

                <%
                        counter++;
                        total += rs.getInt("qty") * rs.getInt("disc_price");
                    }
                %>
            </tbody>
            <tfoot class="table-dark">
                <tr>
                    <th colspan="5">Total Bill Amount</th>
                    <th>&#8377; <%= total%></th>
                </tr>
            </tfoot>
        </table>

    </div>
</div>
</div>
</body>
</html>