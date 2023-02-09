class SubjectsController < ApplicationController
  before_action :set_subject, only: %i(show edit update destroy)

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to education_path(@subject.education_id), 
      notice: t('view.subjects.notice.create_subject')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      redirect_to educations_path(@subject.education_id),
      notice: t('view.subjects.notice.update_subject')
    else
      render :edit
    end
  end

  def show
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :status, :deadline, :education_id)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
