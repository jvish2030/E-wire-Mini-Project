
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

    if (!uid) {
        $(".overlay-login-page").fadeIn(200);
        return false;
    } else {
        $('#cartModal').modal('toggle');
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
        $(".cart-body").html("<h4>Cart does not have any items </h4>");
        $(".cart-total").html(`<h5>Total: <span class="price text-success">0</span></h5>`);
        $(".checkout-btn").attr('disabled', true);
    } else
    {
        //there is some in cart to show
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
           <table class="table table-image">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Product</th>
                            <th scope="col">Price</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Total</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
            `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                    <tr>
                        <td class="w-25">
                           <img src="images/products/${item.productId}.jpg" alt="e-wire">
                        </td>
                        <td> ${item.productName} </td>
                        <td> &#8377;${item.productPrice} </td>
                        <td><input type="number" style="width:90px;"  class="pass-quantity form-control" name="quantity" onChange="qtyChange('` + localStorageName + `',${item.productId},this.value);" placeholder="${item.productQuantity}" min="1"/> </td>
                        <td id="${item.productId}">&#8377; ${item.productQuantity * item.productPrice} </td>
                        <td>
                                <a href='#' onclick="deleteItemFromCart('` + localStorageName + `',${item.productId})" class="btn btn-danger btn-sm">
                                    <i class="fa fa-times"></i>
                                </a>
                        </td> 
                        </tr>
                 `;
            totalPrice += item.productPrice * item.productQuantity;
        });
        table = table + `</table>`;
        let totalRow = `<h5>Total: <span class="price text-success">&#8377;${totalPrice}.00</span></h5>`;
        $(".cart-body").html(table);
        $(".cart-total").html(totalRow);
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
    let totalPrice = 0;
    cart.map((item) => {
        let id = '#' + item.productId + '';
        $(id).html('&#8377;'+item.productQuantity * item.productPrice);
        totalPrice += item.productPrice * item.productQuantity;
    });

    let totalRow = `<h5>Total: <span class="price text-success">&#8377;${totalPrice}.00</span></h5>`;
    $(".cart-total").html(totalRow);
}

