class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status, :created_at, :author
  
  belongs_to :article

  def author
    author = Author.find_by(id: object.author_id)
    "#{author.name}"
  end
end
