module Api
  class SurveysController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def index
      @surveys = Survey.all
      render "surveys/index.json"
    end
  end
end
