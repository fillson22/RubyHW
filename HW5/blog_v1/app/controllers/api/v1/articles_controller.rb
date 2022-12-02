class Api::V1::ArticlesController < ApplicationController
  before_action :set_article

  def create
    @article = Article.new(article_params)
    if @article.save 
      render json: { status: "Create", data: @article }
    else
      render json: @article.errors
    end
  end

  def update
    if @article.update(article_params)
      render json: { status: "Update", data: @article }
    else
      render json: @article.errors
    end
  end

  def destroy 
    if @article.destroy
      render json: { status: "Delete" }
    else
      render json: @article.errors
    end
  end

  def index 
    @articles = Article.all
    if @articles 
      render json: @articles
    else
      render json: @articles.errors
    end
  end

  def show 
    if @article 
      render json: @article
    else
      render json: { message: "Not found" }
    end
  end
     
  private

  def set_article
    @article = Article.find_by_id(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
