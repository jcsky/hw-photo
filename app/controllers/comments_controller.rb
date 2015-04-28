class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.photo_id = params[:photo_id]
    @comment.user = current_user
    @comment.save
    # redirect_to :back
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @comment = Comment.find( params[:id] )
    @comment.delete
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:photo_id, :content)
  end

end
