class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_many :comments
  has_many :articles

  class ArticleSerializer < ActiveModel::Serializer
    attributes :id
  end
  class CommentSerializer < ActiveModel::Serializer
    attributes :id
  end

end
