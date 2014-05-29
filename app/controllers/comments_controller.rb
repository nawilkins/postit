class CommentsController < ApplicationController

  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "Comment created successfully."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    @post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    vote = Vote.create(voteable: comment, creator: current_user, vote: params[:vote])
    if vote.valid?
      flash[:notice] = "Your vote has been counted!"
    else
      flash[:error] = "You may only vote once per comment"
    end
    redirect_to :back
  end

end