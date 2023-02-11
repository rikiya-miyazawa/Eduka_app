class EducationsController < ApplicationController
  before_action :set_education, only: %i(show edit update destroy)

  def new
    @education = Education.new
    @education.status
  end

  def create
    @education = Education.new(education_params)
    if @education.save
      redirect_to educations_path, 
      notice: t('view.educations.notice.create_education')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      redirect_to educations_path,
      notice: t('view.educations.notice.update_education')
    else
      render :edit
    end
  end

  def list
    @user = User.find(params[:id])
  end

  def show
    @subjects = Subject.all
  end

  def destroy
    @education.destroy
    redirect_to educations_path,
    notice: t('view.educations.notice.destroy_education')
  end

  private

  def education_params
    params.require(:education).permit(:name, :user_id, status_attributes: %i(id purpose education_period created_date remarks _destroy))
    #使えたら%i記法にする
  end

  def set_education
    @education = Education.find(params[:id])
  end

end
