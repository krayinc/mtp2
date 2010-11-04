class CreateSpotPhotos < ActiveRecord::Migration
  def self.up
    create_table :spot_photos do |t|
      t.integer  :user_id, :null => false
      t.integer  :spot_id, :null => false
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :spot_photos
  end
end
