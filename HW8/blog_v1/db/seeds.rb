10.times do
  Author.create(name: Faker::Name.name)
  Tag.create title: Faker::Hipster.word
end

author = Author.all
10.times do
  Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: author.sample.id)
end