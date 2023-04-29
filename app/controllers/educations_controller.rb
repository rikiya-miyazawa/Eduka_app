class EducationsController < ApplicationController
  before_action :set_education, only: %i(show edit update destroy)

  def new
    @user = User.find(params[:user_id])
      if @user.id == current_user.id 
        redirect_to list_education_path(@user.id),
        notice: t('view.educations.notice.not_new_education')
      elsif superior_new || admin || manager_new
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
      @education.user.affiliation_divisions.each do |division|
        redirect_to new_education_path(user_id: @education.user.id, division_id: division.id), 
        notice: t('view.educations.notice.not_blrank')
      end
    end
  end

  def edit
    if @education.user.id == current_user.id
      redirect_to list_education_path(@education.user.id),
      notice: t('view.educations.notice.not_edit_education')
    elsif educations_superior || admin || educations_manager
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
    if params[:sort_latest]
      @paginate_educations = @user.educations.latest.page(params[:page]).per(7)
    else
      @paginate_educations = @user.educations.page(params[:page]).per(7)
    end
    # @paginate_educations = @user.educations.page(params[:page]).per(7)
  end

  def show
  end

  def destroy
    if @education.user.id == current_user.id
      redirect_to list_education_path(@education.user.id),
      notice: t('view.educations.notice.not_destroy_education')
    elsif educations_superior || admin || educations_manager
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

  def educations_superior
    @education.user.taught.ids.include?(current_user.id)
  end

  def educations_manager
    (current_user.roles.first.try(:name) == "manager" && @education.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
