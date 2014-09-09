class AddClinicToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :clinic, :string
  end
end
