class DivisionsController < ApplicationController
  before_action :set_division, only: %i(edit update destroy)

  def index
    @divisions = Division.all
  end

  def new
    @division = Division.new
  end

  def create
    @division = Division.new(division_params)
    if @division.save
      redirect_to divisions_path, 
      notice: t('view.divisions.notice.create_division')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @division.update(division_params)
      redirect_to divisions_path,
      notice: t('view.divisions.notice.update_division')
    else
      render :edit
    end
  end

  private

  def division_params
    params.require(:division).permit(:name)
  end

  def set_division
    @division = Division.find(params[:id])
  end
end
