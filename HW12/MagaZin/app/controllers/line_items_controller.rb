# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy update]

  def create
    product = Product.find(params[:product_id])
    if current_cart.line_items.find_by(product_id: product.id)
      item = current_cart.line_items.find_by(product_id: product.id)
      item.update(quantity: item.quantity += 1)
    else
      current_cart.add_product(product)
    end

    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end

  def update
    params[:act] == 'increase' ? @line_item.update(quantity: @line_item.quantity + 1) : @line_item.update(quantity: @line_item.quantity - 1)
    @line_item.destroy if @line_item.quantity < 1
    redirect_to cart_path
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'line_item id not found' }, status: :not_found
  end
end
