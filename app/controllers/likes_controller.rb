class LikesController < ApplicationController
  def create
    @photos = Photo.all
    photo = Photo.find(params[:photo_id])

    if photo.find_like_by_user(current_user)
    else
      Like.create(:photo =>photo, :user => current_user)
    end
    redirect_to root_url
  end

  def destroy
    @photos = Photo.all
    like = current_user.likes.find(params[:id])
    if like
      like.destroy
    end
    redirect_to root_url
  end

  private


end
