
var totalprice = 0;
var count = 0;
var userid = 0;
function validateUser()
{
    var fullname = document.forms["myUserRegisterForm"]["fullname"].value;
    var email = document.forms["myUserRegisterForm"]["email"].value;
    var password = document.forms["myUserRegisterForm"]["password"].value;
    var conpassword = document.forms["myUserRegisterForm"]["conpassword"].value;
    if (fullname === null || fullname === "")
    {
        window.alert("Full Name can't be blank");
        return false;
    } else if (email === null || email === "")
    {
        window.alert("Email can't be blank");
        return false;
    } else if (password.length < 6)
    {
        window.alert("Password must be at least 6 characters long.");
        return false;
    } else if (password !== conpassword)
    {
        window.alert("Confirm Password should match with the Password");
        return false;
    }
}
function checkLogin(uid) {
// check for user login or not
    if (!uid) {
        $(".overlay-login-page").fadeIn(200);
        return false;
    } else {
        window.location.assign("view?page=cart");
        return true;
    }
}
function addToCartCheck(uid, pid, pname, price, pqty = 1) {
    if (!uid) {
        $(".overlay-login-page").fadeIn(200);
        return false;
    } else {
        userid = uid;
        add_to_cart(uid, pid, pname, price, pqty);
        return true;
}
}
function add_to_cart(uid, pid, pname, price, pqty = 1)
{
    let localStorageName = uid;
    let cart = localStorage.getItem(localStorageName);
    if (cart === null)
    {
        //no cart yet  
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: pqty, productPrice: price};
        products.push(product);
        localStorage.setItem(localStorageName, JSON.stringify(products));
//        console.log("Product is added for the first time")
        showToast("Item is added to cart");
    } else
    {
        //cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId === pid);
        console.log(oldProduct);
        if (oldProduct)
        {
            showToast("Product already added to cart");
        } else
        {
            //we have add the product
            let product = {productId: pid, productName: pname, productQuantity: pqty, productPrice: price};
            pcart.push(product);
            localStorage.setItem(localStorageName, JSON.stringify(pcart));
            console.log("Product is added");
            showToast("Product is added to cart");
        }
    }
//    $('#cartModal').modal('show');
    updateCart(uid);
}
//update cart:
function updateCart(localStorageName)
{
    let cartString = localStorage.getItem(localStorageName);
    let cart = JSON.parse(cartString);
    if (cart === null || cart.length === 0)
    {
        console.log("Cart is empty !!");
        $(".cart-items").html("");
        $(".cart-body").html(`<div class="jumbotron">
    <h1 style="color:#CD5C5C;text-align:center;">Cart does not have any items</h1>      
   </div>`);
        $("#product_total_amt").html('00.0');
        $("#shipping_charge").html('00.0');

        $("#total_cart_amt").html('00.0');
        $(".checkout-btn").attr('disabled', true);
    } else
    {
        //there is some in cart to show
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = ``;
        totalPrice = 0;
        cart.map((item) => {
            table += `
                             <div class="card p-4">
                           
                                <div class="row">
                                    <!-- cart images div -->
                                    <div class="col-md-5 col-11 mx-auto bg-light d-flex justify-content-center align-items-center shadow product_img">
                                        <img src="images/products/${item.productId}.jpg" class="img-fluid" alt="cart img">
                                    </div>
                                    <!-- cart product details -->
                                    <div class="col-md-7 col-11 mx-auto px-4 mt-2">
                                        <div class="row">
                                            <!-- product name  -->
                                            <div class="col-9  card-title">
                                                <h1 class="mb-4 product_name">${item.productName}</h1>
                                                <p class="mb-2">delivery charges applied.</p>
                                                <p class="mb-2">Terms & coditions.</p>
                                                <p class="mb-3">company assured.</p>
                                            </div>
                                            <!-- quantity inc dec -->
                                            <div class="col-3 ">
                                                 <input type="number" style="width:60px;"  class="pass-quantity form-control" name="quantity" onChange="qtyChange('` + localStorageName + `',${item.productId}, this.value);" placeholder="${item.productQuantity}" min="1"/>    
                                                                                            
                                            </div>
                                        </div>
                                        <!-- //remover move and price -->
                                     
                                            <div class=" d-flex justify-content-between remove_wish">
                                                <p onclick="deleteItemFromCart('` + localStorageName + `',${item.productId})" style="color:red;"> REMOVE ITEM</p>
                                                <p><i class="fas fa-heart"></i>MOVE TO WISH LIST </p>
                                            </div>
                                           <div class=" d-flex justify-content-between price_money">
                                               <p> <h5>price:<span id="itemval"> &#8377;  ${item.productPrice}</span></h5></p>
                                               <p> <h5> total: <span id="${item.productId}"> &#8377; ${item.productPrice * item.productQuantity}</span></h5></p>
                                           </div>
                              
                                    </div>
                                </div>
                            </div>
                            <hr/>
                 `;
            count++;
            totalPrice += item.productPrice * item.productQuantity;
        });
        $(".cart-body").html(table);
        $("#product_total_amt").html(totalPrice);
        $("#shipping_charge").html('50.0');
        $("#total_cart_amt").html(totalPrice + 50);
        $(".checkout-btn").attr('disabled', false);
        console.log("removed");
    }
}
//delete item 
function deleteItemFromCart(localStorageName, pid)
{
    let cart = JSON.parse(localStorage.getItem(localStorageName));
    let newcart = cart.filter((item) => item.productId !== pid);
    localStorage.setItem(localStorageName, JSON.stringify(newcart));
    count--;
    updateCart(localStorageName);
    $('#toast2').toast('show');
}
function showToast(content) {
    $(".toast-body").html(content);
    $("#toast").toast({delay: 2000});
    $('#toast').toast('show');
}
function goToCheckout() {
    window.location = "checkout.jsp";
}
function qtyChange(localStorageName, pid, qty) {
    let cartString = localStorage.getItem(localStorageName);
    let cart = JSON.parse(cartString);
    let oldProduct = cart.find((item) => item.productId === pid);
    //we have to increase the quantity
    oldProduct.productQuantity = qty;
    cart.map((item) => {
        if (item.productId === oldProduct.productId)
        {
            item.productQuantity = oldProduct.productQuantity;
        }
    });
    localStorage.setItem(localStorageName, JSON.stringify(cart));

    //    showToast("Product quantity is increased , Quantity = " + oldProduct.productQuantity);
    cartString = localStorage.getItem(localStorageName);
    cart = JSON.parse(cartString);
    cart.map((item) => {
        let id = '#' + item.productId + '';
        $(id).html('&#8377;' + item.productQuantity * item.productPrice);
        totalPrice += item.productPrice * item.productQuantity;
    });
    $("#product_total_amt").html(totalPrice);
    $("#total_cart_amt").html(totalPrice + 50);
}
function order() {
    let confirmPrice = totalPrice + 50;
    let cart = count;
    window.location.assign("view?page=order&cart=" + cart + "&price=" + confirmPrice);
    return true;
}

