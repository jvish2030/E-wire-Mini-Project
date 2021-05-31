<%-- 
    Document   : form1
    Created on : May 18, 2021, 9:52:26 PM
    Author     : jatin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="com.java.ConPool.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="../include/header.jsp"/>



    <div class="content-wrapper">
        <div class="jumbotron text-center bg-dark" style="margin-bottom:0">
            <h1>All Customers</h1>
            <p>Resize this responsive page to see the effect!</p> 
        </div>

        <%ResultSet rs1 = DBUtils.getAllCustomers();%>
        <div class="row ">
            <div class="col-12 grid-margin">

                        <table class="table table-hover table-dark text-white-50">
                            <thead class="bg-primary" >
                                <tr>
                                    <th class="text-light"> Customer id </th>
                                    <th class="text-light"> FullName </th>
                                    <th class="text-light"> Email </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%while (rs1.next()) {%>
                                <tr>
                                    <td> <%=rs1.getInt(1)%> </td>
                                    <td>  <%=rs1.getString(2)%></td>
                                    <td>  <%=rs1.getString(3)%></td>
                                </tr>   
                                <%}%>
                            </tbody>
                        </table>
                  

            </div>
        </div>

    </div>
</div>
</div>

</body>

</html>