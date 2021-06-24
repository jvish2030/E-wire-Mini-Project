<%-- 
    Document   : contact
    Created on : May 5, 2021, 1:33:18 PM
    Author     : jatin
--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="include/header.jsp"/>
<c:set var="total" scope="session" value="${total}"/>  

<c:if  test="${CustDetails ne null}">  
    <c:set var="fname" scope="page" value="${CustDetails.fname}"/>
    <c:set var="lname" scope="page" value="${CustDetails.lname}"/>
    <c:set var="email" scope="page" value="${CustDetails.email}"/>
    <c:set var="address1" scope="page" value="${CustDetails.address1}"/>
    <c:set var="address2" scope="page" value="${CustDetails.address2}"/>
    <c:set var="country" scope="page" value="${CustDetails.country}"/>
    <c:set var="state" scope="page" value="${CustDetails.state}"/>
    <c:set var="city" scope="page" value="${CustDetails.city}"/>
    <c:set var="pin" scope="page" value="${CustDetails.pin}"/>
    <c:set var="mobile" scope="page" value="${CustDetails.mobile}"/>
    <c:set var="addType" scope="page" value="${CustDetails.addType}"/>
</c:if>  

<div class="container">
    <!--    <div class="py-1 text-center">
            <h2>Checkout form</h2>
            <p class="lead">Below is an example form built entirely with Bootstrap?s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
        </div>-->
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
                <span class="badge badge-secondary badge-pill"><%= request.getParameter("cartTotal")%></span>
            </h4>
            <div class="card card-blue p-3 text-white mb-3"> <span>You have to pay</span>
                <div class="d-flex flex-row align-items-end mb-3">
                    <h1 class="mb-0 yellow"><c:out value="${total}"/></h1> <span>.00</span>
                </div> <span> At Razorpay, we are devoted to making sure you have the best payments infrastructure in place.</span> <a href="https://razorpay.com/" class="yellow decoration">Know all the features</a>
                <div class="hightlight"> <span>All of Razorpay?s products are secured by an industry-standard 100% PCI DSS compliant and certified solution.</span> </div>
            </div>
            <form class="card p-2">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Promo code">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Redeem</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" method="post" action="Operation" >
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="fname">First name</label>
                        <input type="text" class="form-control" id="fname" name="fname" value="<c:out value="${fname}"/>" placeholder="" required="">
                        <div class="invalid-feedback"> Valid first name is required. </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <input type="text" class="form-control" id="lname" name="lname" value="<c:out value="${lname}"/>" placeholder="" required="">
                        <div class="invalid-feedback"> Valid last name is required. </div>
                    </div>
                </div>
                <input type="hidden" name="operation" value="saveinfo"/>
                <div class="mb-3">
                    <label for="email">Email</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="email" class="form-control" id="email" name="email" value="<c:out value="${email}"/>" placeholder="you@example.com" required="">
                        <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="address1">Address</label>
                    <input type="text" class="form-control" id="address1" name="address1" value="<c:out value="${address1}"/>" placeholder="1234 Main St" required="">
                    <div class="invalid-feedback"> Please enter your shipping address. </div>
                </div>
                <div class="mb-3">
                    <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                    <input type="text" class="form-control" id="address2" name="address2" value="<c:out value="${address2}"/>" placeholder="Apartment or suite">
                </div>
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="country">Country</label>
                        <select class="custom-select d-block w-100" id="country" name="country"  required="">
                            <option value="">Choose...</option>
                            <option selected >India</option>
                        </select>
                        <div class="invalid-feedback"> Please select a valid country. </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="state">State</label>
                        <select class="custom-select d-block w-100" id="state" name="state" required="">
                            <option value="">Choose State Name</option>
                            <option value="Andhra Pradesh">Andhra Pradesh</option>   
                            <option value="Assam">Assam</option>   
                            <option value="Bihar">Bihar</option>   
                            <option value="Goa">Goa</option>   
                            <option value="Gujarat">Gujarat</option>   
                            <option value="Haryana">Haryana</option>   
                            <option value="Himachal Pradesh">Himachal Pradesh</option>   
                            <option value="Jammu and Kashmir">Jammu and Kashmir</option>   
                            <option value="Jharkhand">Jharkhand</option>   
                            <option value="Karnataka">Karnataka</option>   
                            <option value="Kerala">KeralaKerala</option>   
                            <option value="Madhya Pradesh">Madhya Pradesh</option>   
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>   
                        </select>
                        <div class="invalid-feedback"> Please provide a valid state. </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" name="city" value="<c:out value="${city}"/>" placeholder="" required="">
                        <div class="invalid-feedback">Please provide a valid city. </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="mobile">10-digit Mobile Number</label>
                        <input type="text" class="form-control" id="mobile" name="mobile" value="<c:out value="${mobile}"/>" placeholder="" required="">
                        <div class="invalid-feedback"> 10-digit Mobile Number required. </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="pin">Pin</label>
                        <input type="text" class="form-control" id="pin" name="pin" value="<c:out value="${pin}"/>" placeholder="" required="">
                        <div class="invalid-feedback"> Zip code required. </div>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="form-check mb-3">
                    <label class="form-check-label" for="home">
                        <input type="radio" checked="" class="form-check-input" name="addtype" value="home" id="home">Home(All day)
                    </label>
                </div>
                <div class="form-check">
                    <label class="form-check-label" for="work">
                        <input type="radio" class="form-check-input" value="work" name="addtype" id="work">Work(Between 10am to 5pm)
                    </label>
                </div>
                <hr class="mb-4">

                <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
            </form>
        </div>
    </div>
    <footer class="my-5 pt-5 text-muted text-center text-small">

    </footer>
</div>
<jsp:include page="include/footer.jsp"/>