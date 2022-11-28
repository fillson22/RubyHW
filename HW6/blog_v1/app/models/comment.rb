class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article

  validates :author, :article, presence: true
  validates :body, length: { in: 5..50 }

  enum :status, [ :unpublished, :published ], scopes: false

end
