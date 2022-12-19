10.times do
  Author.create(name: Faker::Name.name)
  Tag.create title: Faker::Hipster.word
end

author = Author.all

article = Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: 1, tag_ids: [1, 3, 5])
article = Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: 2, tag_ids: [1, 5, 7])
article = Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: 3, tag_ids: [2, 4, 6])
article = Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: 4, tag_ids: [2, 6, 8])
article = Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: 5, tag_ids: [3, 8, 9])

5.times do
  Comment.create(body: Faker::Games::WorldOfWarcraft.quote, article_id: 1, author_id: author.sample.id)
end
5.times do
  Comment.create(body: Faker::Games::WorldOfWarcraft.quote, article_id: 2, author_id: author.sample.id)
end
5.times do
  Comment.create(body: Faker::Games::WorldOfWarcraft.quote, article_id: 3, author_id: author.sample.id)
end
5.times do
  Comment.create(body: Faker::Games::WorldOfWarcraft.quote, article_id: 4, author_id: author.sample.id)
end
5.times do
  Comment.create(body: Faker::Games::WorldOfWarcraft.quote, article_id: 5, author_id: author.sample.id)
end