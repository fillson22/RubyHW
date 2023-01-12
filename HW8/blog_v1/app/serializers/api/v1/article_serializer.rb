class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :author
  has_many :comments
  has_many :tags
  belongs_to :author

  class CommentSerializer < ActiveModel::Serializer
    attributes :id
  end
  class TagSerializer < ActiveModel::Serializer
    attributes :id, :title
  end
end
