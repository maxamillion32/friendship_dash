RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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

  config.model User do
    
    object_label_method :username

    list do
      field :role
      field :first_name
      field :last_name
      field :username
      field :phone
      field :pin
      field :email
    end

    edit do
      field :role, :enum do
        enum do
          ['Researcher', 'Supervisor', "Research Assistant", "Health Worker"]
        end
      end
      field :email
      field :first_name
      field :last_name
      field :username
      field :phone
      field :pin
      field :password
      field :password_confirmation
    end
  end
  def username
    "#{self.username}" rescue "{self.email}"
  end
  config.model Participant do
      
      list do
        field :health_worker
        field :patient_identifier
        field :first_name
        field :last_name
        field :phone
        field :address
        field :city
      end

      edit do
        field :health_worker
        field :patient_identifier
        field :first_name
        field :last_name
        field :phone
        field :address
        field :city
      end
    end
end
