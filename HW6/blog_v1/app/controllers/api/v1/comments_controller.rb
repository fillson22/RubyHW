class Api::V1::CommentsController < ApplicationController
  
  before_action :set_article, only: %i[index create show  update destroy]
  before_action :set_author, only: %i[index create show  update destroy]
  before_action :set_comment, only: %i[show update destroy]
  
  def create #POST /api/v1/articles/:article_id/comments
    @comment = @article.comments.new(comment_params)
    if @comment.save
      render json: { status: "Comment create!", data: @comment }
    else
      render json: @comment.errors
    end
  end

  def index #GET /api/v1/articles/:article_id/comments
    @comment = @article.comments

    if @comment
      render json: @comment#.where(status: [:published])
    else
      render json: @comment.errors
    end
  end

  def update #PATCH /api/v1/articles/:article_id/comments/:id
    if @comment.update(comment_params) 
      render json: { status: "Update", data: @comment }
    else
      render json: @comment.errors
    end
  end

  def destroy #DELETE /api/v1/articles/:article_id/comments/:id
    if @comment.destroy
      render json: { status: "Delete" }
    else
      render json: @comment.errors
    end
  end
  
  def show #GET /api/v1/articles/:article_id/comments/:id
    if @comment
      render json: @comment#.where(status: [:published])
    else
      render json: { message: "Not found" }
    end  
  end

    private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_author
    @author = Author.find_by_id(params[:author_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id)
  end
end
