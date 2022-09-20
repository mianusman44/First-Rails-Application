class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ destroy ]
  before_action :authenticate_admin_user!, only: %i[ create , destroy]



  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(:admin_user_id => current_admin_user.id))

    redirect_to post_path(@post)
  end



  # DELETE /comments/1 or /comments/1.json

  def destroy
    @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
    redirect_to post_path(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:commentor, :message, :post_id)
    end
end
