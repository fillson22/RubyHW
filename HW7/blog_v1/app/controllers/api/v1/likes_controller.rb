class Api::V1::LikesController < ApplicationController
  def create
    
    @like = Like.new(like_params)
    
    if @like.save
      render json: { message: "LIKE!" }
    else
      render json: @like.errors.full_messages
    end
  end

  def destroy
   @like = Like.find(params[:id])
   @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id, :author_id)
  end
end