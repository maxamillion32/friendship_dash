class AddStatusToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :status, :string, default: "pending", nil: false
  end
end
