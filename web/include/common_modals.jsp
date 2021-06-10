
<div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title" id="exampleModalLabel">
                    Your Shopping Cart
                </h5>
               
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="cart-body">

                </div>
                <div class="d-flex justify-content-end cart-total">

                </div>
            </div>
            <div class="modal-footer border-top-0 d-flex justify-content-between">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success checkout-btn"  onclick="goToCheckout()">Checkout</button>
            </div>
        </div>
    </div>
</div>



<div class=" toast " id="toast">
    <div class="toast-header">
        message
    </div>
    <div class="toast-body">
        Some text inside the toast body
    </div>
</div>
