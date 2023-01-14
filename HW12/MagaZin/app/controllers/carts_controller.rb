class CartsController < ApplicationController
  def show
    @cart_items = current_cart.line_items.order(created_at: :desc)
  end
end
