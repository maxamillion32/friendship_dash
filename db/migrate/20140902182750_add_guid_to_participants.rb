class AddGuidToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :guid, :string
  end
end
