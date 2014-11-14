class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :survey, index: true
      t.string :guid
      t.references :participant, index: true
      t.references :user, index: true
      t.datetime :timestamp
      t.string :response_value

      t.timestamps
    end
  end
end
