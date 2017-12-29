class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before every single page, run this
  before_action :current_cart
  # give access to views
  helper_method :current_cart

  def current_cart
    # if customer has landed on site, give them a brand new cart
    # if they already have one, keep it
    # check session[:cart_id]
    if session[:card_id].present?
      # they already have a cart
      @current_cart = Cart.find(session[:card_id])
    else
      # they don't have a cart
      @current_cart = Cart.create
      session[:card_id] = @current_cart.id
    end
  end

end
