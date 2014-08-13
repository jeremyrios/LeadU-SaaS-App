class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :ei
      t.integer :ns
      t.integer :ft
      t.integer :jp
      t.string :personality_type
      t.integer :user_id

      t.timestamps
    end
  end
end
