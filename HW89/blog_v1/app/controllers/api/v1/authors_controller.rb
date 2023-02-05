class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show update destroy]

  def create # POST /api/v1/authors
    @author = Author.new(author_params)
    if @author.save
      render json: { status: 'Create new author', data: @author }, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def index # GET /api/v1/authors
    @author = Author.all
    if @author
      render json: { message: 'List of authors', authors: @author }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def show # GEt /api/v1/authors/:id
    if @author
      render json: { author: @author, comment: @author.comments }, status: :ok
    else
      render json: { message: 'Not found' }, status: :unprocessable_entity
    end
  end

  def update # PATCH /api/v1/authors/:id
    if @author.update(author_params)
      render json: { status: 'Update', data: @author }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy # DELETE /api/v1/authors/:id
    if @author.destroy
      render json: { status: 'Delete' }, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
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
