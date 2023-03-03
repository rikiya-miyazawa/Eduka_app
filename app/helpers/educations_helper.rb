module EducationsHelper
  def education_superior
    @education.user.taught.ids.include?(current_user.id)
  end

  def education_manager
    (current_user.roles.first.try(:name) == "manager" && @education.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
