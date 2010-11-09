class CreateSiteConfigs < ActiveRecord::Migration
  def self.up
    create_table :site_configs do |t|
      t.string :name, :null => false
      t.text   :value
      t.text   :comment
      t.timestamps
    end
    add_index :site_configs, :name, :unique => true
  end

  def self.down
    drop_table :site_configs
  end
end
