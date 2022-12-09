class Author < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :comments 

  validates :name, presence: true
  validates :name, uniqueness: true
end
