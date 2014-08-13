class FixSurveyColumnName < ActiveRecord::Migration
  def up
    rename_column :surveys, :ns, :sn
    rename_column :surveys, :ft, :tf
  end

  def down
  	rename_column :surveys, :sn, :ns
    rename_column :surveys, :tf, :ft
  end
end
