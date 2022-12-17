class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[show]

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      render json: { message: 'Tag created', tag: @tag }, status: :created
    else
      render json: @tag.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: { tag: Tag.all }, status: :ok
  end

  def show
    render json: { tag: @tag, article: @tag.articles }, status: :ok
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
