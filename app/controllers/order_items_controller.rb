class OrderItemsController < ApplicationController

   def create
     # find the product
     @product = Product.find(params[:product_id])

     # quantity - comes from the form data
     @quantity = form_params[:quantity]

     # add this to the cart
     @current_cart.order_items.create(product: @product, quantity: @quantity)

     # create flash message
     flash[:success] = "Thanks for adding " + @product.title + " to your cart"

     #redirect back from create uri to product page
     redirect_to product_path(@product)
   end

   def update
     @product = Product.find(params[:product_id])
     @order_item = OrderItem.find(params[:id])
     @order_item.update(form_params)

     flash[:success] = "Thanks for updating your cart"

     # redirect_to product_path(@product)
     redirect_to cart_path
   end

   def destroy
     @product = Product.find(params[:product_id])
     @order_item = OrderItem.find(params[:id])
     @order_item.delete

     flash[:success] = "Product removed from cart"

     redirect_to cart_path
   end

   def form_params
     params.require(:order_item).permit(:quantity)
   end


end
