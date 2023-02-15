# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart, :cart_products_quantity

  def current_cart
  #   Cart.find(cookies[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   if current_user
  #     @user_id = current_user.id
  #     cart = Cart.create(user_id: @user_id)
  #     cookies[:cart_id] = cart.id
  #     cart
  #   else
  #     redirect_to new_user_session_path
  #   end

    if current_user
      if cookies[:cart_id]
        cart = Cart.find(cookies[:cart_id])
        if cart.user_id == current_user.id
          cart
        else
          cart = Cart.create(user_id: current_user.id)
          cookies[:cart_id] = cart.id
          cart
        end
      else
        cart = Cart.create(user_id: current_user.id)
        cookies[:cart_id] = cart.id
        cart
      end
    else
      redirect_to new_user_session_path
    end
  end
end
