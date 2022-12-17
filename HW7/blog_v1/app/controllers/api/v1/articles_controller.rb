class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def create # POST /api/v1/articles
    @article = Article.create(article_params)
    if @article.save
      render json: { status: 'Create new article', data: @article }, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update # PATCH /api/v1/articles/:id
    if @article.update(article_params)
      render json: { status: 'Update', data: @article }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy # DELETE /api/v1/articles/:id
    if @article.destroy
      render json: { status: 'Delete' }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def index # GET /api/v1/articles
    @article = Article.all
    if @article
      render json: { data: @article }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def show # GET /api/v1/articles/:id
    if @article
      render json: { article: @article,
                     tag: @article.tags,
                     comment: @article.comments.recently_created.limit(10),
                     like: @article.likes }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, tag_ids: [])
  end
end
