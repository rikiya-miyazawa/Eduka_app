class ProfilesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @profiles = Profile.all
  end

  def show
    @user = current_user
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end
