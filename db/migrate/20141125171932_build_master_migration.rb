class BuildMasterMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string   :email,                  default: "", null: false
        t.string   :encrypted_password,     default: "", null: false
        t.string   :reset_password_token
        t.datetime :reset_password_sent_at
        t.datetime :remember_created_at
        t.integer  :sign_in_count,          default: 0,  null: false
        t.datetime :current_sign_in_at
        t.datetime :last_sign_in_at
        t.string   :current_sign_in_ip
        t.string   :last_sign_in_ip
        t.datetime :created_at
        t.datetime :updated_at
        t.string   :role
        t.string   :pin
        t.string   :first_name
        t.string   :last_name
        t.string   :phone
        t.string   :guid

        t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :participants do |t|
      t.string :patient_identifier, null: false
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.string :phone
      t.integer :health_worker_id, index: true
      t.string   :guid
      t.string   :clinic
      t.integer  :research_assistant_id, index: true
      t.string   :status, default: "pending"

      t.timestamps
    end

    create_table :responses do |t|
      t.references :survey_question, index: true
      t.string :guid
      t.references :participant, index: true
      t.references :user, index: true
      t.datetime :timestamp
      t.string :response_value

      t.timestamps
    end

    create_table :surveys do |t|
      t.string :survey_name
      t.string :guid

      t.timestamps
    end

    create_table :groups do |t|
      t.string :group_name
      t.string :guid

      t.timestamps
    end

    create_table :survey_questions, force: true do |t|
        t.string :guid, null: false
        t.integer :orderer, null: false
        t.string :survey_type, null: false
        t.string :language, null: false
        t.string  :data_label
        t.text :content
        t.string   :response0
        t.string   :response0_value
        t.string   :response1
        t.string   :response1_value
        t.string   :response2
        t.string   :response2_value
        t.string   :response3
        t.string   :response3_value
        t.string   :response4
        t.string   :response4_value
        t.string   :response5
        t.string   :response5_value
        t.string   :response6
        t.string   :response6_value
        t.string   :response7
        t.string   :response7_value
        t.string   :response8
        t.string   :response8_value
        t.string   :response9
        t.string   :response9_value
        t.string   :response10
        t.string   :response10_value
        t.string   :response11
        t.string   :response11_value
        t.string   :response12
        t.string   :response12_value
        t.string   :response13
        t.string   :response13_value
        t.string   :response14
        t.string   :response14_value
        t.string   :response15
        t.string   :response15_value
        t.string   :response16
        t.string   :response16_value
        t.boolean  :required, default: false
        t.datetime :created_at
        t.datetime :updated_at
        t.integer   :survey_id, index: true
    end

     create_table :survey_collections do |t|
          t.references :survey, index: true
          t.references :group, index: true
          t.integer :position
          t.timestamps
    end
  end
end
