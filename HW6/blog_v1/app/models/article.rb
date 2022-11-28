class Article < ApplicationRecord
  has_many :comments
  validates_associated :comments

  validates :title, :body, presence: true 
  validates :body, length: { in: 5..50 }
end
