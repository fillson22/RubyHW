10.times do
  Author.create(name: Faker::Name.name)
  Tag.create title: Faker::Hipster.word
end

tag = Tag.all
author = Author.all

10.times do
  Article.create(title: Faker::Game.title, body: Faker::Game.genre, author_id: author.sample.id, tag_ids: [tag.sample.id, tag.sample.id, tag.sample.id])
end

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