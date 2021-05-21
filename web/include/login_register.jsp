<div class="overlay-login-page overlay-login text-left">
    <button type="button" class="login-close overlay-close1">
        <i class="fa fa-times" aria-hidden="true"></i>
    </button>
    <div class="wrap">
        <h5 class="text-center mb-4">Login Now</h5>
        <div class="login-bghny p-md-5 p-4 mx-auto mw-100">
            <!--/login-form-->
            <form name="myUserLoginForm" action="Login" method="post" >
                <div class="form-group">
                    <p class="login-texthny mb-2">Email address</p>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                           aria-describedby="emailHelp" placeholder="" required>
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email
                        with anyone else.</small>
                </div>
                <div class="form-group">
                    <p class="login-texthny mb-2">Password</p>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                           placeholder="" required>
                </div>
                <div class="form-check mb-2">
                    <div class="userhny-check">
                        <label class="check-remember container">
                            <input type="checkbox" class="form-check"> <span
                                class="checkmark"></span>
                            <p class="privacy-policy">Remember me</p>
                        </label>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <button type="submit" class="submit-login btn mb-4">Sign In</button>


                <p class="page-reg text-center dont-do mt-3">Don't have an account?
                    <a href="#" class="text-warning">Register now</a>
                </p>
            </form>
            <!--//login-form-->
        </div> 
        <!---->
    </div>
</div>





<div class="overlay-register-page overlay-login  text-left">
    <button type="button" class="register-close overlay-close1">
        <i class="fa fa-times" aria-hidden="true"></i>
    </button>
    <div class="wrap">
        <h5 class="text-center mb-4">Register</h5>
        <div class="login-bghny p-md-5 p-4 mx-auto mw-100">

            <form name="myUserRegisterForm" action="Register" onsubmit="return validateUser()" method="post" >
                <div class="form-group">
                    <p class="login-texthny mb-2">Your Name</p>
                    <input type="text" name="Rfullname" class="form-control" id="exampleInputEmail1"
                           aria-describedby="emailHelp" placeholder="" required>

                </div>
                <div class="form-group">
                    <p class="login-texthny mb-2">Email</p>
                    <input type="email" name="Remail" class="form-control" id="exampleInputEmail1"
                           aria-describedby="emailHelp" placeholder="" required>
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email
                        with anyone else.</small>
                </div>
                <div class="form-group">
                    <p class="login-texthny mb-2">Password</p>
                    <input type="password" name="Rpassword" class="form-control" id="exampleInputPassword1"
                           placeholder="" required>
                </div>
                <div class="form-group">
                    <p class="login-texthny mb-2">Confirm Password</p>
                    <input type="password" name="Rconpassword" class="form-control" id="exampleInputPassword1"
                           placeholder="" required>
                </div>
                <div class="form-check mb-2">
                    <div class="userhny-check">
                        <label class="check-remember container">
                            <input type="checkbox" class="form-check"> <span
                                class="checkmark"></span>
                            <p class="privacy-policy">show password</p>
                        </label>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <button type="submit" class="submit-login btn mb-4">Register</button>

            </form>

        </div>

    </div>
</div>	  
<!--//login- Register-->