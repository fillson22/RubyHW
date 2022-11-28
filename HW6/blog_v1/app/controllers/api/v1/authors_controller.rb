class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show create update destroy ]

  def create #POST /api/v1/authors
    @author = Author.new(author_params)
    if @author.save
      render json: { status: "Create new article", data: @author }
    else
      render json: @author.errors
    end
  end

  def author_index #GET /api/v1/authors/:author_id/comments
    @author = Author.find_by_id(params[:author_id])
    @comment_author = @author.comments.all

    if @comment_author
      render json: @comment_author
    else
      render json: @comment_author.errors
    end
  end

  def index #GET /api/v1/authors
    @authors = Author.all
    if @authors
      render json: { status: 'OK', data: @authors }
    else
      render json: @authors.errors, status: :bad_request
    end
  end

  def show #GEt /api/v1/authors/:id
    if @author
      render json: @author
    else
      render json: { message: "Not found" }
    end
  end

  def update #PATCH /api/v1/authors/:id
    if @author.update(author_params) 
      render json: { status: "Update", data: @author }
    else
      render json: @author.errors
    end
  end

  def destroy #DELETE /api/v1/authors/:id
    if @author.destroy
      render json: { status: "Delete" }
    else
      render json: @author.errors
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end