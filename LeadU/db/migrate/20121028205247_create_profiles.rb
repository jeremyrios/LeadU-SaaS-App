class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :step_1
      t.string :step_2
      t.string :step_3
      t.string :step_4
      t.string :step_5
      
      t.string :video_link
      
      t.text :body
      
      t.timestamps
    end
  end
end
