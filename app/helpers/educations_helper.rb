module EducationsHelper
  def admin
    current_user.roles.first.try(:name) == "admin"
  end

  def superior
    @user.taught.ids.include?(current_user.id)
  end

  def manager
    (current_user.roles.first.try(:name) == "manager" && @user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end

  def education_superior
    @education.user.taught.ids.include?(current_user.id)
  end

  def education_manager
    (current_user.roles.first.try(:name) == "manager" && @education.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
