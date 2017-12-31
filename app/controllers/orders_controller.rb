class OrdersController < ApplicationController

  def show
    # thanks page
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.add_from_cart(@current_cart)
  end

  def create
    @order = Order.new(form_params)
    @order.add_from_cart(@current_cart)

    if @order.save
      # if order passes validations, great!
      # reset session to clear cart
      reset_session
      # show a success message
      flash[:success] = "Order was successfull"
      # go to a thank you page
      redirect_to order_path(@order)
    else
      # if order doesn't pass, redirect back to new order page
      render "new"
    end
  end

  def form_params
    params.require(:order).permit(:first_name, :last_name, :email, :country, :address_1, :address_2, :city, :postal_code)
  end

end
