require 'faker'

5.times do
  Author.create(name: Faker::Name.name)
  title = Faker::Hipster.word
  Tag.create title:
  Article.create(title: Faker::Movie.title, body: Faker::Quote.matz)
end
