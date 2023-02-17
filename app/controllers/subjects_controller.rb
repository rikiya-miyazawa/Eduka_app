class SubjectsController < ApplicationController
  before_action :set_subject, only: %i(show edit update destroy)

  def new
    @user = User.find(params[:user_id])
    if @user.taught.ids.to_s.include?(current_user.id.to_s) || current_user.roles.first.try(:name) == "admin" || (current_user.roles.first.try(:name) == "manager" && @user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id))) 
      @subject = Subject.new
    else
      redirect_to education_path(params[:education_id]),
      notice: t('view.share.notice.not_new')
    end
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
    if @subject.user.taught.ids.to_s.include?(current_user.id.to_s) || current_user.roles.first.try(:name) == "admin" || (current_user.roles.first.try(:name) == "manager" && @subject.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id))) 
    else
      redirect_to education_path(@subject.education.id),
      notice: t('view.share.notice.not_edit')
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to education_path(@subject.education_id),
      notice: t('view.subjects.notice.update_subject')
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @subject.user.taught.ids.to_s.include?(current_user.id.to_s) || current_user.roles.first.try(:name) == "admin" || (current_user.roles.first.try(:name) == "manager" && @subject.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
      @subject.destroy
      redirect_to education_path(@subject.education_id),
      notice: t('view.subjects.notice.destroy_subject')
    else
      redirect_to education_path(@subject.education.id),
      notice: t('view.share.notice.not_destroy')
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :status, :deadline, :user_id, :education_id)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
