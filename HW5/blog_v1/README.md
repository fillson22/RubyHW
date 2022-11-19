# README

Привет! 
Эта мой первый проект API.
Руководство к действию:
  1. git clone https://github.com/fillson22/RubyHW.git
  2. cd /путь в папку проекта 
  3. bundle install
  4. rails db:migrate
  5. rails s
  6. Я использовал "Postman" для проверки работы (сервер дожен быть поднят)
  7. Пути для проверки работы экшенов:
      POST http://127.0.0.1:3000/api/v1/articles - создание статьи (method create)
      GET  http://127.0.0.1:3000/api/v1/articles - получение всех статей (method index)
      GET  http://127.0.0.1:3000/api/v1/articles/1 - получение нужной статьи (method show)
      PATCH http://127.0.0.1:3000/api/v1/articles/1 - изменение статьи (method update)
      DELETE http://127.0.0.1:3000/api/v1/articles/1 - удаление статьи (method destroy)