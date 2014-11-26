class RemoveDefaultStatusFromParticipant < ActiveRecord::Migration
  def change
    change_column_default :participants, :status, nil
  end
end
