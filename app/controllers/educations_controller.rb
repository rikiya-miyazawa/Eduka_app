class EducationsController < ApplicationController
  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
  end

  def create
    Education.create(education_params)
    redirect_to educations_path
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
