class LikesController < ApplicationController
  before_action :set_photo

  def create
    @photos = Photo.all
    @photo = Photo.find(params[:photo_id])

    if @photo.find_like_by_user(current_user)
    else
      Like.create(:photo => @photo, :user => current_user)
    end
    # redirect_to root_url

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        @photo.reload
        render :template => "likes/reload"
      }
    end

  end

  def destroy

    like = current_user.likes.find(params[:id])
    if like
      like.destroy
    end
    # redirect_to root_url

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {
        @photo.reload
        render :template => "likes/reload"
      }
    end

  end

  private

  def set_photo
    @photos = Photo.all
    @photo = Photo.find(params[:photo_id])
  end
end
