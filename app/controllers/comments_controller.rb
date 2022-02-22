class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to product_path(@comment.product), notice: 'The product has been successfully rated.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating, :user_id, :product_id)
  end
end
