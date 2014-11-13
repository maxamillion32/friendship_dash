module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!

    def index
      @surveys = Survey.all
      render "surveys/index.json"
    end
  end
end
