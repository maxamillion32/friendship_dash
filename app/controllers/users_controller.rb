class UsersController < ApplicationController
    def update
        @user = User.where(id: params[:id]).first
        if @user.update(user_params)
            redirect_to after_update_for(@user)
        else
            flash[:alert] = @user.errors.full_messages.join(", ")
            render failed_update_template(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :role, :last_name, :password, :password_confirmation, :pin, :email, :phone)
    end

    def after_update_for(user)
        case user.role
        when "Health Worker"
          health_workers_path
        when "Research Assistant"
          research_assistants_path
        else
          supervisors_path
        end
    end

    def failed_update_template(user)
        case user.role
        when "Health Worker"
          "health_workers/edit"
        when "Research Assistant"
          "research_assistants/edit"
        else
          "supervisors/edit"
        end
    end
end
