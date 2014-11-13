class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :group, null: false
      t.string :guid, null: false
      t.integer :orderer, null: false
      t.string :type, null: false
      t.string :language, null: false
      t.string :data_label
      t.text :content
      t.string :response0
      t.string :response0_value
      t.string :response1
      t.string :response1_value
      t.string :response2
      t.string :response2_value
      t.string :response3
      t.string :response3_value
      t.string :response4
      t.string :response4_value
      t.string :response5
      t.string :response5_value
      t.string :response6
      t.string :response6_value
      t.string :response7
      t.string :response7_value
      t.string :response8
      t.string :response8_value
      t.string :response9
      t.string :response9_value
      t.string :response10
      t.string :response10_value
      t.string :response11
      t.string :response11_value
      t.string :response12
      t.string :response12_value
      t.string :response13
      t.string :response13_value
      t.string :response14
      t.string :response14_value
      t.string :response15
      t.string :response15_value
      t.string :response16
      t.string :response16_value
      t.boolean :required, default: false

      t.timestamps
    end
  end
end
