class AddPhotoIdToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :photo_id, :integer
  end

  def self.down
    remove_column :plans, :photo_id
  end
end
