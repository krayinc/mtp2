class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.integer :user_id, :null => false
      t.string  :title,   :null => false
      t.integer :status,  :null => false, :limit => 1
      t.text    :outline
      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
