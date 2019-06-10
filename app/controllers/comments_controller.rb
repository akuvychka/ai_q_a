class CommentsController < ApplicationController
  def create
    post = Post.find_by!(id: comment_params[:post_id])

    current_user.comments.create(comment_params)

    post.update(updated_at: Time.now)

    redirect_to post_path(post)
  end

  def rate_up
    comment = Comment.find_by!(id: params[:id])
    comment.rates.create(user: current_user, value: true)
    redirect_to post_path(comment.post_id)
  end

  def rate_down
    comment = Comment.find_by!(id: params[:id])
    comment.rates.create(user: current_user, value: false)
    redirect_to post_path(comment.post_id)
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:post_id, :text)
  end
end
