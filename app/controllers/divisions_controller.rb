class DivisionsController < ApplicationController

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

  private

  def division_params
    params.require(:division).permit(:name)
  end


end
