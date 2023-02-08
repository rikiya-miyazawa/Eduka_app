class EducationsController < ApplicationController
  bofore_action :set_education, only: %i(show edit update)
  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
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

  def show
  end

  private

  def education_params
    params.require(:education).permit(:name)
  end

  def set_education
    @education = Education.find(params[:id])
  end
  
end
