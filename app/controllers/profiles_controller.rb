class ProfilesController < ApplicationController
  before_action :set_q, only: %i(index search)

  def index
    profiles = @q.result.includes(user: :affiliation_divisions)
    profiles = profiles.reject { |profile| profile.name == 'ゲスト' ||  profile.name == '管理者ゲスト' }
    @paginate_profiles = Kaminari.paginate_array(profiles).page(params[:page]).per(5)
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
