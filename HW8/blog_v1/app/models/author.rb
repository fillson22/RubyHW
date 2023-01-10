class Author < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
