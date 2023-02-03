# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    #SaleWorker.perform_async
  end

  def show
    @product = Product.find(params[:id])
  end
end
