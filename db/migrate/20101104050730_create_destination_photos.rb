class CreateDestinationPhotos < ActiveRecord::Migration
  def self.up
    create_table :destination_photos do |t|
      t.integer :destination_id, :null => false
      t.integer :photo_id,       :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :destination_photos
  end
end
