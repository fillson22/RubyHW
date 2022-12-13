class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]
  
  def index #GET /api/v1/articles
    @pagy, @article = pagy(Article.all.order(created_at: :desc), items: 15)

    # GET http://127.0.0.1:3000/api/v1/articles?status=unpublished
    from_status = params[:status]
    @article = @article.with_status(from_status) if from_status
    # GET http://127.0.0.1:3000/api/v1/articles?author=author.name
    author = Author.find_by(name: params[:author])
    @article = @article.with_author(author.id) if author
    # GET http://127.0.0.1:3000/api/v1/articles?search=somebodytext
    from_title_or_body = params[:search]
    @article = @article.where('title || body ILIKE ?', "%#{from_title_or_body}%") if from_title_or_body
    # GET http://127.0.0.1:3000/api/v1/articles?order=desc
    order = params[:order]
    @article = Article.all.order(title: order) if order
    # GET http://127.0.0.1:3000/api/v1/articles?tag=loko
    tags = params[:tags]#Tag.find_by(title: params[:tag])
    @article = @article.new_filter(tags) if tags

    if @article.blank?
      render json: { message: "Not found" }
    else
      render json: @article
    end
  end

  def create #POST /api/v1/articles
    @article = Article.create(article_params)
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

  def search
    @article = Article.where('title||body ILIKE ?', "%#{params[:q]}%")
    if @article.blank?
      render json: { message: "Not found article with your params" }
    else
      render json: { article: @article }
    end
  end

  def show #GET /api/v1/articles/:id
    if @article
      render json: @article
    else
      render json: @article.errors 
    end
  end
     
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :status, tag_ids: [])
  end
end