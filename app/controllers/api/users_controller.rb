module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!

    def index
      @users = User.all
      render "users/index.json"
    end
  end
end