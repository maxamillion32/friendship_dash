class Devise::RegistrationsController < DeviseController

  skip_before_filter :authenticate_user, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to after_sign_up_path_for(@user),
                  notice: "Successfully created #{@user.role}"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render failed_create_template(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :role, :last_name, :password, :password_confirmation, :pin, :email, :username, :phone)
  end

  def after_sign_up_path_for(user)
    case user.role
    when "Health Worker"
      health_workers_path
    when "Research Assistant"
      research_assistants_path
    else
      supervisors_path
    end
  end

  def failed_create_template(user)
    case user.role
    when "Health Worker"
      "health_workers/new"
    when "Research Assistant"
      "research_assistants/new"
    else
      "supervisors/new"
    end
  end
end