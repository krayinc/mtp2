class CreateVotings < ActiveRecord::Migration
  def self.up
    create_table :votings do |t|
      t.integer :user_id,     :null => false
      t.integer :votable_id,  :null => false
      t.string :votable_type, :null => false
      t.string :dimension

      t.timestamps
    end
    add_index :votings, [:votable_id, :votable_type]
    add_index :votings, [:user_id]
  end

  def self.down
    drop_table :votings
  end
end
