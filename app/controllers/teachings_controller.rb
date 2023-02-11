class TeachingsController < ApplicationController
  before_action :set_teaching, only: %i(show edit update destroy)

  def new
    @teaching = Teaching.new
  end

  def create
    @teaching = Teaching.new(teaching_params)
    if @teaching.save
      redirect_to subject_path(@teaching.subject_id), 
      notice: t('view.teachings.notice.create_teaching')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @teaching.update(teaching_params)
      redirect_to subject_path(@teaching.subject_id),
      notice: t('view.teachings.notice.update_teaching')
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @teaching.destroy
    redirect_to subject_path(@teaching.subject_id),
    notice: t('view.teachings.notice.destroy_teaching')
  end

  private

  def teaching_params
    params.require(:teaching).permit(:date, :educator, :title, :content, :advice, :remarks, :user_id, :subject_id)
  end

  def set_teaching
    @teaching = Teaching.find(params[:id])
  end

end
