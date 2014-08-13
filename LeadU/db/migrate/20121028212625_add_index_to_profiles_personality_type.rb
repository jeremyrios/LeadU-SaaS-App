class AddIndexToProfilesPersonalityType < ActiveRecord::Migration
  def change
    add_index :profiles, :personality_type, unique: true
  end
end
