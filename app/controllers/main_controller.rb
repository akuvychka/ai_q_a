class MainController < ApplicationController
  def show
    @posts = Post.joins(:user_posts)
                  .where(user_posts: { user_id: current_user.id })
                  .order(updated_at: :desc)

    redirect_to posts_path if @posts.none?
  end
end
