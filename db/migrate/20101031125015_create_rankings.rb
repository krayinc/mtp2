class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table :rankings do |t|
      t.integer :rankable_id, :null => false
      t.string :rankable_type, :null => false
      t.integer :point, :null => false
      t.integer :range

      t.timestamps
    end
    add_index :rankings, [:rankable_type, :range]
  end

  def self.down
    drop_table :rankings
  end
end
