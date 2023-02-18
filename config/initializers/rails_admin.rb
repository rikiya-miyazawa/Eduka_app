RailsAdmin.config do |config|

  config.model 'User' do
    field :id
    field :profile_name
    field :email
  end

  config.model 'Education' do
    field :user_name
    field :name
    field :subjects
  end

  config.model 'Relationship' do
    field :superior_name
    field :subordinate_name
  end

  config.model 'Position' do
    field :user_name
    field :role
  end

  config.model 'Subject' do
    field :name
    field :status
    field :deadline
    field :education
    field :user_name
    field :teachings
  end

  config.model 'Affiliation' do
    field :user_name
    field :division
  end

  config.asset_source = :webpacker

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
