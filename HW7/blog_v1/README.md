# README

Hi!
Guide to action: 
  1. git clone https://github.com/fillson22/RubyHW.git
  2. cd /RubyHW/HW7/blog_v1 
  3. bundle install
  4. change config/database'_copy'.yml on your username and password
  5. rails db:create
  6. rails db:migrate
  7. rails db:seed
  8. rails s

  Let`s start to work!

List all articles (method GET):
GET http://127.0.0.1:3000/api/v1/articles
=================
Show article with :id, tags, last 10 comments, likes:
GET http://127.0.0.1:3000/api/v1/articles/:id
=================
Create new article with choose tags:
POST http://127.0.0.1:3000/api/v1/articles
{
    "article": 
     {
       "title": "Name title",
       "body": "text for title",
       "tag_ids": [5,6,7]
    }
}
=================
List all tags:
GET http://127.0.0.1:3000/api/v1/tags
=================
Show tag with her articles:
GET http://127.0.0.1:3000/api/v1/tags/:id
=================
Create new tag
POST http://127.0.0.1:3000/api/v1/tags?tag[title]=new_tag
=================
Update the article:
PATCH http://127.0.0.1:3000/api/v1/articles/:id?article[title]=change_in_title&article[body]=change_in_body
=================
Delete the article:
DELETE http://127.0.0.1:3000/api/v1/articles/:id
=================
List all comments for article:
GET http://127.0.0.1:3000/api/v1/articles/:id/comments
=================
List published or unpublished comments for article:
GET http://127.0.0.1:3000/api/v1/articles/:id/comments?status=unpublished
GET http://127.0.0.1:3000/api/v1/articles/:id/comments?status=published
=================
Show comment with :id and likes for him:
GET http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:id
=================
Delete the comment:
DELETE http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:id
=================
Like the article :
POST http://127.0.0.1:3000/api/v1/articles/3/likes?like[likeable_type]=Article&like[likeable_id]=3&like[author_id]=10]
=================
Unlike the article:
DELETE http://127.0.0.1:3000/api/v1/articles/:article_id/likes/:id
=================
Like the article:
POST http://127.0.0.1:3000/api/v1/articles/:article_id/likes?like[likeable_type]=Article&like[likeable_id]=3&like[author_id]=10]
=================
Like the comment:
POST http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:comments_id/likes?like[likeable_type]=Comment&like[likeable_id]=1&like[author_id]=10]
=================
Unlike the comment:
DELETE http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:comments_id/likes/:id
=================

&copy; @filippov&@

=================