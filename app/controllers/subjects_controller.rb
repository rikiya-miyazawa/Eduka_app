class SubjectsController < ApplicationController
  before_action :set_subject, only: %i(show edit update destroy)

  def new
    @user = User.find(params[:user_id])
    if @user.id == current_user.id
      redirect_to education_path(params[:education_id]),
      notice: t('view.share.notice.not_new')
    elsif  superior_new || admin || manager_new
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
      redirect_to new_subject_path(education_id: @subject.education.id, user_id: @subject.user.id), notice: t('view.subjects.notice.not_blrank')
    end
  end

  def edit
    if @subject.user.id == current_user.id
      redirect_to education_path(@subject.education.id),
      notice: t('view.share.notice.not_edit')
    elsif subjects_superior || admin || subjects_manager
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
    @paginate_teachings = @subject.teachings.page(params[:page]).per(8)
    if params[:sort_date]
      @paginate_teachings = @subject.teachings.order(date: :desc).page(params[:page]).per(8)
    elsif params[:sort_educator]
      @paginate_teachings = @subject.teachings.order(educator: :desc).page(params[:page]).per(8)
    end
  end

  def destroy
    if @subject.user.id == current_user.id
      redirect_to education_path(@subject.education.id),
      notice: t('view.share.notice.not_destroy')
    elsif subjects_superior || admin || subjects_manager
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

  def subjects_superior
    @subject.user.taught.ids.include?(current_user.id)
  end

  def subjects_manager
    (current_user.roles.first.try(:name) == "manager" && @subject.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
