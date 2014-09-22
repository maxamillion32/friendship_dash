class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to redirect_path(@user.role),
                  notice: "Successfully created user"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
        :first_name, :last_name, :pin,
        :email, :phone
    )
  end

  def redirect_path(user)
    case user.role
    when "Supervisor", "Researcher"
      supervisors_path
    when "Health Worker"
      health_workers_path
    when "Research Assistant"
      research_assistants_path
    end
  end
end