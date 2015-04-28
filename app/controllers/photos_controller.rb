class PhotosController < ApplicationController


  def index
    @photos = Photo.all.order("updated_at DESC")
    @photo = Photo.new
    # @comment = Comment.new
  end


  def create
    # @photo = Photo.new(photo_params)
    # @photo.user = current_user
    # @photo.save
    current_user.photos.create(photo_params)
    redirect_to :back
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy if @photo.can_delete_by?(current_user)
    redirect_to :back
  end

  def subscribe
    @photo = Photo.find( params[:id] )

    existing_subscription = @photo.find_subscription_by_user(current_user)
    unless existing_subscription
      @subscription = Subscription.create( :user => current_user, :photo => @photo)
    end

    redirect_to :back
  end

  def unsubscribe
    @photo = Photo.find( params[:id] )
    existing_subscription = @photo.find_subscription_by_user(current_user)

    existing_subscription.destroy
    redirect_to :back
  end

  protected

  def photo_params
    params.require(:photo).permit(:photo, :description)
  end

end
