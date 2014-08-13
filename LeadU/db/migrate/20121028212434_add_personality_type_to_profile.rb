class AddPersonalityTypeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :personality_type, :string
  end
end
