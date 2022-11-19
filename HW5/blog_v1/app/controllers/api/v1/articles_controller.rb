class Api::V1::ArticlesController < ApplicationController

  def create #Создание статьи
    article = Article.new(article_params)

    if article.save #Проверяем успех операции и рендерим ответ в формате json
      render json: { status: "Create", data: article}, status: :ok
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def update #Обновление(изменение) данных в статье
    article = Article.find(params[:id]) #находим нужную статью по айдишнику

    if article.update!(article_params) #изменяем параметры и рендерим ответ
      render json: { status: "Update", data: article}, status: :ok
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy #Удаление статьи
    article = Article.find(params[:id]) #находим нужную статью по айдишнику

    if article.destroy! #удаляем статью и рендерим ответ
      render json: { status: "Delete"}, status: :ok
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def index #Выводим все существующие статьи
    articles = Article.all

    if articles #проверяем успех и рендерим ответ
      render json: { status: 'OK', data: articles}
    else
      render json: articles.errors, status: :bad_request
    end
  end

  def show #Находим и выводим нужную нам статью
    article = Article.find(params[:id]) #Находим по айдишнику статью
  
    if article #проверяем успех и рендерим ответ
      render json: {data: article}, state: :ok
    else
      render json: { message: "Not found" }, status: :bad_request
    end
  end
     
  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
