class ChangeBodyTypeToProfile < ActiveRecord::Migration
  def up
    change_column :profiles, :body, :text
  end

  def down
    change_column :profiles, :body, :string
  end
end
