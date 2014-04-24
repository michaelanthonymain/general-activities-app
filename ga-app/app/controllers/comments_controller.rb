class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params.merge(event_id: params[:event_id], user_id: session[:user_id]))
    @comment.save!
    redirect_to Event.find(11)  
  end 

  def destroy
    @comment.destroy
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content, :event_id)
  end

end