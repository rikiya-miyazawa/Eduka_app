class EducationsController < ApplicationController
  before_action :set_education, only: %i(show edit update destroy)

  def new
    @user = User.find(params[:user_id])
    if @user.taught.ids.to_s.include?(current_user.id.to_s)
      @education = Education.new
      @education.status
    else
      redirect_to list_education_path(@user.id),
      notice: t('view.educations.notice.not_new_education')
    end
  end

  def create
    @education = Education.new(education_params)
    if @education.save
      redirect_to list_education_path(@education.user.id), 
      notice: t('view.educations.notice.create_education')
    else
      render :new
    end
  end

  def edit
    if @education.user.taught.ids.to_s.include?(current_user.id.to_s)
    else
      redirect_to list_education_path(@education.user.id),
      notice: t('view.educations.notice.not_edit_education')
    end
  end

  def update
    if @education.update(education_params)
      redirect_to list_education_path(@education.user.id),
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
    if @education.user.taught.ids.to_s.include?(current_user.id.to_s)
      @education.destroy
      redirect_to list_education_path(@education.user.id),
      notice: t('view.educations.notice.destroy_education')
    else
      redirect_to list_education_path(@education.user.id),
      notice: t('view.educations.notice.not_destroy_education')
    end
  end

  private

  def education_params
    params.require(:education).permit(:name, :user_id, :division_id,  status_attributes: %i(id purpose education_period created_date remarks _destroy))
  end

  def set_education
    @education = Education.find(params[:id])
  end

end
