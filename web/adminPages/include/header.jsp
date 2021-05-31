<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>E-WIRE Admin</title>
    <!-- plugins:css -->
    <style>

        .tablink {
            border: none;
            outline: none;
            cursor: pointer;
        }
        .tablink:hover {
            background-color: #0079C2;
            opacity: 0.8;
        }
        #products-green:hover{
            background-color: #32CD32;
            opacity: 0.8;
        }
        #products-red:hover{
             background-color: #DC143C;
            opacity: 0.8;
        }
        .tabcontent {
            color: white;
            display: none;
            padding: 30px;
            text-align: center;
        }
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        #Customers {background-color:#0079C2;}
        #CustomersNav{background-color:#0079C2;}
        #Products {background-color:#32CD32;}
        
        #Categories {background-color:#DC143C;}
        #Orders {background-color:#48D1CC;}

        .button2 {background-color: #008CBA;} /* Blue */
        .button3 {background-color: #f44336;} /* Red */ 
        .button4 {background-color: #e7e7e7; color: black;} /* Gray */ 
        .button5 {background-color: #555555;} /* Black */
    </style>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
</head>


<body>
    <div class="container-scroller">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <!-- <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
                <a class="sidebar-brand brand-logo" href="index.html"><img src="adminAssets/images/logo.svg" alt="logo" /></a>
                <a class="sidebar-brand brand-logo-mini" href="index.html"><img src="adminAssets/images/logo-mini.svg" alt="logo" /></a>
              </div> -->
            <ul class="nav py-1">
                <li class="nav-item menu-title pl-2">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </li>
                <li class="nav-item profile">
                    <div class="profile-desc">
                        <div class="profile-pic">
                            <div class="count-indicator">
                                <img class="img-xs rounded-circle " src="adminAssets/images/faces/face15.jpg" alt="">
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
                    <a class="nav-link" href="../main/adminPage.jsp">
                        <span class="menu-icon">
                            <i class="mdi mdi-speedometer"></i>
                        </span>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                               <li class="nav-item menu-items">
                    <a class="nav-link" href="../forms/form1.jsp">
                        <span class="menu-icon">
                            <i class="mdi mdi-playlist-play"></i>
                        </span>
                        <span class="menu-title">Form</span>
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
                            <li class="nav-item"> <a class="nav-link" href="adminPages/samples/blank-page.html"> Blank Page </a></li>
                            <li class="nav-item"> <a class="nav-link" href="adminPages/samples/error-404.html"> 404 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="adminPages/samples/error-500.html"> 500 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="adminPages/samples/login.html"> Login </a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Operation?operation=logout">LogOut</a></li>
                        </ul>
                    </div>
                </li>
            
            </ul>
        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_navbar.html -->

            <!--                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                                <span class="mdi mdi-menu"></span>
                            </button>-->


            <!--            <nav class="navbar p-0 fixed-top d-flex flex-row">
                            <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
                                <a class="navbar-brand brand-logo-mini" href="index.html"><img src="adminAssets/images/logo-mini.svg"
                                                                                               alt="logo" /></a>
                            </div>
                            <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
                                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                                    <span class="mdi mdi-menu"></span>
                                </button>
            
                                <ul class="navbar-nav navbar-nav-right">
            
                                    <li>
                                        <div id="Customers" class="tabcontent">
                                            <h1><span class="menu-icon"><i class="mdi mdi-account"></i>Customers</span></h1>
                                        </div>
                                    </li>
            
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                                            <div class="navbar-profile">
                                                <img class="img-xs rounded-circle" src="adminAssets/images/faces/face15.jpg" alt="">
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
                        </nav>-->