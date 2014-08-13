class AddResponsesToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :responses, :text
  end
end
