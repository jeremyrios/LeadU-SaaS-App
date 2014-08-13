class CreateSurveyMetrics < ActiveRecord::Migration
  def up
    create_table :survey_metrics do |t|
      t.timestamps
    end 
    add_column :survey_metrics, :question, :string
    add_column :survey_metrics, :target, :string
    add_column :survey_metrics, :name, :string
    add_column :survey_metrics, :total, :integer
    add_column :survey_metrics, :score, :integer
    add_column :survey_metrics, :accuracy, :float
    add_column :survey_metrics, :answer, :string
  end

  def down
    remove_column :survey_metrics, :answer, :string
    remove_column :survey_metrics, :accuracy, :float
    remove_column :survey_metrics, :score, :integer
    remove_column :survey_metrics, :total, :integer
    remove_column :survey_metrics, :name, :string
    remove_column :survey_metrics, :target, :string
    remove_column :survey_metrics, :question, :string
    drop_table :survey_metrics
  end    
end



