class Cart < ApplicationRecord

  has_many :line_item, dependent: :nullify
  has_one :order
  
  def add_product(product)
    line_item.create(product: product, quantity: 1, price: product.price)
  end

  def total_price
    sum = 0
    line_item.each do |line_item|
      sum += line_item.price * line_item.quantity
    end
    sum
  end

end
