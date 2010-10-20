class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :commenter_id, :null => false
      t.integer :commentable_id, :null => false
      t.string :commentable_type, :null => false
      t.string :body, :null => false, :limit => 140
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:commenter_id]
  end

  def self.down
    drop_table :comments
  end
end
