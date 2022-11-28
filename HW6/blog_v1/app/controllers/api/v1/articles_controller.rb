class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]

  def create #POST /api/v1/articles
    @article = Article.new(article_params)
    if @article.save
      render json: { status: "Create new article", data: @article }
    else
      render json: @article.errors
    end
  end
  
  def update #PATCH /api/v1/articles/:id
    if @article.update(article_params) 
      render json: { status: "Update", data: @article }
    else
      render json: @article.errors
    end
  end

  def destroy #DELETE /api/v1/articles/:id
    if @article.destroy
      render json: { status: "Delete" }
    else
      render json: @article.errors
    end
  end

  def index #GET /api/v1/articles
    @articles = Article.all
    if @articles
      render json: @articles
    else
      render json: @articles.errors
    end
  end

  def show #GET /api/v1/articles/:id
    if @article
      render json: @article
    else
      render json: { message: "Not found" }
    end
  end
     
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end