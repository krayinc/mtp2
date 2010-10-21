class CreateSpots < ActiveRecord::Migration
  def self.up
    create_table :spots do |t|
      t.string  :name,      :null => false
      t.string  :latitude,  :null => false
      t.string  :longitude, :null => false
      t.string  :address,   :null => false
      t.text    :annotation
      t.timestamps
    end
  end

  def self.down
    drop_table :spots
  end
end
