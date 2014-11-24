class CreateSurveyCollections < ActiveRecord::Migration
  def change
    create_table :survey_collections do |t|
      t.references :survey, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
