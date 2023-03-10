class TeachingsController < ApplicationController
  before_action :set_teaching, only: %i(show edit update destroy)

  def new
    @user = User.find(params[:user_id])
    if @user.id == current_user.id
      redirect_to subject_path(params[:subject_id]),
      notice: t('view.share.notice.not_new')
    elsif superior_new || admin || manager_new
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
      redirect_to new_teaching_path(subject_id: @teaching.subject.id, user_id: @teaching.user.id), 
      notice: t('view.teachings.notice.not_blrank')
    end
  end

  def edit
    if @teaching.user.id == current_user.id
      redirect_to subject_path(@teaching.subject.id),
      notice: t('view.share.notice.not_edit')
    elsif teachings_superior || admin || teachings_manager
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
    if @teaching.user.id == current_user.id
      redirect_to subject_path(@teaching.subject.id),
      notice: t('view.share.notice.not_destroy')
    elsif teachings_superior || admin || teachings_manager
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
  
  def teachings_superior
    @teaching.user.taught.ids.include?(current_user.id)
  end

  def teachings_manager
    (current_user.roles.first.try(:name) == "manager" && @teaching.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
