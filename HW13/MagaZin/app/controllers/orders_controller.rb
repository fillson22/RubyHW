# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show destroy paid]

  def show
    @view_order = @order.cart.line_items.includes(product: { image_attachment: :blob })
  end

  def index
    @orders = current_user.orders.order(created_at: :desc) if current_user
  end

  def create
    @order = current_user.orders.create(cart: current_cart)
    cookies.delete(:cart_id)
    redirect_to order_path(@order), notice: 'Order was successfully created'
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def paid
    @order.paid!
    user = current_user
    order = @order
    UserMailer.thanks_for_order(user, order).deliver_now
    redirect_to orders_path
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id]) if current_user
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'order id not found' }, status: :not_found
  end
end