//first request to server to create order
const paymentStart = (userid) => {

    let amount = $("#payment_field").html();
    console.log("uid" + userid);
    let cart = JSON.parse(localStorage.getItem(userid));
    console.log("cart" + cart);
    //amount validation
    if (amount === "" || amount === null) {
        swal("Failed !!", "amount is required !!", "error");
    }

    //we will use ajax to send request to server to create order
    $.ajax({
        //calling payment servlet
//        JSON.stringify({amount: amount, info: 'order_request'})
        data: {amounts: amount, jsonData: JSON.stringify(cart)},
        url: 'Payment', //data to be passed
        type: 'POST', // post request 
        dataType: 'json',
        success: function (data) {
            if (data.status === 'created') {
                //open payment form\
                let options = {
                    key: "rzp_test_JcWu5d1ITT2h0i",
                    amount: data.amount,
                    currency: "INR",
                    name: "Hari Om E-wire",
                    description: "good quality wire",
                    image: "data:image/png;base64,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",
                    order_id: data.id,
                    "handler": function (response) {
                        console.log(response.razorpay_payment_id);
                        console.log(response.razorpay_order_id);
                        console.log(response.razorpay_signature);
                        console.log("payment successful");
                        updatePaymentOnServer(response.razorpay_payment_id, response.razorpay_order_id, 'Paid');
                    },
                    "prefill": {"name": "", "email": "", "contact": ""},
                    "notes": {"address": "Hari Om Electricals"},
                    "theme": {"color": "#492BC4"}
                };
                var rzp = new Razorpay(options);

                rzp.on('payment.failed', function (response) {
                    console.log(response.error.code);
                    console.log(response.error.description);
                    console.log(response.error.source);
                    console.log(response.error.step);
                    console.log(response.error.reason);
                    console.log(response.error.metadata.order_id);
                    console.log(response.error.metadata.payment_id);
                    swal("Failed !!", "Oops payment failed !!", "error");
                });
                rzp.open();
            }
        },
        error: function (data) {
            alert("error: " + data);
        }
    });
};
const updatePaymentOnServer = (payment_id, order_id, status) => {
    $.ajax({
        data: {payment_id: payment_id, order_id: order_id, status: status},
        url: 'UpdateOrderServlet', //data to be passed
        type: 'POST', // post request 
        dataType: 'json',
        success: function (data) {
            swal("Good job!", "congrats !! Payment successful !!", "success");
        },
        error: function (err) {
            swal("Failed !!", "Your payment is successful, but we did not get on server, we will contac6t you as soon as possible", "error");
        }
    });
};