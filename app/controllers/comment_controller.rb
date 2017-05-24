class CommentController < ApplicationController

  def create
    @comment = Comment.new
    @comment.reply = params[:reply]
    @comment.post_id = params[:post_id]
    @comment.save

    redirect_to "/item/#{params[:post_id]}"
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy

    redirect_to "/item/#{params[:post_id]}"
  end
end
