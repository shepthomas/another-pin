class Cart < ApplicationRecord
  has_many :order_items

  def total_quantity
    @count = 0
    # calculate quantity
    order_items.all.each do |item|
      @count = @count + item.quantity
    end
    # return count
    @count
  end

  def total_price
    @total = 0
    # calculate cost
    order_items.all.each do |item|
      @total = @total + item.product.price * item.quantity
    end
    @total
  end

  def total_price_in_dollars
    total_price / 100
  end

end
