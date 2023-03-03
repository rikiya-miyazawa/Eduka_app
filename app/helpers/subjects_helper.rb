module SubjectsHelper
  def subject_superior
    @subject.user.taught.ids.include?(current_user.id)
  end

  def subject_manager
    (current_user.roles.first.try(:name) == "manager" && @subject.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
