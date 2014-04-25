class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params.merge(event_id: params[:event_id], user_id: session[:user_id]))
    respond_to do |format|
        puts "In the response block."
       if @comment.save!
          format.html {redirect_to Event.find(@comment.event_id), notice: 'Comment posted successfully.'}
          format.js
      end
    end
  end


  def destroy
    @comment.destroy
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content, :event_id)
  end

end