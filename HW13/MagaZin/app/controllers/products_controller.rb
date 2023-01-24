# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_image
  end

  def show
    @product = Product.with_attached_image.find(params[:id])
  end
end
