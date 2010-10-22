class AddPublicToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :public, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :plans, :public
  end
end
