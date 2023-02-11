class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @user = current_user
  end
end
