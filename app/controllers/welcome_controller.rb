class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @photo = Photo.all
  end

  def create
    @user = User.create( user_params )
  end



  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:photo)
  end

end
