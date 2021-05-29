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

        <%ResultSet rs1 = DBUtils.getParentRows();%>
        <div class="row ">
            <div class="col-12 grid-margin">
                <div id="accordion">

                    <%while (rs1.next()) {
                            ResultSet rs2 = DBUtils.getChildRows(rs1.getInt(1));
                            String s = rs1.getString(3).replaceAll(" ", "");
                    %>
                    <div class="card">
                        <div class="card-header">
                            <a class="card-link" data-toggle="collapse" href="#<%=s%>">
                                <h4 class="card-title  text-primary"><%=rs1.getString(3)%> <i class="fa fa-sort"></i></h4>
                            </a>
                        </div>
                        <div id="<%=s%>" class="collapse" data-parent="#accordion">
                            <div class="card-body">                             
                                <div style="height: 500px;overflow: scroll;">
                                    <div class="table-responsive ">
                                        <table class="table table-hover table-dark text-white-50">
                                            <thead class="bg-primary" >
                                                <tr>
                                                    <th class="text-light"> Product id </th>
                                                    <th class="text-light"> Product </th>
                                                    <th class="text-light"> Category </th>
                                                    <th class="text-light"> Price </th>
                                                    <th class="text-light"> discount price </th>
                                                    <th class="text-light"> discount remark </th>
                                                    <th class="text-light"> Date </th>
                                                    <th class="text-light"> edit details </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%while (rs2.next()) {%>
                                                <tr>
                                                    <td> <%=rs2.getInt(1)%> </td>
                                                    <td>
                                                        <img alt="#" src="../../images/products/<%=rs2.getString(9)%>" />
                                                        <%=rs2.getString(2)%>
                                                    </td>
                                                    <td>  <%=rs2.getString(3)%></td>
                                                    <td>&#8377;<%=rs2.getInt(4)%></td>
                                                    <td>&#8377;<%=rs2.getInt(5)%></td>
                                                    <td> <%=rs2.getString(6)%>  </td>
                                                    <td> <%=rs2.getDate(8)%>  </td>
                                                    <td>
                                                        <a class="btn btn-outline-primary">Edit</a>
                                                        <a href="${pageContext.request.contextPath}\AdminOperation?operation=deleteProduct&id=<%=rs2.getInt(1)%>"  class="btn btn-outline-danger">delete</a>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div> 
    </div>
</div>
</div>

</body>

</html>