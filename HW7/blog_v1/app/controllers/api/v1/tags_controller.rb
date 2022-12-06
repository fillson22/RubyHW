class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[ show ]

  def index
    render json: { tag: Tag.all }
  end

  def show
      render json: { tag: @tag, article: @tag.articles}
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

end