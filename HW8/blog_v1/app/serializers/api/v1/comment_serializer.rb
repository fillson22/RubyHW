class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status, :created_at
  
  belongs_to :article
end
