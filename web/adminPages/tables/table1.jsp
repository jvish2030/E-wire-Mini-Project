<%-- 
    Document   : table1
    Created on : May 21, 2021, 12:04:46 PM
    Author     : jatin
--%>

<%@page import="com.java.ConPool.DBUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="../include/header.jsp"/>
    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="page-header">
                <!-- <h3 class="page-title"> Basic Tables </h3> -->
                <nav aria-label="breadcrumb">
                    <!-- <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="#">Tables</a></li>
                      <li class="breadcrumb-item active" aria-current="page">Basic tables</li>
                    </ol> -->
                </nav>
            </div>
            <%ResultSet rs1 = DBUtils.getParentRows();%>
            <div class="row ">
                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <%while (rs1.next()) {
                                    ResultSet rs2 = DBUtils.getChildRows(rs1.getInt(1));
                            %>
                            <h4 class="card-title"><%=rs1.getString(3)%> </h4>
                            <div style="height: 500px;overflow: scroll;">
                                <div class="table-r
                                     esponsive ">
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
                                                <td> <%=rs2.getInt(1) %> </td>
                                                <td>
                                                    <img alt="#" src="../../images/products/<%=rs2.getString(9) %>" />
                                                    <%=rs2.getString(2)%>
                                                </td>
                                                <td>  <%=rs2.getString(3)%></td>
                                                <td>&#8377;<%=rs2.getInt(4)%></td>
                                                <td>&#8377;<%=rs2.getInt(5)%></td>
                                                <td> <%=rs2.getString(6)%>  </td>
                                                  <td> <%=rs2.getDate(8)%>  </td>
                                                <td>
                                                    <a class="btn btn-outline-success">Edit</a>
                                                    <a href="${pageContext.request.contextPath}\AdminOperation?operation=deleteProduct&id=<%=rs2.getInt(1)%>"  class="btn btn-outline-danger">delete</a>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="col-lg-12 grid-margin stretch-card">
                        
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Inverse table</h4>
                  <p class="card-description"> Add class <code>.table-dark</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-dark">
                      <thead>
                        <tr>
                          <th> # </th>
                          <th> First name </th>
                          <th> Amount </th>
                          <th> Deadline </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td> 1 </td>
                          <td> Herman Beck </td>
                          <td> $ 77.99 </td>
                          <td> May 15, 2015 </td>
                        </tr>
                        <tr>
                          <td> 2 </td>
                          <td> Messsy Adam </td>
                          <td> $245.30 </td>
                          <td> July 1, 2015 </td>
                        </tr>
                        <tr>
                          <td> 3 </td>
                          <td> John Richards </td>
                          <td> $138.00 </td>
                          <td> Apr 12, 2015 </td>
                        </tr>
                        <tr>
                          <td> 4 </td>
                          <td> Peter Meggik </td>
                          <td> $ 77.99 </td>
                          <td> May 15, 2015 </td>
                        </tr>
                        <tr>
                          <td> 5 </td>
                          <td> Edward </td>
                          <td> $ 160.25 </td>
                          <td> May 03, 2015 </td>
                        </tr>
                        <tr>
                          <td> 6 </td>
                          <td> John Doe </td>
                          <td> $ 123.21 </td>
                          <td> April 05, 2015 </td>
                        </tr>
                        <tr>
                          <td> 7 </td>
                          <td> Henry Tom </td>
                          <td> $ 150.00 </td>
                          <td> June 16, 2015 </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Table with contextual classes</h4>
                  <p class="card-description"> Add class <code>.table-{color}</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-bordered table-contextual">
                      <thead>
                        <tr>
                          <th> # </th>
                          <th> First name </th>
                          <th> Product </th>
                          <th> Amount </th>
                          <th> Deadline </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="table-info">
                          <td> 1 </td>
                          <td> Herman Beck </td>
                          <td> Photoshop </td>
                          <td> $ 77.99 </td>
                          <td> May 15, 2015 </td>
                        </tr>
                        <tr class="table-warning">
                          <td> 2 </td>
                          <td> Messsy Adam </td>
                          <td> Flash </td>
                          <td> $245.30 </td>
                          <td> July 1, 2015 </td>
                        </tr>
                        <tr class="table-danger">
                          <td> 3 </td>
                          <td> John Richards </td>
                          <td> Premeire </td>
                          <td> $138.00 </td>
                          <td> Apr 12, 2015 </td>
                        </tr>
                        <tr class="table-success">
                          <td> 4 </td>
                          <td> Peter Meggik </td>
                          <td> After effects </td>
                          <td> $ 77.99 </td>
                          <td> May 15, 2015 </td>
                        </tr>
                        <tr class="table-primary">
                          <td> 5 </td>
                          <td> Edward </td>
                          <td> Illustrator </td>
                          <td> $ 160.25 </td>
                          <td> May 03, 2015 </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>-->
        </div> 
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html --



>
<footer class="footer">
        <!-- <div class="d-sm-flex justify-content-center justify-content-sm-between">
      <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com
        2020</span>
      <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a
          href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin
          templates</a> from Bootstrapdash.com</span>
    </div> 
        </footer>-->
        <!-- partial -->
    </div>
    <!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="../../adminAssets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="../../adminAssets/js/off-canvas.js"></script>
<script src="../../adminAssets/js/hoverable-collapse.js"></script>
<script src="../../adminAssets/js/misc.js"></script>
<script src="../../adminAssets/js/settings.js"></script>
<script src="../../adminAssets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<!-- End custom js for this page -->
</body>

</html>