class Article < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :body, length: { in: 5..50 }
end
