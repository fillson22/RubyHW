# frozen_string_literal: true

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
    line_items.create(product:, quantity: 1, price: product.price)
  end

  def total_price
    line_items.to_a.sum { | line_item | line_item.quantity * line_item.price }
  end

  def total_quantity
    line_items.to_a.sum(&:quantity)
  end
end
