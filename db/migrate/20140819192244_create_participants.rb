class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :patient_identifier, null: false
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.string :phone
      t.integer :health_worker_id, index: true

      t.timestamps
    end
  end
end
