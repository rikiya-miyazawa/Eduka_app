module RelationshipsHelper
  def choise_id(subordinate_id)
    Relationship.where(subordinate_id: subordinate_id).where(superior_id: current_user.id).first
  end
end
