# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord

  has_many :line_items, dependent: :nullify
  has_one :order
  
  def add_product(product)
    line_items.create(product: product, quantity: 1, price: product.price)
  end

  def total_price
    sum = 0
    line_items.each do |line_item|
      sum += line_item.price * line_item.quantity
    end
    sum
  end

end
