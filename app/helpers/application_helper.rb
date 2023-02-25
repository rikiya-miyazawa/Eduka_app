module ApplicationHelper
  def render_links_for_role(role_name)
    case role_name
    when 'admin'
      link_to '管理者画面', rails_admin_path
    else
      ''
    end
  end

  def admin_and_manager(rolename)
    case role_name
    when 'admin'
      
    end
  end

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

  def subject_superior
    @subject.user.taught.ids.include?(current_user.id)
  end

  def subject_manager
    (current_user.roles.first.try(:name) == "manager" && @subject.user.affiliation_divisions.exists?(id: current_user.affiliation_divisions.pluck(:id)))
  end
end
