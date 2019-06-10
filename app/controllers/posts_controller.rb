class PostsController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc).all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)

    current_user.user_posts.create(post: @post)

    redirect_to post_path(@post)
  rescue => error
    flash.now[:error] = error.message
    render :new
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])

    @post.update(post_params)

    redirect_to post_path(@post)
  rescue => error
    flash.now[:error] = error.message
    render :edit
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def follow
    @post = Post.find_by(id: params[:id])

    current_user.user_posts.where(post: @post).first_or_create

    redirect_to post_path(@post)
  end

  def unfollow
    @post = Post.find_by(id: params[:id])

    current_user.user_posts.where(post: @post).delete_all

    redirect_to post_path(@post)
  end

  def resolved
    @post = current_user.posts.find_by(id: params[:id])

    @post.update({:resolved => true})

    redirect_to post_path(@post)
  end

  def new; end

  private

  def post_params
    params
      .require(:post)
      .permit(:header, :body)
  end
end
