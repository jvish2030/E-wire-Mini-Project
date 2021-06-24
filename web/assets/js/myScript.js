var totalprice = 0;
var count = 0;
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
function updateCart(uid)
{
    let localStorageName = uid;
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
    console.log("Product quantity is increased" + qty);
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
    window.location.assign("view?page=order&cartTotal=" + cart + "&total=" + confirmPrice);
    return true;
}
