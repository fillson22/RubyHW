class Author < ApplicationRecord
  has_many :comments 
  validates_associated :comments

  validates :name, presence: true, uniqueness: true
end
