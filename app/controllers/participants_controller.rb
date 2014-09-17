class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pending_participants = Participant.where(status: "pending")
    @inactive_participants = Participant.where(status: "ineligible")
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.where(id: params[:id]).first
    if @participant.update(participant_params)
      after_update_path
    else
      flash[:alert] = @participant.errors.full_messages.join(", ")
      render :index
    end
  end

  def activate
    @participant = Participant.find(params[:id])
    @chws = User.where(role: "Health Worker")
    @assistants = User.where(role: "Research Assistant")
  end

  private

  def participant_params
    params.require(:participant).permit(:status, :patient_identifier, :clinic, :first_name, :last_name, :address, :city, :phone, :guid)
  end

  def after_update_path
    redirect_to participants_path, notice: "Successfully updated participant"
  end
end