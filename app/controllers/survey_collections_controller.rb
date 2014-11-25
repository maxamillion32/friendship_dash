class SurveyCollectionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_survey_collection, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html, :json

  def index
    @search = SurveyCollection.search(params[:q])
    @survey_collections = @search.result
    respond_with(@survey_collections)
  end

  def show
    respond_with(@survey_collection)
  end

  def new
    @survey_collection = SurveyCollection.new
    respond_with(@survey_collection)
  end

  def edit
  end

  def create
    @survey_collection = SurveyCollection.new(survey_collection_params)
    @survey_collection.save
    respond_with(@survey_collection)
  end

  def update
    @survey_collection.update(survey_collection_params)
      respond_to do |format|
        format.js   { head :ok, content_type: "text/html" }
      end
  end

  def destroy
    @survey_collection.destroy
    respond_with(@survey_collection)
  end

  private
    def set_survey_collection
      @survey_collection = SurveyCollection.find(params[:id])
    end

    def survey_collection_params
      params.require(:survey_collection).permit(:group_id, :position, :survey_id)
    end
end
