class GroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_group, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html, :json

  def index
    @groups = Group.all
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.save
    respond_with(@group)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:group_name, survey_ids: [])
    end
end
