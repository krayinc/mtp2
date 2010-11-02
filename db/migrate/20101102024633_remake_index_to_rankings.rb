class RemakeIndexToRankings < ActiveRecord::Migration
  def self.up
    add_index :rankings, [:rankable_id, :rankable_type, :range]
    remove_index :rankings, :column => [:rankable_type, :range]
  end

  def self.down
    remove_index :rankings, :column => [:rankable_id, :rankable_type, :range]
    add_index :rankings, [:rankable_type, :range]
  end
end
