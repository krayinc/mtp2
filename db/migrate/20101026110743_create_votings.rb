class CreateVotings < ActiveRecord::Migration
  def self.up
    create_table :votings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :votings
  end
end
