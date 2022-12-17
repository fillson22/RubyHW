class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: { message: 'LIKE!' }, status: :ok
    else
      render json: @like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      render json: { status: 'Delete' }, status: :ok
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id, :author_id)
  end
end
