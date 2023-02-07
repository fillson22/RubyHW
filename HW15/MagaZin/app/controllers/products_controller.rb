# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
    # SaleWorker.perform_async
  end

  def show
    @product = Product.find(params[:id])
  end
end
