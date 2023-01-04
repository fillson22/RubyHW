class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end

  def destroy
    set_line_item
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end

  def add_quantity
    set_line_item
    @line_item.quantity += 1
    @line_item.save
    redirect_back(fallback_location: current_cart)
  end

  def reduce_quantity
    set_line_item
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
      redirect_back(fallback_location: current_cart)
    elsif @line_item.quantity == 1
      destroy
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'line_item id not found' }, status: :not_found
  end

end
