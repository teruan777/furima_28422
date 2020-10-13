class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    # binding.pry
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: current_user.nickname
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
