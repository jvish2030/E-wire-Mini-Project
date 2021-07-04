<%-- 
    Document   : contact
    Created on : May 5, 2021, 1:33:18 PM
    Author     : jatin
--%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="include/header.jsp"/>
<div class="container">
    <!--    <div class="py-1 text-center">
            <h2>Checkout form</h2>
            <p class="lead">Below is an example form built entirely with Bootstrap?s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
        </div>-->
    <div class="row">
        <div class="offset-md-3 col-md-6 mb-4 justify-content-between">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your cart</span>
                <span class="badge badge-secondary badge-pill"><c:out value="${cart}"/></span>
            </h4>
            <div class="card card-blue p-3 text-white mb-3"> <span>You have to pay</span>
                <div class="d-flex flex-row align-items-end mb-3">
                    <h1 class="mb-0 yellow" id="payment_field"><c:out value="${price}"/></h1> <span>.00</span>
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
                <button class="btn btn-primary btn-lg btn-block"  onclick="paymentStart()" type="submit">Continue to checkout</button>
        </div>
    </div>
    <footer class="my-5 pt-5 text-muted text-center text-small">
    </footer>
</div>
<jsp:include page="include/footer.jsp"/>