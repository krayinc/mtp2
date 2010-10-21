class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.integer :position
      t.integer :plan_id, :null => false
      t.integer :spot_id, :null => false
      t.text    :comment
      t.string  :time
      t.timestamps
    end
    add_index :destinations, [:plan_id, :spot_id]
  end

  def self.down
    drop_table :destinations
  end
end
