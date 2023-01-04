# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify
end
