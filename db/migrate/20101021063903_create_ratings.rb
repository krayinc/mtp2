class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :user_id,     :null => false
      t.integer :ratable_id,  :null => false
      t.string :ratable_type, :null => false
      t.integer :score,       :null => false, :default => 0
      t.string :dimension

      t.timestamps
    end
    add_index :ratings, [:ratable_id, :ratable_type]
    add_index :ratings, [:user_id]
  end

  def self.down
    drop_table :ratings
  end
end
