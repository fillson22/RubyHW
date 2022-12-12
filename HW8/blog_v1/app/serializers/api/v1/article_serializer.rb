class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :author

  has_many :comments

  def author
    author = Author.find_by(id: object.author_id)
    "#{author.name}"
  end
end
