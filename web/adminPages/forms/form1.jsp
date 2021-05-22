<%-- 
    Document   : form1
    Created on : May 18, 2021, 9:52:26 PM
    Author     : jatin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>E-WIRE Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="../../adminAssets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../../adminAssets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <link rel="stylesheet" href="../../adminAssets/vendors/select2/select2.min.css">
        <link rel="stylesheet" href="../../adminAssets/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="../../adminAssets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="../../adminAssets/images/favicon.png" />
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:../../partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">

                <ul class="nav">
                    <li class="nav-item profile">
                        <div class="profile-desc">
                            <div class="profile-pic">
                                <div class="count-indicator">
                                    <img class="img-xs rounded-circle " src="../../adminAssets/images/faces/face15.jpg" alt="">
                                    <span class="count bg-success"></span>
                                </div>
                                <div class="profile-name">
                                    <h5 class="mb-0 font-weight-normal">Hari Om</h5>
                                    <span>Gold Member</span>
                                </div>
                            </div>
                            <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a>
                            <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
                                 aria-labelledby="profile-dropdown">
                                <a href="#" class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-dark rounded-circle">
                                            <i class="mdi mdi-settings text-primary"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <p class="preview-subject ellipsis mb-1 text-small">Account settings</p>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-dark rounded-circle">
                                            <i class="mdi mdi-onepassword  text-info"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <p class="preview-subject ellipsis mb-1 text-small">Change Password</p>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <div class="preview-icon bg-dark rounded-circle">
                                            <i class="mdi mdi-calendar-today text-success"></i>
                                        </div>
                                    </div>
                                    <div class="preview-item-content">
                                        <p class="preview-subject ellipsis mb-1 text-small">To-do list</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item nav-category">
                        <span class="nav-link">Navigation</span>
                    </li>
                    <li class="nav-item menu-items">
                        <a class="nav-link" href="../../index.html">
                            <span class="menu-icon">
                                <i class="mdi mdi-speedometer"></i>
                            </span>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>

                    <li class="nav-item menu-items">
                        <a class="nav-link" href="forms/AdminPages/basic_elements.html">
                            <span class="menu-icon">
                                <i class="mdi mdi-playlist-play"></i>
                            </span>
                            <span class="menu-title">Form Elements</span>
                        </a>
                    </li>
                    <li class="nav-item menu-items">
                        <a class="nav-link" href="../AdminPages/tables/basic-table.html">
                            <span class="menu-icon">
                                <i class="mdi mdi-table-large"></i>
                            </span>
                            <span class="menu-title">Tables</span>
                        </a>
                    </li>
                    <li class="nav-item menu-items">
                        <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                            <span class="menu-icon">
                                <i class="mdi mdi-security"></i>
                            </span>
                            <span class="menu-title">User Pages</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="auth">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="../AdminPages/samples/blank-page.html"> Blank Page </a></li>
                                <li class="nav-item"> <a class="nav-link" href="../AdminPages/samples/error-404.html"> 404 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="../AdminPages/samples/error-500.html"> 500 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="../AdminPages/samples/login.html"> Login </a></li>
                                <li class="nav-item"> <a class="nav-link" href="../AdminPages/samples/register.html"> Register </a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:../../partials/_navbar.html -->
                <nav class="navbar p-0 fixed-top d-flex flex-row">
                    <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
                        <a class="navbar-brand brand-logo-mini" href="../../index.html"><img src="../../adminAssets/images/logo-mini.svg"
                                                                                             alt="logo" /></a>
                    </div>
                    <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                            <span class="mdi mdi-menu"></span>
                        </button>
                        <ul class="navbar-nav w-100">
                            <li class="nav-item w-100">
                                <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
                                    <input type="text" class="form-control" placeholder="Search products">
                                </form>
                            </li>
                        </ul>
                        <ul class="navbar-nav navbar-nav-right">                           
                            <li class="nav-item dropdown border-left">
                                <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="mdi mdi-email"></i>
                                    <span class="count bg-success"></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                                     aria-labelledby="messageDropdown">
                                    <h6 class="p-3 mb-0">Messages</h6>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <img src="../../adminAssets/images/faces/face4.jpg" alt="image" class="rounded-circle profile-pic">
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject ellipsis mb-1">New Stock arrived</p>
                                            <p class="text-muted mb-0"> 1 Minutes ago </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <img src="../../adminAssets/images/faces/face2.jpg" alt="image" class="rounded-circle profile-pic">
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject ellipsis mb-1">Few items out of stock</p>
                                            <p class="text-muted mb-0"> 15 Minutes ago </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <img src="../../adminAssets/images/faces/face3.jpg" alt="image" class="rounded-circle profile-pic">
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject ellipsis mb-1">Stock Updated</p>
                                            <p class="text-muted mb-0"> 18 Minutes ago </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <p class="p-3 mb-0 text-center">4 new messages</p>
                                </div>
                            </li>
                            <li class="nav-item dropdown border-left">
                                <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#"
                                   data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <span class="count bg-danger"></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                                     aria-labelledby="notificationDropdown">
                                    <h6 class="p-3 mb-0">Notifications</h6>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <div class="preview-icon bg-dark rounded-circle">
                                                <i class="mdi mdi-calendar text-success"></i>
                                            </div>
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject mb-1">Event today</p>
                                            <p class="text-muted ellipsis mb-0"> Just a reminder that you have an event today </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <div class="preview-icon bg-dark rounded-circle">
                                                <i class="mdi mdi-settings text-danger"></i>
                                            </div>
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject mb-1">Settings</p>
                                            <p class="text-muted ellipsis mb-0"> Update dashboard </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <div class="preview-icon bg-dark rounded-circle">
                                                <i class="mdi mdi-link-variant text-warning"></i>
                                            </div>
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject mb-1">Launch Admin</p>
                                            <p class="text-muted ellipsis mb-0"> New admin wow! </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <p class="p-3 mb-0 text-center">See all notifications</p>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                                    <div class="navbar-profile">
                                        <img class="img-xs rounded-circle" src="../../adminAssets/images/faces/face15.jpg" alt="">
                                        <p class="mb-0 d-none d-sm-block navbar-profile-name">Hari Om</p>
                                        <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                                     aria-labelledby="profileDropdown">
                                    <h6 class="p-3 mb-0">Profile</h6>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <div class="preview-icon bg-dark rounded-circle">
                                                <i class="mdi mdi-settings text-success"></i>
                                            </div>
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject mb-1">Settings</p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <div class="preview-icon bg-dark rounded-circle">
                                                <i class="mdi mdi-logout text-danger"></i>
                                            </div>
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="preview-subject mb-1">Log out</p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <p class="p-3 mb-0 text-center">Advanced settings</p>
                                </div>
                            </li>
                        </ul>
                        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                                data-toggle="offcanvas">
                            <span class="mdi mdi-format-line-spacing"></span>
                        </button>
                    </div>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="page-header">
                            <h3 class="page-title"> Form elements </h3> 
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Forms</a></li>
                                    <li class="breadcrumb-item active">Form elements</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-md-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Add New Product</h4>
                                        <form class="forms-sample">
                                            <div class="row">
                                                <div class="col-lg-5 col-md-6 " >
                                                    <div class="form-group">
                                                        <label for="productName">Name of Product</label>
                                                        <input type="text" class="form-control" id="productName" placeholder="name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="productPrice">Product Price</label>
                                                        <input type="email" class="form-control" id="productPrice" placeholder="price">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="productDiscount">Discount Price</label>
                                                        <input type="number" class="form-control" id="productDiscount" placeholder="Discount">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="productCategory" >Product Category</label>
                                                        <input type="text" class="form-control" id="productCategory" placeholder="Product Category">
                                                    </div>
                                                </div>
                                                <div class="col-lg-5 offset-lg-2 col-md-6 " >
                                                    <div class="form-group ">
                                                        <label for="product" >Product Photo</label>                                                    
                                                        <input  class="custom-control" type="file" id="actual-btn"/>                                                    
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="productRemark" >Discount Remark</label>
                                                        <input type="text" class="form-control" id="productRemark" placeholder="Discount Remark">
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="productDescription" >Description</label>
                                                        <textarea class="form-control" id="productDescription" placeholder="Description" rows="4" cols="50" ></textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                                    <button class="btn btn-dark">Cancel</button>

                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Add New Category</h4>
                                        <form class="form-sample">

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 col-form-label">Category</label>
                                                        <div class="col-sm-9">
                                                            <select class="form-control">
                                                                <option>Category1</option>
                                                                <option>Category2</option>
                                                                <option>Category3</option>
                                                                <option>Category4</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                            <button class="btn btn-dark">Cancel</button>
                                    </div>
                                </div>

                            </div>    



                            <!-- content-wrapper ends -->
                            <!-- partial:../../partials/_footer.html -->
                            <footer class="footer">

                            </footer>
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
                <script src="../../adminAssets/vendors/select2/select2.min.js"></script>
                <script src="../../adminAssets/vendors/typeahead.js/typeahead.bundle.min.js"></script>
                <!-- End plugin js for this page -->
                <!-- inject:js -->
                <script src="../../adminAssets/js/off-canvas.js"></script>
                <script src="../../adminAssets/js/hoverable-collapse.js"></script>
                <script src="../../adminAssets/js/misc.js"></script>
                <script src="../../adminAssets/js/settings.js"></script>
                <script src="../../adminAssets/js/todolist.js"></script>
                <!-- endinject -->
                <!-- Custom js for this page -->
                <script src="../../adminAssets/js/file-upload.js"></script>
                <script src="../../adminAssets/js/typeahead.js"></script>
                <script src="../../adminAssets/js/select2.js"></script>
                <!-- End custom js for this page -->
                </body>

                </html>