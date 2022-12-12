class Comment < ApplicationRecord

  include OrderableByTimestamp

  belongs_to :author
  belongs_to :article
  
  has_many :likes, as: :likeable

  validates :author, :article, presence: true
  validates :body, length: { in: 5..50 }

  enum status: { unpublished: 0, published: 1 }

  scope :with_status, ->(status_type) { where(status: status_type) }
  scope :with_author, ->(author_name) { where(author_id: author_name) }
 
end
