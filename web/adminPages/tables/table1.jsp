<%-- 
    Document   : table1
    Created on : May 21, 2021, 12:04:46 PM
    Author     : jatin
--%>

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

                        <div class="row ">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Order Status</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>

                                                        <th> Product id </th>
                                                        <th> Product </th>
                                                        <th> Price </th>
                                                        <th> discount </th>
                                                        <th> discount remark </th>
                                                        <th> edit details </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td> 11111 </td>
                                                        <td> Aman </td>
                                                        <td> 10 rs </td>
                                                        <td> 9 </td>
                                                        <td> useless </td>
                                                        <td>
                                                            <div class="badge badge-outline-success">Edit</div>
                                                            <div class="badge badge-outline-success">delete</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td> 11111 </td>
                                                        <td> Aman </td>
                                                        <td> 10 rs </td>
                                                        <td> 9 </td>
                                                        <td> useless </td>
                                                        <td>
                                                            <div class="badge badge-outline-success">Edit</div>
                                                            <div class="badge badge-outline-success">delete</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td> 11111 </td>
                                                        <td> Aman </td>
                                                        <td> 10 rs </td>
                                                        <td> 9 </td>
                                                        <td> useless </td>
                                                        <td>
                                                            <div class="badge badge-outline-success">Edit</div>
                                                            <div class="badge badge-outline-success">delete</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td> 11111 </td>
                                                        <td> Aman </td>
                                                        <td> 10 rs </td>
                                                        <td> 9 </td>
                                                        <td> useless </td>
                                                        <td>
                                                            <div class="badge badge-outline-success">Edit</div>
                                                            <div class="badge badge-outline-success">delete</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td> 11111 </td>
                                                        <td> Aman </td>
                                                        <td> 10 rs </td>
                                                        <td> 9 </td>
                                                        <td> useless </td>
                                                        <td>
                                                            <div class="badge badge-outline-success">Edit</div>
                                                            <div class="badge badge-outline-success">delete</div>
                                                        </td>
                                                    </tr>
                                                   
                                                </tbody>
                                            </table>
                                        </div>
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