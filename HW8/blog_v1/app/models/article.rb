class Article < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :comments, dependent: :destroy
  belongs_to :author

  validates :title, :body, presence: true
  validates :body, length: { in: 5..50 }

  enum status: { unpublished: 0, published: 1 }

  scope :with_status, ->(status_type) { where(status: status_type) }
  scope :with_author, ->(author_name) { joins(:author).where('name ILIKE ?', "%#{author_name}%") }
  scope :articles_search, ->(some_text) { where('title || body ILIKE ?', "%#{some_text}%") }
  scope :with_tags, -> (some_tags) { joins(:tags).where('tags.title IN (?)', some_tags) }

end
