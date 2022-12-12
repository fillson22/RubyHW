class Article < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true 
  validates :body, length: { in: 5..50 }

  enum status: { unpublished: 0, published: 1 }

  scope :with_status, ->(status_type) { where(status: status_type) }
  scope :with_author, ->(author_name) { where(author_id: author_name) }
  scope :with_tag, ->(tag_name) { where(tag_id: tag_name) }

end