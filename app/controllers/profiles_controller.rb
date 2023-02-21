class ProfilesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @profiles = Profile.all
    @profiles = Profile.page(params[:page]).per(10)
  end

  def show
    @user = current_user
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Profile.ransack(params[:q])
  end
end
