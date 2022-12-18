class Api::V1::CommentsController < ApplicationController
  before_action :set_article
  before_action :set_author
  before_action :set_comment, only: %i[show update destroy]

  def index # GET /api/v1/articles/:article_id/comments
    @comment = @article.comments.all

    from_status = params[:status]
    @comment = @comment.with_status(from_status) if from_status

    author_id = Author.find_by(name: params[:author])
    @comment = @comment.with_author(author_id.id) if author_id

    from_text_on_body = params[:search]
    @comment = @comment.where('body ILIKE ?', "%#{from_text_on_body}%") if from_text_on_body

    if @comment.blank?
      render json: { message: 'Not found' }
    else
      render json: { comment: @comment }
    end
  end

  def create # POST /api/v1/articles/:article_id/comments
    @comment = @article.comments.new(comment_params)
    if @comment.save
      render json: { status: 'Comment create!', data: @comment }
    else
      render json: @comment.errors
    end
  end

  def update # PATCH /api/v1/articles/:article_id/comments/:id
    if @comment.update(comment_params)
      render json: { status: 'Update', data: @comment }
    else
      render json: @comment.errors
    end
  end

  def destroy # DELETE /api/v1/articles/:article_id/comments/:id
    if @comment.destroy
      render json: { status: 'Delete' }
    else
      render json: @comment.errors
    end
  end

  def show # GET /api/v1/articles/:article_id/comments/:id
    if @comment
      render json: { comment: @comment, like: @comment.likes }
    else
      render json: { message: 'Not found' }
    end
  end

  private

  def set_article
    @article = Article.find_by_id(params[:article_id])
  end

  def set_author
    @author = Author.find_by_id(params[:author_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :author_id)
  end
end
