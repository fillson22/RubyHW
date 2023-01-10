class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_many :comments
  has_many :articles
end
