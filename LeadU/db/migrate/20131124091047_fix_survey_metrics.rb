
class FixSurveyMetrics < ActiveRecord::Migration
  def up
    rename_column :survey_metrics, :score, :hits
    remove_column :survey_metrics, :target
    remove_column :survey_metrics, :answer
  end

  def down
    rename_column :survey_metrics, :hits, :score
    add_column :survey_metrics, :target
    add_column :survey_metrics, :answer
  end
end
