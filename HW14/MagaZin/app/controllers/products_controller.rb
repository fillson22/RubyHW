# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    SaleWorker.perform_async # in(Date.today.end_of_month.to_s)
  end

  def show
    @product = Product.find(params[:id])
  end
end
