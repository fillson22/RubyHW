# README

Hi!
Guide to action: 
  1. git clone https://github.com/fillson22/RubyHW.git
  2. cd /RubyHW/HW8/blog_v1 
  3. bundle install
  4. change config/database'_copy'.yml on your username and password
  5. rails db:create
  6. rails db:migrate
  7. rails db:seed (automatic add articles, authors, comments, tags)
  8. rails s

  Let`s start to work!

0. Folder HW8 create.

1. Search by articles through ILIKE:
    GET http://127.0.0.1:3000/api/v1/articles?search=somebodytext

2. Filter list of articles by status, tags and author:
    GET http://127.0.0.1:3000/api/v1/articles?status=unpublished
    GET http://127.0.0.1:3000/api/v1/articles?tag=loko
    GET http://127.0.0.1:3000/api/v1/articles?author=author.name

3. Sort list of article by asc or desc:
    GET http://127.0.0.1:3000/api/v1/articles?order=desc

4. gem Pagy.
    @pagy, @article = pagy(Article.all.order(created_at: :desc), items: 15)

5. gem active_model_serializer. Was done. Look in code

&copy; @iFilippov