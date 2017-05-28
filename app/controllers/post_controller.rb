class PostController < ApplicationController
  before_action :require_log_in
  def show

    @all_post = Post.all
  end

  def item
    @one_post = Post.find(params[:id])
    @comment = Comment.where(post_id: params[:id])
  end

  def create
  end

  def write

    post = Post.new

    uploader = NaflaUploader.new
    file = params[:pic]
    uploader.store!(file)

    post.title = params[:title]
    post.content = params[:content]
    post.user = current_user
    post.image_url = uploader.url

    post.save

    redirect_to "/item/#{post.id}"
  end

  def update
    @one_post = Post.find(params[:id])

    @one_post.title = params[:title]
    @one_post.content = params[:content]
    @one_post.save

    redirect_to "/item/#{@one_post.id}"
  end

  def update_view
    @one_post = Post.find(params[:id])
  end

  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy

    redirect_to '/show'
  end
end
