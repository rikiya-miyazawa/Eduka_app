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
end
