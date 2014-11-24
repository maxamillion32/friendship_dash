class SurveysController < ApplicationController
  before_action :authenticate_user!

  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html, :json

  def index
    @surveys = Survey.all
  end

  def show
    respond_with(@survey)
  end

  def new
    @survey = Survey.new
    respond_with(@survey)
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.save
    respond_with(@survey)
  end

  def update
    @survey.update(survey_params)
    respond_with(@survey)
  end

  def destroy
    @survey.destroy
    respond_with(@survey)
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:survey_name, survey_ids: [])
    end
end
