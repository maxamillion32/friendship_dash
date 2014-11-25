module Api
  class GroupsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def index
      @groups = Group.all
      render "groups/index.json"
    end
  end
end
