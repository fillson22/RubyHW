# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order
  belongs_to :user

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
