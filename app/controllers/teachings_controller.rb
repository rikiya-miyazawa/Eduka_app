class TeachingsController < ApplicationController
  before_action :set_teaching, only: %i(show edit update destroy)

  def new
    @user = User.find(params[:user_id])
    if @user.taught.ids.to_s.include?(current_user.id.to_s)
      @teaching = Teaching.new
    else
      redirect_to subject_path(params[:subject_id]),
      notice: t('view.share.notice.not_new')
    end
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
    if @teaching.user.taught.ids.to_s.include?(current_user.id.to_s)
    else
      redirect_to subject_path(@teaching.subject.id),
      notice: t('view.share.notice.not_edit')
    end
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
    if @teaching.user.taught.ids.to_s.include?(current_user.id.to_s)
      @teaching.destroy
      redirect_to subject_path(@teaching.subject_id),
      notice: t('view.teachings.notice.destroy_teaching')
    else
      redirect_to subject_path(@teaching.subject.id),
      notice: t('view.share.notice.not_destroy')
    end
  end

  private

  def teaching_params
    params.require(:teaching).permit(:date, :educator, :title, :content, :advice, :remarks, :user_id, :subject_id)
  end

  def set_teaching
    @teaching = Teaching.find(params[:id])
  end

end
