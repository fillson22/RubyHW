class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]

  def show; end 

  def index
    @orders = current_user.orders if current_user
  end

  def create
    @order = current_user.orders.create(cart: current_cart)
    redirect_to order_path(@order), notice: 'Order was successfully created'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id]) if current_user
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'order id not found' }, status: :not_found
  end
end
