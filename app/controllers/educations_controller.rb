class EducationsController < ApplicationController
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

  def show
    @education = Education.find(params[:id])
  end

  private

  def education_params
    params.require(:education).permit(:name)
  end
end
