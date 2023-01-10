class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status, :created_at, :author
  belongs_to :author
  belongs_to :article
end
