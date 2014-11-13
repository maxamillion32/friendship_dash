class ChangeColumnNameInSurvey < ActiveRecord::Migration
  def change
    rename_column :surveys, :type, :survey_type
  end
end
