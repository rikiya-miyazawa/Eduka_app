class RelationshipsController < ApplicationController

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = current_user.superior_relationships.create(relationship_params)
    if @relationship.save
      redirect_to profile_path(current_user.id), 
      notice: t('view.relationships.notice.add_relationship')
    else
      redirect_to profile_path(current_user.id),
      notice: t('view.relationships.notice.error_relationship')
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to profile_path(current_user.id),
      notice: t('view.relationships.notice.destroy_relationship')
  end
  private

  def relationship_params
    { subordinate_id: params[:subordinate_id]}
  end
end
