class PhotosController < ApplicationController


  def index
    @photos = Photo.all.order("updated_at DESC")
    @photo = Photo.new
  end


  def create
    # @photo = Photo.new(photo_params)
    # @photo.user = current_user
    # @photo.save
    current_user.photos.create(photo_params)
    redirect_to root_path
  end

  def destroy

    @photo = Photo.find(params[:id])
    @photo.destroy if @photo.can_delete_by?(current_user)
    redirect_to root_path
  end

  protected

  def photo_params
    params.require(:photo).permit(:photo, :description)
  end

end
