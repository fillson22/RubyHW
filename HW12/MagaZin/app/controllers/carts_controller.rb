# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart_items = current_cart.line_items.includes([:product]).order(created_at: :desc)
  end
end
