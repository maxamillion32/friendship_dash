class SurveysController < ApplicationController
  before_action :authenticate_user!

  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html, :json

  def import
    Survey.import(params[:file])
    redirect_to surveys_url, notice: "Survey imported."
  end

  def index
    @search = Survey.search(params[:q])
    @surveys = @search.result
    respond_with(@surveys)
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
      params.require(:survey).permit(:group, :orderer, :survey_type, :language, :data_label, :content, :response0, :response0_value, :response1, :response1_value, :response2, :response2_value, :response3, :response3_value, :response4, :response4_value, :response5, :response5_value, :response6, :response6_value, :response7, :response7_value, :response8, :response8_value, :response9, :response9_value, :response10, :response10_value, :response11, :response11_value, :response12, :response12_value, :response13, :response13_value, :response14, :response14_value, :response15, :response15_value, :response16, :response16_value, :required)
    end
end
