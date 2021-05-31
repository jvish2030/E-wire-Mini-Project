<%-- 
    Document   : adminPage
    Created on : May 17, 2021, 7:37:06 PM
    Author     : jatin
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.java.ConPool.DBUtils" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <jsp:include page="../include/header.jsp"/>

    <!-- partial -->
    <div class="main-panel py-0">

        <div class="content-wrapper py-0">
            <jsp:include page="../../include/message.jsp"/>
            <!-- <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card corona-gradient-card">
                  <div class="card-body py-0 px-0 px-sm-3">
                    <div class="row align-items-center">
                      <div class="col-4 col-sm-3 col-xl-2">
                        <img src="adminAssets/images/dashboard/Group126@2x.png" class="gradient-corona-img img-fluid" alt="">
                      </div>
                      <div class="col-5 col-sm-7 col-xl-8 p-0">
                        <h4 class="mb-1 mb-sm-0">Want even more features?</h4>
                        <p class="mb-0 font-weight-normal d-none d-sm-block">Check out our Pro version with 5 unique
                          layouts!</p>
                      </div>
                      <div class="col-3 col-sm-2 col-xl-2 pl-0 text-center">
                        <span>
                          <a href="https://www.bootstrapdash.com/product/corona-admin-template/" target="_blank"
                            class="btn btn-outline-light btn-rounded get-started-btn">Upgrade to PRO</a>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div> -->


            <div id="Customers" class="tabcontent">
                <p class="text-right">
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-content-end" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-format-line-spacing text-light"></span>
                    </button>    
                </p>
                <h1>
                    <span class="menu-icon"><i class="mdi mdi-account"></i>Customers</span>
                </h1>
            </div>
            <div id="Products" class="tabcontent">
                <p class="text-right">
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-content-end" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-format-line-spacing text-light"></span>
                    </button>    
                </p>
                <h1><span class="menu-icon"><i class="mdi mdi-basket"></i>Products</span></h1>
            </div>

            <div id="Categories" class="tabcontent">
                <p class="text-right">
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-content-end" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-format-line-spacing text-light"></span>
                    </button>    
                </p>
                <h1><span class="menu-icon"><i class="mdi mdi-format-float-none"></i>Categories</span></h1>
            </div>

            <div id="Orders" class="tabcontent">
                <p class="text-right">
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-content-end" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-format-line-spacing text-light"></span>
                    </button>    
                </p>
                <h1><span class="menu-icon"><i class="mdi mdi-package-variant"></i>Orders</span></h1>
            </div>

            <div class="row">
                <div class="col-xl-3 col-sm-6 grid-margin stretch-card ">
                    <div class="card">
                        <div class="card-body tablink" onclick="openBlock('Customers', this, '#0079C2')"  id="defaultOpen">
                            <div class="row">
                                <div class="col-9">
                                    <div class="d-flex align-items-center align-self-start">
                                        <h3 class="mb-0">
                                            Customer
                                        </h3>
                                        <p class="text-success ml-2 mb-0 font-weight-medium">
                                            <%= DBUtils.getCount("users")%>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="icon icon-box-success ">
                                        <span class="mdi mdi-arrow-top-right icon-item"></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 grid-margin stretch-card ">
                    <div class="card">
                        <div class="card-body tablink"  onclick="openBlock('Products', this, '#32CD32')">
                            <div class="row">
                                <div class="col-9">
                                    <div class="d-flex align-items-center align-self-start">
                                        <h3 class="mb-0">Products</h3>
                                        <p class="text-success ml-2 mb-0 font-weight-medium"><%= DBUtils.getCount("productS")%></p>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="icon icon-box-success">
                                        <span class="mdi mdi-arrow-top-right icon-item"></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 grid-margin stretch-card ">
                    <div class="card">
                        <div class="card-body tablink" onclick="openBlock('Categories', this, '#DC143C')">
                            <div class="row">
                                <div class="col-9">
                                    <div class="d-flex align-items-center align-self-start">
                                        <h3 class="mb-0">Categories</h3>
                                        <p class="text-success ml-2 mb-0 font-weight-medium"><%= DBUtils.getCount("categories")%></p>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="icon icon-box-success ">
                                        <span class="mdi mdi-arrow-top-right icon-item"></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 grid-margin stretch-card ">
                    <div class="card">
                        <div class="card-body tablink" onclick="openBlock('Orders', this, '#48D1CC')">
                            <div class="row ">
                                <div class="col-9">
                                    <div class="d-flex align-items-center align-self-start">
                                        <h3 class="mb-0">Orders</h3>
                                        <p class="text-danger ml-2 mb-0 font-weight-medium"><%= DBUtils.getCount("orders")%></p>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="icon icon-box-danger">
                                        <span class="mdi mdi-arrow-bottom-left icon-item"></span>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div id="Customers2" class="tabcontent px-0">
                <%ResultSet rs1 = DBUtils.getAllCustomers();%>
                <div class="row ">
                    <div class="col-12 grid-margin">

                        <table class="table table-hover table-dark text-white-50 py-5">
                            <thead class="bg-primary p-lg-5" >
                                <tr >
                                    <th class="text-light"> <h3>Customer id</h3> </th>
                                    <th class="text-light"><h3>FullName</h3>  </th>
                                    <th class="text-light"> <h3>Email</h3> </th>
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
            <div id="Products2" class="tabcontent px-0">
                <%ResultSet rs2 = DBUtils.getParentRows();%>
                <div class="row ">
                    <div class="col-12 grid-margin">
                        <div id="accordion">

                            <%while (rs2.next()) {
                                    ResultSet rs3 = DBUtils.getChildRows(rs2.getInt(1));
                                    String s = "id" + rs2.getInt(1);
                            %>
                            <div class="card">
                                <a class="card-link" data-toggle="collapse" href="#<%=s%>">
                                    <div class="card-header" id="products-green">

                                        <h4 class="card-title text-left"><span><i class="fa fa-tasks">  </i></span> <%=rs2.getString(3)%> <i class="fa fa-sort"></i></h4>
                                    </div>

                                </a>
                                <div id="<%=s%>" class="collapse" data-parent="#accordion">
                                    <div class="card-body px-0">                             
                                        <div style="height: 500px;overflow: scroll;">
                                            <div class="table-responsive ">
                                                <table class="table table-hover table-dark text-white-50 py-5">
                                                    <thead style="background-color:#32CD32;">
                                                        <tr>
                                                            <th class="text-light "><h3>Product id</h3>  </th>
                                                            <th class="text-light"><h3>Product</h3>  </th>
                                                            <th class="text-light"><h3>Category</h3>  </th>
                                                            <th class="text-light"><h3>Price</h3>  </th>
                                                            <th class="text-light"><h3>Discount price</h3> </th>
                                                            <th class="text-light"><h3>Remark</h3>  </th>
                                                            <th class="text-light"><h3>Date </h3></th>
                                                            <th class="text-light"><h3>Edit </h3>  </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%while (rs3.next()) {%>
                                                        <tr>
                                                            <td> <%=rs3.getInt(1)%> </td>
                                                            <td>
                                                                <img alt="#" src="../../images/products/<%=rs3.getInt(1)%>.jpg" />
                                                                <%=rs3.getString(2)%>
                                                            </td>
                                                            <td>  <%=rs3.getString(3)%></td>
                                                            <td>&#8377;<%=rs3.getInt(4)%></td>
                                                            <td>&#8377;<%=rs3.getInt(5)%></td>
                                                            <td> <%=rs3.getString(6)%>  </td>
                                                            <td> <%=rs3.getDate(8)%>  </td>
                                                            <td>
                                                                <a class="btn btn-outline-primary">Edit</a>
                                                                <a href="${pageContext.request.contextPath}\AdminOperation?operation=deleteProduct&id=<%=rs3.getInt(1)%>"  class="btn btn-outline-danger">delete</a>
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
            <div id="Categories2" class="tabcontent px-0">
                    <div id="accordion">

                        <%
                            Set CategorySet = DBUtils.getCategoriesSet();
                            Iterator itr4 = CategorySet.iterator();
                            while (itr4.hasNext()) {
                                Map.Entry CategoryEntry = (Map.Entry) itr4.next();
                                String s = "id" + CategoryEntry.getKey();

                        %>

                        <div class="card ">
                            <div class="card-header pb-0 mb-0" id="products-red" >
                                <div class="preview-list">
                                    <div class="preview-item border-bottom py-0">
                                        <div class="preview-thumbnail">
                                            <div class="preview-icon">
                                                <img  alt="#" class="rounded-circle border border-info" src="../../images/category/<%=CategoryEntry.getKey()%>.jpg">                                                                                                   
                                            </div>  
                                        </div>
                                        <div class="preview-item-content d-sm-flex flex-grow">
                                            <div class="flex-grow">
                                                <h6 class="preview-subject text-left"> 
                                                    <a class="card-link text-light " data-toggle="collapse" href="#<%=s%>">
                                                        <%= CategoryEntry.getValue()%>
                                                        <i class="fa fa-sort"></i>
                                                    </a>
                                                </h6>
                                                <p class="text-muted mb-0 ">Categories</p>
                                            </div>
                                            <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                <p class="text-muted mb-0 mt-0 "><a class="btn btn-link text-primary py-0">Rename</a></p>
                                                <p class="text-muted mb-0"><a href="${pageContext.request.contextPath}\AdminOperation?operation=deleteParentCat&id=<%=CategoryEntry.getKey()%>" class="btn btn-link text-danger">Delete</a></p>
                                            </div>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                            <div id="<%=s%>" class="collapse " data-parent="#accordion">
                                <div class="card-body py-2">
                                    <%
                                        for (String s2 : DBUtils.getSubCategories((int) CategoryEntry.getKey())) {
                                    %>
                                    <div class="preview-list">
                                        <div class="preview-item border-bottom py-0">
                                            <div class="preview-item-content d-sm-flex flex-grow">
                                                <div class="flex-grow">
                                                    <h6 class="preview-subject"> 
                                                        <a class="card-link ml-5 text-secondary"><%= s2%></a> 
                                                    </h6>
                                                </div>
                                                <div class="mr-auto text-sm-right pt-2 pt-sm-0">
                                                    <p class="text-muted mb-0 mt-0 "><a href="${pageContext.request.contextPath}\AdminOperation?operation=deleteChildCat&name=<%=s2%>" class="btn btn-link text-danger"><i class="fa fa-close" style="color:red"></i></a></p>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>

            </div>

            <div id="Orders2" class="tabcontent">
                content4

            </div>


            <script>
                function openBlock(elementName, elmnt, color) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablink");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].style.backgroundColor = "";
                    }
                    document.getElementById(elementName).style.display = "block";
                    document.getElementById(elementName + '2').style.display = "block";
                    elmnt.style.backgroundColor = color;

                }
                // Get the element with id="defaultOpen" and click on it
                document.getElementById("defaultOpen").click();
            </script>
        </div>
    </div>
</div>
</div>
</body>

</html>